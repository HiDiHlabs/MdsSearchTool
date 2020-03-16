/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.upload

import de.dkfz.ichip.entity.Entity
import de.dkfz.ichip.value.Value
import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.UploadController
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import definitions.MDS
import entity.ParsedEntity
import entity.PatientXmlParser
import mapping.UrnEntityMapping
import mapping.UrnEntityMappingException
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.text.SimpleDateFormat
import java.time.ZonedDateTime
import java.time.format.DateTimeFormatter
import java.util.zip.DataFormatException

/**
 * Upload Service to handle data from bridgehead
 *
 */
class UploadService {

    static transactional = false
    private static final Log log = LogFactory.getLog(this)


    private Map<String, String> urnEntity



    def dataService

    private PatientXmlParser patientXmlParser

    /*
    final def nsCase = new groovy.xml.Namespace("http://schema.samply.de/ccp/Case", 'ns7')
    final def nsSample = new groovy.xml.Namespace("http://schema.samply.de/ccp/Sample", 'ns8')
    final def nsAttribute = new groovy.xml.Namespace("http://schema.samply.de/ccp/Attribute", 'ns3')
    final def nsMdrKey = new groovy.xml.Namespace("http://schema.samply.de/ccp/MdrKey", 'ns5')
    final def nsValue = new groovy.xml.Namespace("http://schema.samply.de/ccp/Value", 'ns2')
*/

    UploadService() {
        initializeUrnEntity()
    }

    private void initializeUrnEntity() {
        try {

            UrnEntityMapping urnEntityMapping = new UrnEntityMapping();
            this.urnEntity = urnEntityMapping.getUrnEntity();

        } catch (UrnEntityMappingException e) {
            e.printStackTrace();
        }
    }


    /**
     * Saves the upload date and time for given site id and teiler id
     * @param siteid
     * @param teilerid
     * @return date and time
     */
    boolean setUploadTime(String siteid, String teilerid, String time) {

        def rootNode = new XmlParser().parseText(time)
        String rawDate = rootNode.LastUploadTimestamp.text()
        String RFC1123_DATE_PATTERN = "EEE, ppd MMM yyyy HH:mm:ss zzz";
        try {
            TimeZone.setDefault(TimeZone.getTimeZone("GMT"));
            DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern(RFC1123_DATE_PATTERN).withLocale(Locale.ENGLISH)
            ZonedDateTime uploadDate = ZonedDateTime.parse(rawDate, dateTimeFormatter)
            String dateOut = uploadDate.format(dateTimeFormatter)

            log.info("set new upload date for teiler ${teilerid}: " + dateOut)
            UploadTimeStamp uts = UploadTimeStamp.findBySiteAndTeiler(siteid, teilerid)
            if (uts == null) {
                uts = new UploadTimeStamp()
                uts.setSite(siteid)
                uts.setTeiler(teilerid)
            }
            uts.setLastUpload(dateOut)
            uts.save(flush: true)

            return true
        } catch (Exception exp) {
            log.error("Wrong date format:" + exp)
            throw new DataFormatException("Wrong date format: ${rawDate} \n Expected date format: ${RFC1123_DATE_PATTERN}")
        }
    }

    /**
     * Gives date and time for the last upload for given site and teiler
     * @param siteid
     * @param teilerid
     * @return date and time
     */
    String getUploadTime(String siteid, String teilerid) {

        UploadTimeStamp uts = UploadTimeStamp.findBySiteAndTeiler(siteid, teilerid)

        if (uts != null) {
            return uts.getLastUpload()
        } else {
            return "null"
        }
    }

    /**
     * Gives date and time for the last upload for given site and teiler
     * @param siteid
     * @param teilerid
     * @return date and time
     */
    void resetUploadTime(String siteid, String teilerid) {

        UploadTimeStamp uts = UploadTimeStamp.findBySiteAndTeiler(siteid, teilerid)

        if (uts != null) {
            uts.delete(flush: true)
        }
    }

