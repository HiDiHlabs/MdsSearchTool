/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import de.dkfz.mdsearch.util.XMLValidator
import grails.converters.JSON
import grails.converters.XML
import grails.plugin.springsecurity.SpringSecurityUtils
import groovy.time.TimeCategory
import groovy.time.TimeDuration
import groovy.xml.StreamingMarkupBuilder
import mapping.TeilerWhitelistReader
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.springframework.security.access.AccessDeniedException
import org.xml.sax.SAXException


class UploadController {

    def uploadService
    def springSecurityService
    def queryService

    private static final Log log = LogFactory.getLog(this)
    private Set<String> teilerWhitelist


    enum UploadType {
        CASESAMPLE,
        CASE,
        SAMPLE;
    }

    private Map<String, String> uploadEntity(String siteid, String teilerid, String xmlEntity) throws SAXException, Exception {

        verifyTeilerId(teilerid)

        log.info("----- Raw Data Start--------------")
        log.info(xmlEntity)
        log.info("----- Raw Data End--------------")

        Date startDate = new Date()

        log.info("Validating input data ...")
        XMLValidator.validate(xmlEntity)
        log.info("Input data is valid")


        log.info("---------- Start Loading Patients from $teilerid -------------------")
        Map<String, Object> result = uploadService.updatePatient(xmlEntity, siteid, teilerid)

        Date endDate = new Date()
        TimeDuration td = TimeCategory.minus(endDate, startDate)

        log.info("Time: ${td}")
        log.info("---------- FINISHED -------------------")

        return result

    }

    def update(){

        def writer = new StringWriter()
        writer << new StreamingMarkupBuilder().bind { mkp.yield request.getXML() }
        String xmlStr = writer.toString()

        String siteid = params.siteid as String
        String teilerid = params.teilerid as String
        String patientid = params.patientid as String
        siteid = siteid.toLowerCase()

        Map<String, Object> result = uploadEntity(siteid, teilerid, xmlStr)

        render (status: 200)
        //TODO:Process errors

    }

    def update2() {

        try {
            def writer = new StringWriter()
            writer << new StreamingMarkupBuilder().bind { mkp.yield request.getXML() }
            String xmlStr = writer.toString()

            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            String patientid = params.patientid as String
            siteid = siteid.toLowerCase()

            Map<String, Object> result = uploadEntity(siteid, teilerid, xmlStr)


            if (((LinkedList<Map<String, String>>) result.get("cases")).size() == 0 && ((LinkedList<Map<String, String>>) result.get("samples")).size() == 0) {
                if ((boolean) result.get("update")) {
                    render(status: 200)
                } else {
                    render(status: 201)
                }
            } else {
                LinkedList<Map<String, String>> cases = ((LinkedList<Map<String, String>>) result.get("cases"))

                log.error("<Patient id='${patientid}'>")
                log.error(" <Cases declined=${cases.size()} accepted=${result.get("casesTotalAccepted")}>")
                for (caseError in cases) {
                    log.error("     <Case id='${caseError.get("entityId")}'>")
                    for (caseAttr in caseError) {
                        if (!caseAttr.key.equalsIgnoreCase("entityId")) {
                            log.error("         <Attribute key='${caseAttr.key}' >${caseAttr.value}</Attribute>")
                        }
                    }
                    log.error("     </Case>")
                }
                log.error(" </Cases>")
                log.error("</Patient>")

                render(status: 400)
            }

        } catch (SAXException saxexp) {

            log.error("XML Input is not valid $saxexp")
            render(text: "<ERROR><INFO>Data is not valid</INFO><MESSAGE>${saxexp.message}</MESSAGE></ERROR>", contentType: "text/xml", encoding: "UTF-8", status: 400)

        }
        catch (Exception exp) {

            log.error(exp.message, exp)
            render(text: "<Error>${exp.message}</Error>", contentType: "text/xml", encoding: "UTF-8", status: 400)
        }
    }

/*
    def uploadCase() {

        try {
            def writer = new StringWriter()
            writer << new StreamingMarkupBuilder().bind { mkp.yield request.getXML() }
            String xmlStr = writer.toString()

            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            String patientid = params.patientid as String
            String caseid = params.caseid as String
            boolean update = uploadEntity(siteid, teilerid, patientid, xmlStr, caseid, UploadType.CASE)

            if (update)

                render(status: 200)
            else
                render(status: 201)

        } catch (SAXException saxexp) {
            log.error("XML Input is not valid $saxexp")
            render(text: "<ERROR><INFO>Data is not valid</INFO><MESSAGE>${saxexp.message}</MESSAGE></ERROR>", contentType: "text/xml", encoding: "UTF-8", status: 400)

        } catch (Exception exp) {
            log.error(exp.message, exp)
            render(text: "<Error>${exp.message}</Error>", contentType: "text/xml", encoding: "UTF-8", status: 400)
        }

    }


    def uploadSample() {

        try {
            def writer = new StringWriter()
            writer << new StreamingMarkupBuilder().bind { mkp.yield request.getXML() }
            String xmlStr = writer.toString()

            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            String patientid = params.patientid as String
            String sampleid = params.sampleid as String

            boolean update = uploadEntity(siteid, teilerid, patientid, xmlStr, sampleid, UploadType.SAMPLE)

            if (update)
                render(status: 200)
            else
                render(status: 201)

        } catch (SAXException saxexp) {
            log.error("XML Input is not valid $saxexp")
            render(text: "<ERROR><INFO>Data is not valid</INFO><MESSAGE>${saxexp.message}</MESSAGE></ERROR>", contentType: "text/xml", encoding: "UTF-8", status: 400)

        }
        catch (Exception exp) {
            log.error(exp.message, exp)
            render(text: "<Error>${exp.message}</Error>", contentType: "text/xml", encoding: "UTF-8", status: 400)
        }


    }
*/

