/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch


import de.dkfz.mdsearch.HttpProxyUtils
import com.fasterxml.jackson.databind.JsonNode
import com.fasterxml.jackson.databind.ObjectMapper
import de.dkfz.ichip.query.*
import de.dkfz.ichip.value.StringValue
import de.dkfz.ichip.value.Value
import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import de.dkfz.mdsearch.upload.MDS
import de.dkfz.mdsearch.xml.*
import definitions.MDS
import grails.converters.JSON
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.apache.http.HttpResponse
import org.apache.http.HttpHost
import org.apache.http.client.HttpClient
import org.apache.http.conn.params.ConnRoutePNames
//import org.apache.http.impl.client.HttpClientBuilder
import org.apache.http.impl.client.DefaultHttpClient
import org.apache.http.client.methods.HttpPost
import org.apache.http.entity.StringEntity
import org.apache.http.protocol.HTTP
import org.codehaus.groovy.grails.commons.GrailsApplication

import javax.xml.bind.JAXBContext
import javax.xml.bind.Marshaller
import java.text.ParseException
import java.text.SimpleDateFormat

class SearchController {
    def springSecurityService
    def queryService
    def groupService
    GrailsApplication grailsApplication
    private static final Log log = LogFactory.getLog(this)

    List<EntityType> searchableEntityTypes = [EntityType.findByKey(MDS.PATIENT.key), EntityType.findByKey(MDS.MDS_B.key)]

    private HttpClient httpClient = getHttpClient()
    //private HttpClient httpClient = new DefaultHttpClient()

    private HttpClient getHttpClient(){

        String httpProxy = System.getenv("HTTP_PROXY")

        //HttpHost proxy = new HttpHost(MdrService.PROXY_HOST, MdrService.PROXY_PORT, "http")
        //HttpHost proxy = new HttpHost("dmzproxy01.inet.dkfz-heidelberg.de", 3128, "http")
        //HttpHost proxy = new HttpHost(httpProxy)
        HttpHost proxy = HttpProxyUtils.getHttpHost()
        HttpClient httpClient = new DefaultHttpClient()
        httpClient.getParams().setParameter(ConnRoutePNames.DEFAULT_PROXY, proxy)


        /*
        String httpProxy = System.getenv("HTTP_PROXY");
        HttpHost proxy = new HttpHost(httpProxy);
        //HttpClient httpClient = HttpClientBuilder.create().setProxy(proxy).build();
        HttpClient httpClient = new DefaultHttpClient();

         */

        return httpClient

    }


    /*
     * sets attribute from the database
     */

    def index() {
        LinkedHashMap<String, String> groupBy = [:]
        Attribute.findAllByGroupable(true).each {
            groupBy.put(it.key, it.name)
        }

        LinkedHashMap queryProperties = groupService.getGroupStructure()

        assert !groupBy.empty
        assert groupBy.each { it != null }
        assert !searchableEntityTypes.empty
        assert searchableEntityTypes.each { it != null }
        assert queryProperties
        return ["groups": queryProperties, groupBy: groupBy, entityTypes: [searchableEntityTypes[0]]]
    }

    private static Object convertJsonToXml(JsonNode node) {
        String op = node.get("op").asText()
        if (op == "AND" || op == "OR") {
            List<Object> list = []
            if (node.get("list").isArray()) {
                node.get("list").each { JsonNode objNode ->
                    list.add(convertJsonToXml(objNode))
                }
            }
            ConditionType o
            switch (op) {
                case "OR":
                    o = new Or()
                    break
                case "AND":
                    o = new And()
                    break
            }
            o.andOrEqOrLike.addAll(list)
            return o
        } else {
            String key = node.get("key").asText()
            Attribute attribute = Attribute.findByKey(key)
            String valueString = node.get("value").asText()
            String version = attribute.getKeyVersion()

            if (attribute.type.equals(ValueType.DATE)) {
                long datevalue = Long.parseLong(valueString, 10)
                String convertedDate
                if (attribute.getKey() == "urn_dktk_dataelement_83") {
                    convertedDate = convertDate(datevalue, "dd.MM.yyyy")
                } else {
                    convertedDate = convertDate(datevalue, attribute.format)
                }
                if (convertedDate != null) {
                    valueString = convertedDate
                } else {
                    log.error(" Date value ${valueString} doesn't match given regular expression ${attribute.format} for dataelement ${attribute.name} ${attribute.key}")
                }
            }

            de.dkfz.mdsearch.xml.Attribute attributeXML = new de.dkfz.mdsearch.xml.Attribute()
            attributeXML.setMdrKey("${attribute.getKey().replace("_", ":")}:$version")
            attributeXML.setValue(valueString)

            def o
            switch (op) {
                case "CO":    // contains
                case "SW":    // starts with
                    o = new Like()
                    break
                case "NE":    // not empty
                    o = new IsNotNull()
                    break
                case "EM":    // empty
                    o = new IsNull()
                    break
                case "EQ": // equals
                    o = new Eq()
                    break
                case "GT": //greater than
                    o = new Gt()
                    break
                case "LT": // less than
                    o = new Lt()
                    break
                case "GE": // greater equals
                    o = new Geq()
                    break
                case "LE": // less equals
                    o = new Leq()
                    break
                default:
                    log.error("JSON TO XML: The right case for ${op} couldn't be found")
            }
            switch (op) {
                case "NE":    // not empty
                case "EM":    // empty
                    o.setMdrKey(attributeXML.mdrKey)
                    break
                default:
                    o.setAttribute(attributeXML)
            }
            return o
        }
    }