    /**
     * Saves Patient with given input data
     * @param input - XML data which contains patient with optional cases and samples
     * @param siteId - site id of brueckenkopf
     * @param teilerId - teiler id of brueckenkopf
     * @return true if it is an update, false if it's a new patient
     */

    //TODO(David): rewrite method
    boolean deletePatientsWithPrefix(String prefix, String siteId, String teilerId) throws Exception {

        EntityType entityPatient = EntityType.findByKey(MDS.PATIENT.key)
        EntityType entityMdsK = EntityType.findByKey(MDS.MDS_K.key)
        EntityType entityMdsB = EntityType.findByKey(MDS.MDS_B.key)

        Map<Attribute, Value> patientmap = new HashMap<Attribute, Value>()
        Attribute siteIdAttr = Attribute.findByKey(MDS.PATIENT.getSiteID())
        Attribute teilerIdAttr = Attribute.findByKey(MDS.PATIENT.getTeilerID())
        patientmap.put(siteIdAttr, this.createValue(siteIdAttr, siteId))
        patientmap.put(teilerIdAttr, this.createValue(teilerIdAttr, teilerId))
        Set<Entity> result = dataService.findAllEntitiesByQueryParamsAndType(entityPatient, patientmap)
        log.info("looking for patients with prefix $prefix ...")
        Set<Entity> rawPatients = result.findAll {
            it.getValues().get(Attribute.findByKey(MDS.PATIENT.getID())).toString().startsWith(prefix)
        }
        List<Long> patients = rawPatients.collect { new Long(it.id) }

        Map<Attribute, Value> mdskmap = new HashMap<Attribute, Value>()
        Attribute siteIdAttrK = Attribute.findByKey(MDS.MDS_K.getSiteID())
        Attribute teilerIdAttrK = Attribute.findByKey(MDS.MDS_K.getTeilerID())
        mdskmap.put(siteIdAttrK, this.createValue(siteIdAttrK, siteId))
        mdskmap.put(teilerIdAttrK, this.createValue(teilerIdAttrK, teilerId))

        Set<Entity> rawMdsKs = dataService.findAllEntitiesByQueryParamsAndType(entityMdsK, mdskmap)

        Map<Attribute, Value> mdsbmap = new HashMap<Attribute, Value>()
        Attribute siteIdAttrB = Attribute.findByKey(MDS.MDS_B.getSiteID())
        Attribute teilerIdAttrB = Attribute.findByKey(MDS.MDS_B.getTeilerID())
        mdsbmap.put(siteIdAttrB, this.createValue(siteIdAttrB, siteId))
        mdsbmap.put(teilerIdAttrB, this.createValue(teilerIdAttrB, teilerId))

        Set<Entity> rawMdsBs = dataService.findAllEntitiesByQueryParamsAndType(entityMdsB, mdsbmap)

        List<Long> mdsK = rawMdsKs.findAll {
            it.parentId in patients && it.getValues().get(Attribute.findByKey(MDS.MDS_K.teilerID)).toString() == teilerId
        }.collect { new Long(it.id) }
        List<Long> mdsB = rawMdsBs.findAll {
            it.parentId in patients && it.getValues().get(Attribute.findByKey(MDS.MDS_B.teilerID)).toString() == teilerId
        }.collect { new Long(it.id) }
        log.info("---- delete ${mdsK.size()} definitions.MDS-Ks..---")
        if (mdsK.size() != 0)
            dataService.deleteAllEntitiesByIdsAndType(entityMdsK, mdsK)

        log.info("---- delete ${mdsB.size()} definitions.MDS-Bs ..---")

        if (mdsB.size() != 0)
            dataService.deleteAllEntitiesByIdsAndType(entityMdsB, mdsB)

        log.info("---- delete ${patients.size()} Patients ..---")

        if (patients.size() != 0)
            dataService.deleteAllEntitiesByIdsAndType(entityPatient, patients)

        log.info("---- Done.---")

        return true
    }

