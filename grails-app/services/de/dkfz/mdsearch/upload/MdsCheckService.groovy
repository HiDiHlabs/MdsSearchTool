/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.upload

import de.dkfz.ichip.value.ValueType
import definitions.MDS
import mapping.UrnEntityMapping
import de.dkfz.mdsearch.metadata.*
import mapping.UrnEntityMappingException
import mapping.UrnUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

/**
 *
 *
 *
 */
class MdsCheckService {
    static transactional = false

    def mdrService
    def metaDataService

    private static final Log log = LogFactory.getLog(this)
    Map<String, String> urnEntity


    MdsCheckService() {
        initializeUrnEntity()
    }

    private void initializeUrnEntity() {
        try {

            UrnEntityMapping urnEntityMapping = new UrnEntityMapping()
            this.urnEntity = urnEntityMapping.getUrnEntity()

        } catch (UrnEntityMappingException e) {
            e.printStackTrace()
        }
    }



    final String[] NAMESPACE = ["dktk", "adt", "marker"]
    //TODO(David): add list of namespaces: adt, dktk, marker
    final String URN_ATTRIBUTE_AGE_PREFIX = "urn_dktk_dataelement_1"
    final String URN_ATTRIBUTE_SEX_PREFIX = "urn_dktk_dataelement_28"

    /**
     * Checks and updates all attributes and groups with the MDR
     * @return true if successful
     */
    public boolean checkAndUpdateAttributes() {
        try {
            def rootGroups = mdrService.getRootGroups(NAMESPACE)
            //assert rootGroups.results.size() == rootGroups.totalcount

            MDS.values().each { mds ->
                createEntityType(mds.key, mds.name, EntityType.findByKey(mds.parentKey), mds.order, mds)
            }

            rootGroups.each { group ->

                def name = group.designations.definition.get(0)
                def urn = group.id
                updateListOfGroups(name, urn)

            }

            log.info(" ---- done ----")

            return true

        } catch (Exception e) {

            log.info("Updating definitions.MDS failed:")
            log.info(e.message, e)
            log.info(" ---------- ")

            return false

        }
    }


    private Attribute createAttributeId(String key, String name, String description, EntityType ent) {
        Attribute attribute = Attribute.findByKey(key)
        if (!attribute) {
            attribute = new Attribute()
            attribute.setType(ValueType.STRING)
            attribute.setDescription(description)
            attribute.setName(name)
            attribute.setKey(key)
            attribute.setEntityType(ent)
            attribute.setGroupable(false)
            attribute.setNullable(false)
            attribute.setKeyVersion("1")
            return metaDataService.createOrUpdateAttribute(attribute)
        }
        return attribute
    }


    private void updateListOfGroups(String name, String urn) {

        def mdrGroups = mdrService.getGroups(urn)
        int count = 0

        // only for top level data elements
        if (mdrGroups.results*.type.contains(ElementType.DATAELEMENT.toString())) {
            log.info("---- start Group ${name} ----")
            Group group = createGroup(name, count)
            count++
            this.updateGroup(group, urn)
            log.info("---- finished Group ----")
        }

        // for sub groups
        // sort by ID and hope it works
        def sorted = mdrGroups.results.sort { it.id.tokenize(':')[3] }
        sorted.each { element ->
            if (element.type == ElementType.DATAELEMENTGROUP.toString()) {
                log.info("---- start Group ${element.designations[0].designation} ----")
                Group group = createGroup(element.designations[0].designation, count)
                count++
                this.updateGroup(group, element.id as String)
                log.info("---- finished Group ----")
            }
        }
    }


    public static Group createGroup(String groupName, int order) {

        Group group = Group.findByName(groupName)
        if (!group) {
            group = new Group()
            group.setName(groupName)
            group.setOrder(order)

            log.info("created group ${group.getName()}")

            return group.save(flush: true)
        }

        return group
    }


    private void updateGroup(Group group, String groupUrn) {
        def mdrGroupMembers = mdrService.getGroups(groupUrn)
        int order = 0

        mdrGroupMembers.results.each { member ->
            String urn = member.id
            switch (member.type as ElementType) {
                case ElementType.DATAELEMENT:

                    String entityTypeKey = getEntityTypeKey(urn);
                    if (entityTypeKey != null) {

                        EntityType entityType = EntityType.findByName(entityTypeKey)

                        if (entityType != null) {

                            Attribute attribute = this.createAttribute(urn, entityType)
                            def metadata = mdrService.getMetaDataForAttribute(urn)

                            // check whether the attribute should be shown in the GUI and searchable
                            def searchable = metadata.slots.find { it.slot_name == "DKTK_SUCHBAR" }
                            if (searchable?.slot_value == "D") {
                                createGroupAttribute(group, attribute, order)
                            }

                        }

                    }

                    break

                case ElementType.DATAELEMENTGROUP:
                    // if this group contains a subgroup, its attributes should be added to this group
                    // so that we get a flat  hierarchy
                    updateGroup(group, urn)
            }
            order++
        }
    }

    private String getEntityTypeKey(String urn){

        urn = UrnUtils.getMajor(urn)
        return urnEntity.get(urn);

    }


    public static GroupAttribute createGroupAttribute(Group group, Attribute attribute, int order) {

        GroupAttribute groupAttribute = GroupAttribute.findByGroupAndAttribute(group, attribute)

        if (!groupAttribute) {
            groupAttribute = new GroupAttribute()
            groupAttribute.setGroup(group)
            groupAttribute.setAttribute(attribute)
            groupAttribute.setOrder(order)
            log.info("created groupAttribute ")

            groupAttribute.save()
        }

        return groupAttribute
    }


