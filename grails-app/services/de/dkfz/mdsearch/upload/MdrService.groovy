/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.upload

import de.dkfz.mdsearch.config.ConfigService
import de.dkfz.mdsearch.config.MdSearchProperty
import groovyx.net.http.ContentType
import groovyx.net.http.HttpResponseDecorator
import groovyx.net.http.RESTClient
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.codehaus.groovy.grails.commons.GrailsApplication

/**
 * Service to retrieve information from the Meta Data Repository (MDR)
 *
 */
class MdrService {
    GrailsApplication grailsApplication
    Properties mediqueryProperties = ConfigService.parsePropertiesFile()

    static transactional = false

    final String MDR_BASE_URL = mediqueryProperties.getProperty(MdSearchProperty.MDR_BASE_URL.key)

    private static final Log log = LogFactory.getLog(this)

    /**
     * Returns the complete metadata for given URN
     * @param urn
     * @return JSON Metadata for given URN
     */
    public Object getMetaDataForAttribute(String urn) {
        return getMetaData("${MDR_BASE_URL}/dataelements/${urn}")
    }

    /**
     * get group members for a given group
     * @param group - URN of group
     * @return list of group members
     */
    public getGroups(String urn) {
        return getMetaData("${MDR_BASE_URL}/dataelementgroups/${urn}/members")
    }

    /**
     * get groups for given namespace
     * @param namespace - currently "dktk" or "adt" are supported
     * @return list of subgroups
     */
    public getRootGroups(String namespace) {
        return getMetaData("${MDR_BASE_URL}/namespaces/${namespace}/members")
    }

    /**
     * Entity Catalog
     * @return complete Catalog
     */
    public getCatalogOfEntities() {
        return getMetaData("${MDR_BASE_URL}/catalogs/urn:dktk:catalog:1:1/codes")
    }

    /**
     * get Element by urn
     * @param urn
     * @return
     */
    public getCatalogOfEntitiesElement(String urn) {

        return getMetaData("${MDR_BASE_URL}/catalogs/urn:dktk:catalog:1:1/codes/${urn}/slots")
    }


    private getMetaData(String path) {
        RESTClient rest = new RESTClient()
        rest.setUri(path)
        rest.setContentType(ContentType.JSON)
        rest.headers.put("Accept-Language", "de,en")
        log.info(rest.uri)
        HttpResponseDecorator hrd = rest.get([:]) as HttpResponseDecorator
        return hrd.data
    }


}