    /**
     * Saves Patient with given input data
     * @param input - XML data which contains patient with optional cases and samples
     * @param siteId - site id of brueckenkopf
     * @param teilerId - teiler id of brueckenkopf
     * @return true if it is an update, false if it's a new patient
     */

    /*
    Map<String, Object> updatePatient2(String input, String siteId, String teilerId) throws Exception {
        boolean update = true


        Node rootNode = new XmlParser().parseText(input)
        String patientId

        patientId = getDecryptedPatientId(rootNode.'@id' as String)


        Map<String, LinkedList<Map>> patients = this.createListOfEntities(rootNode, entityTypeCase, siteId, teilerId)

        if (!patients.get("Entities").isEmpty()) {
            if (!patientExist(patientId, siteId, teilerId, UploadController.UploadType.CASESAMPLE)) {
                update = false
                this.createPatient(patientId, siteId, teilerId)
            }
            Entity pat = this.findPatientById(patientId)
            LinkedList<Map<Attribute, Value>> cases = casesResult.get("Entities")
            LinkedList<Map<Attribute, Value>> samples = samplesResult.get("Entities")

            cases.each { Map<Attribute, Value> entityAttributemap ->
                log.info("save entity")
                EntityType entType = EntityType.findByKey(MDS.MDS_K.key)
                log.info("entitytype key: ${entType.key} pat: ${pat.id}")
                dataService.createEntity(entType, entityAttributemap, pat)
                log.info("saved entity")
            }

            Attribute attributeUpdateAt = new Attribute();
            attributeUpdateAt.setType(ValueType.DATE)
            attributeUpdateAt.setKey("updated_at")
            pat.getValues().put(attributeUpdateAt, ValueType.createValueForType(attributeUpdateAt.type).set(new Date()))
            if (update) {
                dataService.updateEntity(EntityType.findByKey(MDS.PATIENT.key), pat.getValues(), pat.getId())
            }
        }

        Entity patient = this.findPatientById(patientId)
        if (patient != null) {
            if (!hasCasesOrSamples(patient)) {
                dataService.deleteEntityByIdAndType(EntityType.findByKey(MDS.PATIENT.key), patient.getId())
            } else {
                patient.getValues()
            }
        }

        Map<String, Object> resultMapEntities = new HashMap<String, Object>()

        LinkedList<Map<String, String>> caseErrors = casesResult.get("Errors")
        LinkedList<Map<String, String>> sampleErrors = samplesResult.get("Errors")
        resultMapEntities.put("cases", caseErrors)
        resultMapEntities.put("samples", sampleErrors)
        resultMapEntities.put("casesTotalAccepted", String.valueOf(casesResult.get("Entities").size()))
        resultMapEntities.put("samplesTotalAccepted", String.valueOf(samplesResult.get("Entities").size()))
        resultMapEntities.put("update", update)

        return resultMapEntities

    }
    */

    Map<String, Object> updatePatient(String input, String siteId, String teilerId) throws Exception {

        ParsedEntity parsedEntity = getPatientXmlParser().read(input, siteId, teilerId)
        return parsedEntity.getErrorsMap()

    }


    /*
    private Entity createPatient(String patientId, String siteId, String teilerId) {

        Attribute siteid = Attribute.findByKey(MDS.PATIENT.getSiteID())
        Attribute teilerid = Attribute.findByKey(MDS.PATIENT.getTeilerID())
        Attribute patientid = Attribute.findByKey(MDS.PATIENT.getID())

        Value siteValue = this.createValue(siteid, siteId)
        Value teilerValue = this.createValue(teilerid, teilerId)
        Value patientidValue = this.createValue(patientid, patientId)
        Map<Attribute, Value> values = new HashMap<Attribute, Value>()

        values.put(siteid, siteValue)
        values.put(teilerid, teilerValue)
        values.put(patientid, patientidValue)

        return dataService.createEntity(EntityType.findByKey(MDS.PATIENT.key), values)
    }
*/