    private static String convertDate(long msDate, String pattern) throws ParseException {

        SimpleDateFormat sdfOutput = new SimpleDateFormat(pattern)
        sdfOutput.setTimeZone(TimeZone.getTimeZone("GMT"))
        sdfOutput.setLenient(false)
        try {
            return sdfOutput.format(new Date(msDate))
        } catch (ParseException e) {
            log.error("Date value " + msDate + " returned error: ${e.message}")
            return null
        }
    }

    private static String convertJSonToXmlString(String json) {
        Query queryXML = new Query()
        Where where = new Where()
        where.andOrEqOrLike.addAll(convertJsonToXml(new ObjectMapper().readTree(json)))
        queryXML.setWhere(where)
        JAXBContext jaxbContext = JAXBContext.newInstance(Query.class);
        Marshaller jaxbMarshaller = jaxbContext.createMarshaller();
        StringWriter stringWriter = new StringWriter();
        jaxbMarshaller.marshal(queryXML, stringWriter);

        // Convert StringWriter to String
        return stringWriter.toString();
    }


    def sendQuery(ResultCommand cmd) {
        if (cmd.query != null) {
            log.info "${springSecurityService.principal.username} - query in JSON: ${cmd.query}"
            String query = convertJSonToXmlString(cmd.query)
            log.info "${springSecurityService.principal.username} - query in XML: $query"
            String url = getJsonResponse(query)
            if (url != null)
                render(text: "{\"url\":\"$url\"}", contentType: "application/json", encoding: "UTF-8", status: 201)
            else
                render(status: 400)
        } else
            render(status: 400)
    }


    private String getJsonResponse(String query) {

        def dcsUrl = grailsApplication.config.decentralsearch.forwarding.url
        HttpPost httpPost = new HttpPost(dcsUrl)
        log.info dcsUrl
        log.info "Authorization Bearer ${springSecurityService.principal.token}"

        httpPost.setHeader("Authorization", "Bearer ${springSecurityService.principal.token}")
        httpPost.setHeader(HTTP.CONTENT_TYPE, "application/xml;charset=UTF-8")
        httpPost.setEntity(new StringEntity(query, "UTF-8"))
        HttpResponse response = httpClient.execute(httpPost)
        try {

            log.info "status code received from DC Search: ${response.getStatusLine().getStatusCode()}"
            if (response.getStatusLine().getStatusCode() == 201) {
                log.info "location of new Query: ${response.getFirstHeader("Location").getValue()}"
                return response.getFirstHeader("Location").getValue()
            } else {
                return null
            }
        } finally {
            httpPost.releaseConnection()
        }
    }

    /*
     * executing the query, checking whether selected groupBy attribute is valid
     */

