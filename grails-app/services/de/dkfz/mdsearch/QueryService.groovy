/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch


import de.dkfz.ichip.query.*
import de.dkfz.ichip.util.TreeNode
import de.dkfz.ichip.value.Value
import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import de.dkfz.mdsearch.metadata.ListOfValues
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.hibernate.SQLQuery
import org.hibernate.Session
import org.stringtemplate.v4.ST
import org.stringtemplate.v4.STGroup
import org.stringtemplate.v4.STGroupFile

import java.time.LocalDateTime
import java.time.ZoneId

/**
 * various methods for querying the database
 */
class QueryService {
    def sessionFactory
    private static final Log log = LogFactory.getLog(this)

    /**
     * autocompletion for attribute values
     * @param value the beginning of the word
     * @return the first 15 value matching the value argument
     */
    List<String> createAutoCompleteQuery(EntityType entityType, Attribute attribute, String value) {
        STGroup group = new STGroupFile("resources/autoComplete.stg")
        ST st = group.getInstanceOf("ac")

        List<Attribute> attributeList = entityType.getOrderedListOfAttributes()
        if (!(attribute in attributeList)) {
            throw new Exception("Computer says no.")
        }

        st.add("entityType", entityType)
        st.add("attribute", attribute)
        st.add("limit", 15)

        Session session = null
        List<String> queryResult = null
        try {
            session = sessionFactory.openSession()
            SQLQuery query = session.createSQLQuery(st.render())
            query.setParameter(0, value)
            queryResult = query.list()
        } finally {
            session.close()
        }
        return queryResult
    }


    ICriteria createCriteria() {
        return new Criteria()
    }

    /**
     * get the number of entity types that match the given criteria
     */
    List<Long> getResultCount(ICriteria criteria, List<EntityType> entityTypes, boolean allowNullValues) {
        STGroup group = new STGroupFile("resources/entityQuery.stg")
        ST st = group.getInstanceOf("count")

        List<Value> valueList = createValueList(criteria.getCondition(), new LinkedList<Value>())

        EntityType.findAll()*.isMdsk = false
        List<Attribute> attrList = createMDSKAttributeList(criteria.getCondition(), new LinkedList<Attribute>())
        attrList = attrList.unique()

        TreeNode etTree = getEntityTypeTree()

        st.add("entityTypes", entityTypes)
        st.add("entityTypeTree", etTree)
        st.add("conditions", criteria.getCondition())
        st.add("conditionsExist", containsEavCondition(criteria.getCondition()))
        st.add("allowNullValues", allowNullValues)
        st.add("attributeMdsk", attrList)

        Session session = null
        List<List<Long>> queryResult = null
        try {
            session = sessionFactory.openSession()
            SQLQuery query = session.createSQLQuery(st.render())
            int i = 0
            for (Value value : valueList) {
                query.setParameter(i, value.value)
                i++
            }
            print(query)
            print valueList*.value.join(" ")
            queryResult = query.list()
        } finally {
            session.close()
        }
        return queryResult
    }

    /**
     * Used for monitoring patient upload
     * @param conditionExists
     * @param days
     * @return
     */
    List getTotalBySite(boolean conditionExists, int days = 14) {
        STGroup group = new STGroupFile("resources/entityQuery.stg")
        ST st = group.getInstanceOf("countPatientsGroupBySite")
        st.add("conditionsExist", conditionExists)

        Session session = null
        List queryResult = null
        try {
            session = sessionFactory.openSession()
            SQLQuery query = session.createSQLQuery(st.render())

            if (conditionExists) {
                def recentDate = LocalDateTime.now().minusDays(days)
                def valueDate = ValueType.createValueForType(ValueType.DATE)
                valueDate.set(String.valueOf(recentDate.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli()))
                query.setParameter(0, valueDate.value)
            }
            queryResult = query.list()
        } finally {
            session.close()
        }
        return queryResult
    }