    boolean patientExist(String patientId, String siteId, String teilerId, UploadController.UploadType type) {
        log.info("patient id: ${patientId}")
        Entity patient = this.findPatientById(patientId)

        if (patient != null) {

            if (type == UploadController.UploadType.CASESAMPLE || type == UploadController.UploadType.CASE)
                this.deleteAllEntities(MDS_K, siteId, teilerId, patient)

            if (type == UploadController.UploadType.CASESAMPLE || type == UploadController.UploadType.SAMPLE)
                this.deleteAllEntities(MDS_B, siteId, teilerId, patient)

            return true
        }

        return false
    }

    private boolean hasCasesOrSamples(Entity patient) {

        def patientid = patient.getId()
        Attribute patid = new Attribute()

        patid.setKey("parent_id")
        patid.setType(ValueType.LONG)

        Value siteValue = this.createValue(patid, String.valueOf(patientid))
        Map<Attribute, Value> values = new HashMap<Attribute, Value>()
        values.put(patid, siteValue)

        Set<Entity> resk = dataService.findAllEntitiesByQueryParamsAndType(EntityType.findByKey(MDS.MDS_K.key), values)
        Set<Entity> resb = dataService.findAllEntitiesByQueryParamsAndType(EntityType.findByKey(MDS.MDS_B.key), values)

        if (resk.isEmpty() && resb.isEmpty())
            return false

        return true
    }


