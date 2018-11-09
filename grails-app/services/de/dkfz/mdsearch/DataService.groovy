/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import de.dkfz.ichip.entity.Entity
import de.dkfz.ichip.value.Value
import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import de.dkfz.mdsearch.metadata.ListOfValues
import groovy.sql.GroovyResultSet
import groovy.sql.GroovyRowResult
import groovy.sql.Sql
import org.stringtemplate.v4.ST
import org.stringtemplate.v4.STGroup
import org.stringtemplate.v4.STGroupFile

import javax.sql.DataSource

class DataService {
    DataSource dataSource

    STGroup group = new STGroupFile("resources/dataService.stg")

    /** insert values into DB */
    Entity createEntity(EntityType type, Map<Attribute, Value> values, Entity parent = null) {
        ST st = group.getInstanceOf("create")

        List<Value> valueList = []
        List<Attribute> attributes = []
        for (Map.Entry<Attribute, Value> value : values) {
            attributes.add(value.key)
            valueList.add(value.value)
        }

        st.add("entityType", type.key)
        st.add("attributes", attributes)
        st.add("parent", parent)

        def sqlValues = valueList*.sqlValue
        if (parent) {
            sqlValues.add(parent.id)
        }
        GroovyRowResult result = getSql().firstRow(st.render(), sqlValues)
        return new Entity(
                id: (long) result["id"],
                type: type,
                parentId: parent?.id,
                values: values
        )
    }

    /** insert values into DB */
    Entity updateEntity(EntityType type, Map<Attribute, Value> values, long id) {
        ST st = group.getInstanceOf("updatePatient")
        Value updated = ValueType.createValueForType(ValueType.DATE)
        updated.set(new Date())
        def vals = [id: id, updated: updated.sqlValue]

        getSql().withTransaction {
            sql.execute(st.render(), vals)
        }

        return new Entity(
                id: (long) id,
                type: type,
                parentId: null,
                values: values
        )
    }

    Set<Entity> getAllEntitiesByIdsAndType(EntityType entityType, List<Long> ids = null) {
        ST st = group.getInstanceOf("get")

        Set<Attribute> attributeList = entityType.attributes

        st.add("entityType", entityType.key)
        st.add("ids", ids)

        if (!ids) {
            ids = []
        }

        Set<Entity> result = new HashSet<>()
        getSql().eachRow(st.render(), ids) { GroovyResultSet row ->
            result.add(convertEntityAttributeList(row, attributeList, entityType))
        }
        return result
    }

    Set<Entity> findAllEntitiesByQueryParamsAndType(EntityType entityType, Map<Attribute, Value> queryParams) {
        ST st = group.getInstanceOf("findWhere")

        Set<Attribute> attributeList = entityType.attributes

        List<Value> values = []
        List<Attribute> attributes = []
        for (Map.Entry<Attribute, Value> value : queryParams) {
            attributes.add(value.key)
            values.add(value.value)
        }

        st.add("entityType", entityType.key)
        st.add("attributes", attributes)

        Set<Entity> result = new HashSet<>()
        getSql().eachRow(st.render(), values*.sqlValue) { GroovyResultSet row ->
            result.add(convertEntityAttributeList(row, attributeList, entityType))
        }
        return result
    }

    private static Entity convertEntityAttributeList(GroovyResultSet row, Set<Attribute> attributeList, EntityType entityType) {
        Entity entity = new Entity(
                id: (long) row["id"],
                type: entityType,
                parentId: entityType.parentId ? (Long) row["parent_id"] : null,
                values: new HashMap<Attribute, Value>()
        )

        for (def attribute : attributeList) {
            if (!attribute.key.startsWith("urn_dktk_code")) {
                def value = row[attribute.key]
                if (value) {
                    if (attribute.type == ValueType.LIST) {
                        //TODO check for Boolean [f|t|false|true]
                        value = ListOfValues.getItemForKey((String) value, attribute)
                    }
                    entity.values.put(attribute, ValueType.createValueForType(attribute.type).set(value))
                }
            }
        }

        return entity
    }


    boolean deleteEntityByIdAndType(EntityType entityType, long id) {
        deleteAllEntitiesByIdsAndType(entityType, [id])
    }

    boolean deleteAllEntitiesByIdsAndType(EntityType entityType, List<Long> ids) {
        ST st = group.getInstanceOf("delete")

        if (ids == null || ids.size() == 0) {
            throw new Exception("That's not a good idea.")
        }

        st.add("entityType", entityType.key)
        st.add("ids", ids)

        getSql().execute(st.render(), ids)
    }

    boolean deleteAllEntitiesByQueryParamsAndType(EntityType entityType, Map<Attribute, Value> queryParams, Entity parent = null) {
        ST st = group.getInstanceOf("deleteWhere")

        if (queryParams == null || queryParams.size() == 0) {
            throw new Exception("Query params is not allowed to be empty")
        }

        List<Value> values = []
        List<Attribute> attributes = []
        for (Map.Entry<Attribute, Value> value : queryParams) {
            attributes.add(value.key)
            values.add(value.value)
        }

        st.add("entityType", entityType.key)
        st.add("attributes", attributes)
        st.add("parent", parent)

        def sqlValues = values*.sqlValue
        if (parent) {
            sqlValues.add(parent.id)
        }

        getSql().execute(st.render(), sqlValues)
    }


    List<Object> findAllDistinctValuesForAttribute(Attribute attribute) {
        ST st = group.getInstanceOf("findAllDistinctValuesFor")
        st.add("attribute", attribute)

        Sql sql = getSql()
        List<GroovyRowResult> result = sql.rows(st.render())
        return result.collect { it[0] }
    }

    boolean doesAttributeContainNull(Attribute attribute) {
        ST st = group.getInstanceOf("doesAttributeContainNull")
        st.add("attribute", attribute)

        Sql sql = getSql()
        GroovyRowResult result = sql.firstRow(st.render())
        return ((long) result[0]) > 0
    }


    private Sql getSql() {
        // this is necessary for transaction support
        // http://stackoverflow.com/a/16863373/1216686
        return new Sql(dataSource.connection)
    }
}