    def result(ResultCommand cmd) {
        log.info("${springSecurityService.principal.username} run query: $cmd.query")
        Condition condition = convertJsonToCondition(new ObjectMapper().readTree(cmd.query))
        Condition conditionTotalSample = convertJsonToCondition(new ObjectMapper().readTree('{"op":"EQ","key":"urn_dktk_dataelement_50","name":"Patienten+mit+Biomaterial","def":"Ja","value":"t"}'))
        Condition conditionTotalPatients = convertJsonToCondition(new ObjectMapper().readTree('{"list":[],"op":"AND"}'))

        // createAttribute new criteria object and restrict it to the selected project and entity type
        ICriteria criteria = queryService.createCriteria();
        criteria.restrictSelectionTo(EntityType.findByKey(cmd.entityType));
        criteria.restrictTo(condition)

        ICriteria criteriaTotalSample = queryService.createCriteria();
        criteriaTotalSample.restrictSelectionTo(EntityType.findByKey("patient"));
        criteriaTotalSample.restrictTo(conditionTotalSample)

        ICriteria criteriaTotalPatients = queryService.createCriteria();
        criteriaTotalPatients.restrictSelectionTo(EntityType.findByKey("patient"));
        criteriaTotalPatients.restrictTo(conditionTotalPatients)

        Map model = [:]

        Attribute groupBy = Attribute.findByKey(cmd.groupBy)
        if (!groupBy.groupable) {
            render(code: 403, message: "Group by is not allowed for ${groupBy.key}")
            return
        }

        LinkedHashMap<String, Integer> group = queryService.getResultGroupCount(criteria, groupBy, false)

        def etHits = [:]
        etHits.put(searchableEntityTypes[0].name + "Pos", queryService.getResultCount(criteriaTotalPatients, [searchableEntityTypes[0]], false)[0])

        if (cmd.query.contains("urn_dktk_dataelement_50")) {
            etHits.put(searchableEntityTypes[1].name + "Pos", queryService.getResultCount(criteriaTotalSample, [searchableEntityTypes[1]], false)[0])
        } else {
            etHits.put(searchableEntityTypes[1].name + "Pos", "")
        }

        List<Map<String, String>> values = []
        int patCount = 0

        for (Map.Entry<String, Integer> entry : group.entrySet()) {
            values.add(["group": entry.key, "def": entry.value])
            patCount += entry.value
        }

        if (cmd.query == '{"list":[],"op":"AND"}') {
            etHits.put(searchableEntityTypes[0].name, etHits.get(searchableEntityTypes[0].name + "Pos"))
        } else {
            etHits.put(searchableEntityTypes[0].name, patCount)
        }

        if (cmd.query.contains("urn_dktk_dataelement_50")) {
            etHits.put(searchableEntityTypes[1].name, queryService.getResultCount(criteria, [searchableEntityTypes[1]], false)[0])
        } else {
            etHits.put(searchableEntityTypes[1].name, "")
        }

        model.put("chart", values)
        model.put("hits", etHits)

        render model as JSON
    }

/*
    * executing the query, checking whether selected groupBy attribute is valid
    */

    def chartResult(ResultCommand cmd) {
        Condition condition = convertJsonToCondition(new ObjectMapper().readTree(cmd.query))

        // createAttribute new criteria object and restrict it to the selected project and entity type
        ICriteria criteria = queryService.createCriteria();
        criteria.restrictSelectionTo(EntityType.findByKey(cmd.entityType));
        criteria.restrictTo(condition)

        Attribute groupBy = Attribute.findByKey(cmd.groupBy)
        if (!groupBy.groupable) {
            render(code: 403, message: "Group by is not allowed for ${groupBy.key}")
            return
        }

        LinkedHashMap<String, Integer> group = queryService.getResultGroupCount(criteria, groupBy, false)
        List<Map<String, String>> values = []

        for (Map.Entry<String, Integer> entry : group.entrySet()) {
            values.add(["group": entry.key, "def": entry.value])
        }

        Map model = [:]
        model.put("chart", values)
        render model as JSON
    }

    /*
    * executing the query, checking whether selected groupBy attribute is valid
    */
    def patientsResult(ResultCommand cmd) {
        log.info("${springSecurityService.principal.username} run query: $cmd.query")
        Condition condition = convertJsonToCondition(new ObjectMapper().readTree(cmd.query))

        // createAttribute new criteria object and restrict it to the selected project and entity type
        ICriteria criteria = queryService.createCriteria();
        criteria.restrictSelectionTo(EntityType.findByKey(cmd.entityType));
        criteria.restrictTo(condition)

        Map model = [:]
        def etHits = [:]
        etHits.put(searchableEntityTypes[0].name, queryService.getResultCount(criteria, [searchableEntityTypes[0]], false)[0])
        model.put("hits", etHits)
        render model as JSON
    }