    private void deleteAllEntities(String entityType, String siteId, String teilerId, Entity patient) {
        Attribute siteid
        Attribute teilerid

        if (entityType.equals(MDS_K)) {
            siteid = Attribute.findByKey(MDS.MDS_K.getSiteID())
            teilerid = Attribute.findByKey(MDS.MDS_K.getTeilerID())
        } else {
            siteid = Attribute.findByKey(MDS.MDS_B.getSiteID())
            teilerid = Attribute.findByKey(MDS.MDS_B.getTeilerID())
        }

        Value siteValue = this.createValue(siteid, siteId)
        Value teilerValue = this.createValue(teilerid, teilerId)
        Map<Attribute, Value> values = new HashMap<Attribute, Value>()

        values.put(siteid, siteValue)
        values.put(teilerid, teilerValue)

        if (entityType.equals(MDS_K))
            dataService.deleteAllEntitiesByQueryParamsAndType(EntityType.findByKey(MDS.MDS_K.key), values, patient)
        else
            dataService.deleteAllEntitiesByQueryParamsAndType(EntityType.findByKey(MDS.MDS_B.key), values, patient)
    }

/*
    private Map<String, LinkedList<Map>> createListOfEntities(Node rootNode, String site, String teiler) {

        LinkedList<Map<Attribute, Value>> entities = new LinkedList<Map<Attribute, Value>>()
        LinkedList<Map<String, String>> entitiesWithErrors = new LinkedList<Map<String, String>>()
        Map<String, LinkedList<Map>> resultMapEntities = new HashMap<String, LinkedList<Map>>()

        def nsRootEntity

        if (entityType.equals(entityTypeCase)) {
            nsRootEntity = rootNode[nsCase.Case]
            log.info("Case")
        } else {
            nsRootEntity = rootNode[nsSample.Sample]
            log.info("Sample")
        }
        nsRootEntity.each { xmlEntity ->
            log.info("entity id: ${xmlEntity.'@id'}")
            Map<String, Map> entityAttributemapResult = createCaseOrSampleEntity(xmlEntity)

            if (entityAttributemapResult.get("Errors").size() == 0) {
                Map<Attribute, Value> entityAttributemap = entityAttributemapResult.get("Result")

                Attribute siteId
                Attribute teilerId
                Attribute entityId


                if (entityType.equals(entityTypeCase)) {
                    log.info("entitytype case")
                    siteId = Attribute.findByKey(MDS.MDS_K.getSiteID())
                    teilerId = Attribute.findByKey(MDS.MDS_K.getTeilerID())
                    entityId = Attribute.findByKey(MDS.MDS_K.getID())
                } else {
                    log.info("entitytype sample")

                    siteId = Attribute.findByKey(MDS.MDS_B.getSiteID())
                    teilerId = Attribute.findByKey(MDS.MDS_B.getTeilerID())
                    entityId = Attribute.findByKey(MDS.MDS_B.getID())
                }
                log.info("set ids")

                entityAttributemap.put(siteId, this.createValue(siteId, site))
                entityAttributemap.put(teilerId, this.createValue(teilerId, teiler))
                entityAttributemap.put(entityId, this.createValue(entityId, xmlEntity.'@id'))

                entities.add(entityAttributemap)
            } else {
                Map<String, String> entityAttributemapWithError = entityAttributemapResult.get("Errors")
                entityAttributemapWithError.put("entityId", xmlEntity.'@id')
                entitiesWithErrors.add(entityAttributemapWithError)
            }
        }
        resultMapEntities.put("Entities", entities)
        resultMapEntities.put("Errors", entitiesWithErrors)

        return resultMapEntities
    }

    private Map<String, Map> createCaseOrSampleEntity(def xmlEntity) {
        Map<String, Map> resultMap = new HashMap<String, Map>()
        Map<Attribute, Value> entityAttributemap = new HashMap<Attribute, Value>()
        Map<String, String> entityAttributemapErrors = new HashMap<String, String>()

        xmlEntity[nsAttribute.Attribute].each { xmlAttribute ->
            boolean isValid = true

            String mdrkey = xmlAttribute[nsMdrKey.MdrKey].text()
            String mdrkeyVersion = StringUtils.substringAfterLast(mdrkey, ":")
            String mdrkeyDB = UrnUtils.urnToKey(StringUtils.substringBeforeLast(mdrkey, ":"))

            Attribute attribute = Attribute.findByKey(mdrkeyDB)
            String val = xmlAttribute[nsValue.Value].text()
            if (attribute != null) {
                if (attribute.type == ValueType.LIST) {
                    def items = attribute.listOfValues?.getLoVItems()
                    if (items != null) {
                        if (!attribute.unit.equals(MdsCheckService.DataType.BOOLEAN.name())) {
                            if (!items.containsKey(val)) {
                                entityAttributemapErrors.put(mdrkey, val)
                                log.error("${attribute.key} has no value ${val}")
                                return
                            }
                        }
                    }
                }
                if (!attribute.format.equals("") && !attribute.format.equals("enumerated")) {
                    if (val.matches(attribute.format) || attribute.type.name().equals(MdsCheckService.DataType.DATE.name())) {
                        if (attribute.unit.equals(MdsCheckService.DataType.BOOLEAN.name()) && (val.equals("false") || val.equals("true"))) {
                            if (val.equals("false")) {
                                val = "f"
                            } else {
                                val = "t"
                            }
                        }

                        if (attribute.type.equals(ValueType.DATE)) {
                            if (!validateDate(val, attribute.format)) {
                                isValid = false
                                entityAttributemapErrors.put(mdrkey, val)
                                log.error(" Value: ${val} doesn't match given regular expression ${attribute.format} for dataelement ${mdrkey}")
                            }
                        }

                    } else {
                        entityAttributemapErrors.put(mdrkey, val)
                        log.error(" Value: ${val} doesn't match given regular expression for dataelement ${mdrkey}")
                        return
                    }
                }
                if (isValid) {
                    Value value = this.createValue(attribute, val)
                    entityAttributemap.put(attribute, value)
                }

                //Version of Attribute
                Attribute attributeV = new Attribute();
                attributeV.setType(ValueType.LONG)
                attributeV.setKey(attribute.key + "_version")
                log.info("attribute: $attributeV.key version: $mdrkeyVersion")
                if (isValid) {
                    Value valueVersion = this.createValue(attributeV, mdrkeyVersion)
                    entityAttributemap.put(attributeV, valueVersion)
                }
                log.info("${xmlAttribute[nsMdrKey.MdrKey].text()} : ${val}")
            } else {
                entityAttributemapErrors.put(mdrkey, val)
                log.error(" Mdr Key doesn't exist: ${mdrkey}")
            }
        }

        resultMap.put("Result", entityAttributemap)
        resultMap.put("Errors", entityAttributemapErrors)

        return resultMap
    }

    boolean validateDate(String date, String pattern) throws ParseException {
        String regex = pattern.replaceAll("\\w", "\\\\d").replace(".", "\\.");
        if (!date.matches(regex)) {
            return false;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        sdf.setLenient(false);
        try {
            sdf.parse(date);
        } catch (ParseException e) {
            return false;
        }
        return true;
    }
*/