    def uploadStats() {

        try {
            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            siteid = siteid.toLowerCase()

            verifyTeilerId(teilerid)

            def time = uploadService.getUploadTime(siteid, teilerid)

            render(text: "<Uploadstats><LastUploadTimestamp>${time}</LastUploadTimestamp></Uploadstats>", contentType: "text/xml", encoding: "UTF-8", status: 200)
        } catch (Exception exp) {
            log.error(exp.message, exp)
            render(status: 400)
        }
    }


    def resetUploadStats() {

        try {
            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            siteid = siteid.toLowerCase()

            verifyTeilerId(teilerid)

            uploadService.resetUploadTime(siteid, teilerid)

            render(status: 200)
        } catch (Exception exp) {
            log.error(exp.message, exp)
            render(status: 400)
        }
    }

    def setUploadStats() {

        try {
            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            siteid = siteid.toLowerCase()

            verifyTeilerId(teilerid)

            def writer = new StringWriter()
            writer << new StreamingMarkupBuilder().bind { mkp.yield request.getXML() }
            String xmlStr = writer.toString()

            uploadService.setUploadTime(siteid, teilerid, xmlStr)

            render(status: 200)
        } catch (Exception exp) {
            log.error(exp.message, exp)
            render(text: "<Error>${exp.message}</Error>", contentType: "text/xml", encoding: "UTF-8", status: 400)
        }
    }

    def getMonitoringStats() {

        try {

            String sites = (params.site as String).toLowerCase()
            Integer days = params.int('ndays')
            sites = sites.toLowerCase()
            String teilerId
            if (!(SpringSecurityUtils.ifAllGranted("ROLE_ADMIN") || SpringSecurityUtils.ifAllGranted("ROLE_MONITORING"))) {
                teilerId = springSecurityService.principal.username.toLowerCase()
            }

            if (days) {
                if (days < 1 || days > 31) {
                    days = -100
                }
            }

            def totalPats
            def totalRecent
            def totalwithRecent = []

            if (days != -100) {
                totalPats = queryService.getTotalBySite(false) as List<ArrayList>
                totalRecent = queryService.getTotalBySite(true, days ?: 14) as List<ArrayList>

                for (ArrayList entry : totalPats) {
                    ArrayList temp = entry
                    ArrayList temp2 = totalRecent.find { it[1].toString() == entry[1].toString() }
                    temp.add(temp2 ? temp2[2] : 0)
                    if (teilerId) {
                        if (teilerId.toLowerCase() == temp[1].toString().toLowerCase()) {
                            if (sites == temp[0] as String) {
                                totalwithRecent.add(temp)
                            } else {
                                throw new AccessDeniedException("Wrong Teiler ID")
                            }
                        }
                    } else {
                        if (sites == temp[0] as String || sites == "all") {
                            totalwithRecent.add(temp)
                        }
                    }

                }
            }

            def preFormattedResultMap = totalwithRecent.collect { ArrayList entry ->
                [site: entry[0].toString().capitalize(), total: entry[2], recent: entry[3]]
            }
            withFormat {
                html {
                    response.status = 200
                    render preFormattedResultMap
                }
                json {
                    response.status = 200
                    render preFormattedResultMap as JSON
                }
                xml {
                    response.status = 200
                    render preFormattedResultMap as XML
                }
            }
        } catch (Exception exp) {
            log.error(exp.message, exp)
            render(status: 400)
        }
    }


    def deletePatientsWithPrefix() {

        try {
            String prefix = "ANO_"
            String siteid = params.siteid as String
            String teilerid = params.teilerid as String
            String temp = params.prefix as String
            if (temp != null) {
                if (!temp.equals("")) {
                    prefix = temp
                }
            }

            log.info("---------- Start Deleting all Patients from $teilerid  with Prefix $prefix-------------------")

            verifyTeilerId(teilerid)

            uploadService.deletePatientsWithPrefix(prefix, siteid, teilerid)
            log.info("---------- Done Deleting all Patients from $teilerid  with Prefix $prefix-------------------")

            render(status: 200)
        } catch (Exception exp) {
            log.error(exp.message, exp)
            render(status: 400)
        }

    }

    private verifyTeilerId(String teilerId) throws AccessDeniedException {

        if (!isTeilerIdInWhitelist(teilerId) || teilerId.toLowerCase() != springSecurityService.principal.username.toLowerCase()) {
            log.info teilerId + " " + springSecurityService.principal.username
            throw new AccessDeniedException("Wrong Teiler ID")
        }

    }

    private boolean isTeilerIdInWhitelist(String teilerId){

        if (teilerWhitelist == null){

            TeilerWhitelistReader teilerWhitelistReader = new TeilerWhitelistReader()
            teilerWhitelist = teilerWhitelistReader.getTeilerWhiteList()

        }

        return teilerWhitelist.contains(teilerId.toLowerCase())

    }

}
