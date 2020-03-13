/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import groovy.sql.GroovyRowResult
import groovy.sql.Sql
import org.stringtemplate.v4.ST
import org.stringtemplate.v4.STGroup
import org.stringtemplate.v4.STGroupFile

import javax.sql.DataSource


class MetaDataService {
    DataSource dataSource
    DataService dataService

    STGroup group = new STGroupFile("resources/metaDataService.stg")


    EntityType createEntityType(EntityType entityType) {
        ST stTable = group.getInstanceOf("createEntityTypeTable")
        ST stFK = group.getInstanceOf("createEntityTypeForeignKey")
        ST stMD = group.getInstanceOf("createEntityTypeMD")

        if (!entityType.validate()) {
            throw new RuntimeException("EntityType doesn't validate.")
        }
        stTable.add("key", entityType.key)
        if (entityType.parent) {
            stFK.add("key", entityType.key)
            stFK.add("parent", entityType.parent.key)
        }

        entityType.discard()
        GroovyRowResult result = null
        getSql().withTransaction {
            sql.execute(stTable.render())
            if (entityType.parent) {
                sql.execute(stFK.render())
            }
            result = sql.firstRow(stMD.render(), [name : entityType.name, key: entityType.key,
                                                  order: entityType.order, parent: entityType.parentId])
        }
        entityType.discard()
        return EntityType.get((long) (result?.get("id")))
    }


    Attribute createAttribute(Attribute attribute) {
        ST stTable = group.getInstanceOf("createAttributeTable")
        ST stMD = group.getInstanceOf("createAttributeMD")

        if (!attribute.validate()) {
            throw new RuntimeException("Invalid attribute.")
        }
        if ((attribute.listOfValues != null && attribute.type != ValueType.LIST) ||
                (attribute.type == ValueType.LIST && attribute.listOfValues == null)) {
            throw new RuntimeException("Type==LIST and lov being set are mutually dependent.")
        }

        stTable.add("entityType", attribute.entityType.key)
        stTable.add("key", attribute.key)
        stTable.add("type", attribute.type.sqlType)
        stTable.add("nullable", attribute.nullable)

        attribute.discard()
        GroovyRowResult result = null
        getSql().withTransaction {
            sql.execute(stTable.render())
            result = sql.firstRow(stMD.render(),
                    [name      : attribute.name, key: attribute.key, description: attribute.description,
                     groupable : attribute.groupable, type: attribute.type.toString(), nullable: attribute.nullable,
                     entityType: attribute.entityTypeId, lov: attribute.listOfValuesId, unit: attribute.unit,
                     format    : attribute.format, version: attribute.version])
        }
        return Attribute.get((long) (result?.get("id")))
    }


    /** create an attribute or update
     * if an attribute with the same key already exists
     */
    Attribute createOrUpdateAttribute(Attribute attribute) {
        ST stMD = group.getInstanceOf("createOrUpdate")
        ST stMDA = group.getInstanceOf("createOrUpdateAttribute")
        ST versionMD = group.getInstanceOf("createAttributeTable")
        def stMDSql
        if (attribute.entityType == null) {
            attribute.setEntityType(EntityType.findByKey("mds_k")) //TODO(David): select default entity ???
            stMDA.add("attribute", attribute)
            stMDSql = stMDA.render()
        } else {
            stMD.add("attribute", attribute)
            stMDSql = stMD.render()
        }

        versionMD.add("entityType", attribute.entityType.key)
        versionMD.add("key", attribute.key + "_version")
        versionMD.add("type", "integer")
        versionMD.add("nullable", attribute.nullable)
        def versionMDSql = versionMD.render()

        if (!attribute.validate()) {
            throw new RuntimeException("Invalid attribute.")
        }

        if (attribute.isDirty('key') ||
                attribute.isDirty('entityType') ||
                attribute.isDirty('type')) {
            throw new RuntimeException("Changing of these values not allowed.")
        }

        if (attribute.isDirty('nullable')) {
            if (!attribute.nullable && dataService.doesAttributeContainNull(attribute)) {
                throw new RuntimeException("Attribute changed to not nullable, but values contain null.")
            }
        }
        if (attribute.isDirty('listOfValues') && attribute.listOfValues &&
                !attribute.listOfValues.listOfValuesItems*.key.containsAll(dataService.findAllDistinctValuesForAttribute(attribute))) {
            throw new RuntimeException("Wrong Lov.")
        }
        println(attribute.listOfValuesId)
        def values = [attribute.key, attribute.name, attribute.description, attribute.type.toString(),
                      attribute.entityTypeId, attribute.listOfValuesId, attribute.nullable, attribute.groupable,
                      attribute.unit, attribute.format, attribute.keyVersion]

        if (attribute.isDirty()) {
            attribute.discard()
            attribute.refresh()
        }

        getSql().execute(stMDSql, values)
        if (attribute.key.contains("urn_dktk_dataelement"))
            getSql().execute(versionMDSql)

        return Attribute.findByKey(attribute.key)
    }


    private Sql getSql() {
        // this is necessary for transaction support
        // http://stackoverflow.com/a/16863373/1216686
        return new Sql(dataSource.connection)
    }
}
