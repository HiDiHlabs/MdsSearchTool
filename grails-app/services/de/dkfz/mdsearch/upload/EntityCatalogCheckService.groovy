/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.upload

import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.Group
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

class EntityCatalogCheckService {

    static transactional = false
    def mdrService
    def metaDataService

    private static final Log log = LogFactory.getLog(this)

    /**
     * Updates Entity Catalog by checking for changes at the MDR
     */
    def updateEntityCatalog() {
        Object entities = mdrService.catalogOfEntities
        Object root = entities.get("root")
        List codes = entities.get("codes")
        List rootEntities = root.subCodes
        List rootCodes = codes.findAll { it.code in rootEntities }
        int order = 0
        rootCodes.each { element ->

            log.info(element.designations[0].designation)
            List subCodes = element.subCodes
            List subEntities = codes.findAll { it.code in subCodes }
            Attribute attr = saveAttribute(element, subEntities)
            Group group = MdsCheckService.createGroup("Tumorentität", 9, "mds_k")
            MdsCheckService.createGroupAttribute(group, attr, order)
            order++
            subEntities.each { subElement ->

                log.info(" - ${subElement.designations[0].designation}")
                if (subElement.isValid == true) {
                    Object el = mdrService.getCatalogOfEntitiesElement(subElement.identification.urn)
                    el.each { listelement ->
                        if (listelement.get("slot_name").equals("DKTK_SEARCH")) {
                            def xmlslurper = new XmlSlurper()
                            def text = xmlslurper.parseText(listelement.get("slot_value"))
                            saveAttribute(subElement, text)
                        }

                    }
                }
            }
        }

    }


    private Attribute saveAttribute(def element, def subElements) {
        def urn = element.identification.urn
        String version = urn.substring(urn.lastIndexOf(":") + 1)
        String key = urn.substring(0, urn.lastIndexOf(":"))
        key = MdsCheckService.urnToKey(key)

        Attribute attribute = createAttribute(element, key, version)

        log.info("attribute name: ${attribute.getName()}")
        log.info("attribute key: ${attribute.getKey()}")
        log.info("attribute version: ${attribute.getKeyVersion()}")

        boolean hasValues = element.isValid
        log.info("hasValues: $hasValues")
        def listItems = []

        if (!hasValues) {
            subElements.each { subElement ->
                def item = []
                item.add((String) subElement.identification.urn)
                item.add((String) subElement.designations[0].designation)
                item.add((String) subElement.designations[0].definition)
                listItems.add(item)

                log.info("attribute item: ${item.get(0)}")
            }
        } else {
            log.info("elements added to list ..")

            subElements.children().each {
                it.children().each { subel ->
                    subel.children().each { subElement ->
                        def item = []

                        String value = subElement.children().getAt(1)
                        value = value.replace("%", "*")
                        String elkey = value
                        String elvalue = subElement.children().getAt(0)
                        String elvalue2 = value

                        log.info("element:   - $elkey : $elvalue")

                        item.add(elkey)
                        item.add(elvalue)
                        item.add(elvalue2)
                        listItems.add(item)
                    }
                }
            }
        }
        attribute.setListOfValues(MdsCheckService.createListOfValues(attribute, key, listItems))

        return metaDataService.createOrUpdateAttribute(attribute)
    }


    private Attribute createAttribute(def element, String key, String version) {
        Attribute attribute = Attribute.findByKey(key)

        if (!attribute) {
            attribute = new Attribute()
        }

        String definition = element.designations[0].definition
        String name = element.designations[0].designation
        attribute.setDescription(definition)
        attribute.setName(name)
        attribute.setKey(key)
        attribute.setKeyVersion(version)
        attribute.setEntityType(null)
        attribute.setGroupable(false)
        attribute.setNullable(true)
        attribute.setType(ValueType.LIST)

        return attribute
    }


}