    /**
     * execute a GROUP BY query using the given criteria and attribute
     * @return a map containing the values and their number of occurence
     */
    LinkedHashMap<String, Integer> getResultGroupCount(ICriteria criteria, Attribute groupByAttribute, boolean allowNullValues) {
        STGroup group = new STGroupFile("resources/entityQuery.stg")
        ST st
        if (groupByAttribute.type == ValueType.LONG) {
            st = group.getInstanceOf("groupByRange1")
        } else {
            st = group.getInstanceOf("groupBy")
        }
        EntityType.findAll()*.isMdsk = false
        List<Attribute> attrList = createMDSKAttributeList(criteria.getCondition(), new LinkedList<Attribute>())
        attrList.add(groupByAttribute)
        attrList = attrList.unique()

        TreeNode etTree = getEntityTypeTree()

        List<Value> valueList = createValueList(criteria.getCondition(), new LinkedList<Value>())

        EntityType entityType = criteria.getSelectionObject()
        st.add("entityType", entityType)
        st.add("entityTypeTree", etTree)
        st.add("groupByAttribute", groupByAttribute)
        st.add("conditions", criteria.getCondition())
        st.add("conditionsExist", containsEavCondition(criteria.getCondition()))
        st.add("allowNullValues", allowNullValues)
        st.add("attributeMdsk", attrList)

        Session session = null
        LinkedHashMap<String, Integer> result = [:]
        try {
            session = sessionFactory.openSession()
            SQLQuery query = session.createSQLQuery(st.render())
            int i = 0
            for (Value value : valueList) {
                query.setParameter(i, value.value)
                i++
            }
            print(query)
            print valueList*.value.join(" ")
            List<List> queryResult = query.list()
            LinkedHashMap<String, Integer> groups = ["0...9": 0, "10...19": 0, "20...29": 0, "30...39": 0, "40...49": 0, "50...59": 0, "60...69": 0, "70...79": 0, "80...89": 0, "90...99": 0, "100...": 0, "unbekannt": 0]
            if (groupByAttribute.type == ValueType.LONG) {
                for (List list : queryResult) {
                    if (list[0] != null) {
                        groups.put((String) (list[0]), (Integer) (list[1]))
                    } else {
                        //if(allowNullValues) {
                        groups.put("unbekannt", (Integer) (list[1]))
                        //}
                    }
                }
                result = groups
            } else {
                groups = [:]
                for (String item : groupByAttribute.listOfValues.getLoVItems().keySet()) {
                    groups.put(ListOfValues.getValueForKey(item, groupByAttribute), 0)
                }
                for (List list : queryResult) {
                    if (list[0] != null) {
                        if (ListOfValues.getValueForKey((String) (list[0]), groupByAttribute).equalsIgnoreCase("unbekannt")) {
                            groups.put("unbekannt", ((Integer) list[1]) + groups.get("unbekannt"))
                        } else {
                            groups.put(ListOfValues.getValueForKey((String) (list[0]), groupByAttribute), (Integer) (list[1]))
                        }
                    } else {
                        groups.put("unbekannt", ((Integer) list[1]) + groups.get("unbekannt"))
                    }
                }
                result = groups
            }
        } finally {
            session.close()
        }
        return result
    }

    // walk through an Condition, return true if it contains a EavCondition
    private boolean containsEavCondition(Condition condition) {
        if (condition instanceof ConditionList) {
            for (Condition cond : ((ConditionList) condition).getConditions()) {
                if (containsEavCondition(cond)) {
                    return true
                }
            }
            return false
        } else if (condition instanceof EavCondition) {
            return true
        }
    }

    // walk through an Condition, return all Values it contains
    // to prevent SQL injections, values are used as positioned parameters in queries
    // and not inserted directly with st.add()
    // this is not necessary for attribute names or comparators
    // because they get either verified via other queries or casted.
    private List<Value> createValueList(Condition condition, List<Value> valueList) {
        if (condition instanceof ConditionList) {
            for (Condition cond : ((ConditionList) condition).getConditions()) {
                createValueList(cond, valueList)
            }
        } else if (condition instanceof EavCondition) {
            if (!(((EavCondition) condition).getComparator() == de.dkfz.ichip.query.Comparator.IN ||
                    ((EavCondition) condition).getComparator() == de.dkfz.ichip.query.Comparator.NN)) {
                valueList.add(((EavCondition) condition).getValue())
            }
        }
        return valueList
    }


    private List<Attribute> createMDSKAttributeList(Condition condition, List<Attribute> attrList) {
        if (condition instanceof ConditionList) {
            for (Condition cond : ((ConditionList) condition).getConditions()) {
                createMDSKAttributeList(cond, attrList)
            }
        } else if (condition instanceof EavCondition) {
            if (condition.attribute.entityType.key == "mds_k") {
                condition.attribute.entityType.isMdsk = true
                attrList.add(condition.getAttribute())
            }
        }
        return attrList
    }

    // tree of entity types
    private static TreeNode<EntityType> getEntityTypeTree() {
        List<EntityType> entityTypes = EntityType.getAll()
        List<TreeNode<EntityType>> nodes = entityTypes.collect { new TreeNode<EntityType>(it) }

        for (TreeNode<EntityType> node : nodes) {
            TreeNode<EntityType> parent = nodes.find { it.data.id == node.data.parentId }
            if (parent) {
                node.data.queryAlias = node.data.key
                parent.addChild(node)
            }
        }
        return nodes.find { it.data.parent == null }
    }

}