    private static ListOfValues createListOfValues(Attribute attribute, String name, List<List<String>> listItems) {
        log.info("is LOV")
        ListOfValues lov
        if (attribute.id != null) {
            lov = attribute.getListOfValues()
        }

        if (!lov) {
            log.info("LOV is null")
            lov = new ListOfValues()
            lov.setName(name)
            lov = lov.save(flush: true)
        }

        listItems.eachWithIndex { value, index ->
            ListItem item = ListItem.findByListOfValuesAndKey(lov, value[0])
            if (!item) {
                item = new ListItem()
                log.info "key of item: $value[0]"
                item.setKey(value[0])
                if (lov != null) {
                    lov.addToListItems(item)
                } else {
                    log.info "LOV is still null"
                }
            }
            log.info("new LOV Item key: ${value[0]} value: ${value[1]}")
            item.setOrder(index)
            item.setValue(value[1])
            item.setDescription(value[2])
        }

        return (lov != null) ? lov.save(flush: true) : null

    }


    private Attribute createAttribute(String urn, EntityType entityType) {
        String version = urn.substring(urn.lastIndexOf(":") + 1)
        String key = urn.substring(0, urn.lastIndexOf(":"))
        key = UrnUtils.urnToKey(key)

        Attribute attribute = Attribute.findByKey(key)

        if (!attribute) {
            attribute = new Attribute()
        }
        def metadata = mdrService.getMetaDataForAttribute(urn)
        def dataType = metadata.validation.datatype as DataType
        switch (dataType) {
            case DataType.STRING:
                attribute.setType(ValueType.STRING)
                break
            case DataType.DATETIME:
            case DataType.DATE:
                attribute.setType(ValueType.DATE)
                metadata.slots.each { slot ->
                    if (slot.slot_name.equals("JAVA_DATE_FORMAT")) {
                        attribute.setFormat(slot.slot_value)
                    }
                }
                break
            case DataType.INTEGER:
                attribute.setType(ValueType.LONG)
                break
            case DataType.BOOLEAN:
                attribute.setType(ValueType.LIST)
                break
            case DataType.enumerated:
                attribute.setType(ValueType.LIST)
        }
        def valueDomainType = metadata.validation.value_domain_type as ValueDomainType
        // make sure that attributes are treated as list even if it's not their data type
        if (valueDomainType == ValueDomainType.enumerated) {
            attribute.setType(ValueType.LIST)
        }

        String definition = metadata.designations[0].definition
        String name = metadata.designations[0].designation
        String unit = metadata.designations[0].unit_of_measure
        String format = metadata.validation.format
        attribute.setDescription(definition)
        attribute.setName(name)
        attribute.setKey(key)
        attribute.setKeyVersion(version)
        attribute.setEntityType(entityType)
        attribute.setGroupable(false)
        attribute.setNullable(true)
        log.info("attribute name: ${attribute.getName()}")
        log.info("attribute key: ${attribute.getKey()}")
        log.info("attribute version: ${attribute.getKeyVersion()}")
        if (attribute.type == ValueType.LIST) {
            def listItems = []
            if (valueDomainType == ValueDomainType.enumerated) {
                metadata.validation.permissible_values.each { value ->
                    def item = []
                    item.add(value.value as String)
                    item.add(value.meanings[0].designation)
                    item.add(value.meanings[0].definition)
                    listItems.add(item)
                    log.info("attribute item: ${item.get(0)}")
                }
                // hard coded permissible values for boolean
            } else if (dataType == DataType.BOOLEAN) {
                listItems = [["t", "Ja", ""], ["f", "Nein", ""]]
                attribute.setUnit(dataType.name())
            }
            attribute.setListOfValues(createListOfValues(attribute, name, listItems))
        }
        log.info("attribute format: ${format}")
        if (attribute.type != ValueType.DATE) {
            attribute.setFormat(format)
        }

        // URNs for age and sex should be groupable
        if (attribute.getKey().equals(URN_ATTRIBUTE_AGE_PREFIX) || attribute.getKey().equals(URN_ATTRIBUTE_SEX_PREFIX))
            attribute.setGroupable(true)

        return metaDataService.createOrUpdateAttribute(attribute)
    }


    private EntityType createEntityType(String key, String name, EntityType parent, int order, MDS mds) {

        EntityType entityType = EntityType.findByKey(key)

        if (!entityType) {
            entityType = new EntityType()
            entityType.setKey(key)
            entityType.setName(name)
            entityType.setParent(parent)
            entityType.setOrder(order)
            entityType = metaDataService.createEntityType(entityType)
        }

        createAttributeId(mds.getSiteID(), "${name} Standort", "Standort Identifier", entityType)
        createAttributeId(mds.getTeilerID(), "${name} Teiler", "Teiler Identifier", entityType)
        createAttributeId(mds.getID(), "${name} ID", "${name} Identifier", entityType)

        return entityType
    }

    enum ElementType {
        DATAELEMENT,
        DATAELEMENTGROUP,
    }

    enum DataType {
        STRING,
        DATE,
        DATETIME,
        INTEGER,
        BOOLEAN,
        enumerated,
    }

    enum ValueDomainType {
        enumerated,
        described,
    }
}