    def samplesResult(ResultCommand cmd) {
        log.info("${springSecurityService.principal.username} run query: $cmd.query")
        Condition condition = convertJsonToCondition(new ObjectMapper().readTree(cmd.query))

        // createAttribute new criteria object and restrict it to the selected project and entity type
        ICriteria criteria = queryService.createCriteria();
        criteria.restrictSelectionTo(EntityType.findByKey(cmd.entityType));
        criteria.restrictTo(condition)

        Map model = [:]
        def etHits = [:]
        if (cmd.query.contains("urn_dktk_dataelement_50")) {
            etHits.put(searchableEntityTypes[1].name, queryService.getResultCount(criteria, [searchableEntityTypes[1]], false)[0])
        } else {
            etHits.put(searchableEntityTypes[1].name, "")
        }
        model.put("hits", etHits)
        render model as JSON
    }

    def samplesTotal(ResultCommand cmd) {
        Condition conditionTotalSample = convertJsonToCondition(new ObjectMapper().readTree('{"op":"EQ","key":"urn_dktk_dataelement_50","name":"Patienten+mit+Biomaterial","def":"Ja","value":"t"}'))

        // createAttribute new criteria object and restrict it to the selected project and entity type
        ICriteria criteriaTotalSample = queryService.createCriteria();
        criteriaTotalSample.restrictSelectionTo(EntityType.findByKey("patient"));
        criteriaTotalSample.restrictTo(conditionTotalSample)

        Map model = [:]
        def etHits = [:]
        if (cmd.query.contains("urn_dktk_dataelement_50")) {
            etHits.put(searchableEntityTypes[1].name + "Pos", queryService.getResultCount(criteriaTotalSample, [searchableEntityTypes[1]], false)[0])
        } else {
            etHits.put(searchableEntityTypes[1].name + "Pos", "")
        }
        model.put("hits", etHits)
        render model as JSON
    }

    def patientsTotal(ResultCommand cmd) {
        Condition conditionTotalPatients = convertJsonToCondition(new ObjectMapper().readTree('{"list":[],"op":"AND"}'))

        // createAttribute new criteria object and restrict it to the selected project and entity type
        ICriteria criteriaTotalPatients = queryService.createCriteria();
        criteriaTotalPatients.restrictSelectionTo(EntityType.findByKey("patient"));
        criteriaTotalPatients.restrictTo(conditionTotalPatients)

        Map model = [:]
        def etHits = [:]
        etHits.put(searchableEntityTypes[0].name + "Pos", queryService.getResultCount(criteriaTotalPatients, [searchableEntityTypes[0]], false)[0])
        model.put("hits", etHits)
        render model as JSON
    }

    /**
     * convert the transmitted JSON string to an Condition
     * Example for JSON: {op: "AND", list:[{key:"urn:..",op:"NE",value:"32"},{op:"OR",list:[{key:"urn..",op:"EQ",value:"test"},{...}]]}* @param node
     * @return
     */
    private static Condition convertJsonToCondition(JsonNode node) {
        String op = node.get("op").asText()
        if (op == "AND" || op == "OR") {
            List<Condition> list = []
            if (node.get("list").isArray()) {
                node.get("list").each { JsonNode objNode ->
                    list.add(convertJsonToCondition(objNode))
                }
            }
            return new ConditionList(LogicalOperator.valueOf(op), list)
        } else {
            String key = node.get("key").asText()
            Attribute attribute = Attribute.findByKey(key)
            String valueString = node.get("value").asText()
            Value value = ValueType.createValueForType(attribute.type).set(valueString)
            Comparator comparator

            // cover special cases of operator
            switch (op) {
                case "CO":    // contains
                    //value = "%"+value+"%"
                    value = new StringValue().set("%" + valueString + "%")
                    comparator = Comparator.LK
                    break
                case "SW":    // starts with
                    //value = value+"%"
                    value = new StringValue().set(valueString + "%")
                    comparator = Comparator.LK
                    break
                case "NE":    // not empty
                    comparator = Comparator.NN
                    break
                case "EM":    // empty
                    comparator = Comparator.IN
                    break
                default:
                    comparator = Comparator.valueOf(op.toString())
            }
            return new EavCondition(attribute.entityType, attribute, comparator, value)
        }
    }
}

class ResultCommand {
    String entityType
    String query
    String groupBy
}