    private Entity findPatientById(String patientid) {

        EntityType entp = EntityType.findByKey(MDS.PATIENT.key)
        Map<Attribute, Value> patientmap = new HashMap<Attribute, Value>()
        Attribute patientId = Attribute.findByKey(MDS.PATIENT.getID())
        patientmap.put(patientId, this.createValue(patientId, patientid))
        Set<Entity> res = dataService.findAllEntitiesByQueryParamsAndType(entp, patientmap)

        if (res.iterator().hasNext()) {
            return res.iterator().next()
        } else {
            return null
        }
    }


    private Value createValue(Attribute attribute, String value) {
        Value val = ValueType.createValueForType(attribute.type)

        if (attribute.type.equals(ValueType.DATE)) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(attribute.format)
            Date date = dateFormat.parse(value.toString())
            val.set(date)
        } else {
            val.set(value)
        }
        return val
    }


    /**
     * Saves Case with given input data for given patient
     * @param input - XML data which contains a case
     * @param encryptedPatientId - encrypted patient id
     * @param siteId - site id of brueckenkopf
     * @param teilerId - teiler id of brueckenkopf
     * @param caseId - case id
     * @return true if successful
     */
    /*
    boolean saveCase(String input, String encryptedPatientId, String siteId, String teilerId) {

        boolean update = true
        Node rootNode = new XmlParser().parseText(input)
        String patientId = getDecryptedPatientId(encryptedPatientId)

        if (!patientExist(patientId, siteId, teilerId, UploadController.UploadType.CASE)) {
            update = false
            this.createPatient(patientId, siteId, teilerId)
        }

        this.createListOfEntities(rootNode, entityTypeCase, siteId, teilerId)

        Entity patient = this.findPatientById(patientId)
        if (!hasCasesOrSamples(patient)) {
            dataService.deleteEntityByIdAndType(EntityType.findByKey(MDS.PATIENT.key), patient.getId())
        }
        return update
    }

     */

    /**
     * Saves Sample with given input data for given patient
     * @param input - XML data which contains a sample
     * @param encryptedPatientId - encrypted patient id
     * @param siteId - site id of brueckenkopf
     * @param teilerId - teiler id of brueckenkopf
     * @param caseId - case id
     * @return true if successful
     */
    /*
    boolean saveSample(String input, String encryptedPatientId, String siteId, String teilerId) {

        boolean update = true
        Node rootNode = new XmlParser().parseText(input)
        String patientId = getDecryptedPatientId(encryptedPatientId)


        if (!patientExist(patientId, siteId, teilerId, UploadController.UploadType.SAMPLE)) {
            update = false
            this.createPatient(patientId, siteId, teilerId)
        }

        this.createListOfEntities(rootNode, entityTypeSample, siteId, teilerId)

        Entity patient = this.findPatientById(patientId)
        if (!hasCasesOrSamples(patient)) {
            dataService.deleteEntityByIdAndType(EntityType.findByKey(MDS.PATIENT.key), patient.getId())
        }
        return update
    }
*/
    private PatientXmlParser getPatientXmlParser () {

        if (patientXmlParser == null) {
            patientXmlParser = new PatientXmlParser(dataService)
        }

        return patientXmlParser
    }



}
