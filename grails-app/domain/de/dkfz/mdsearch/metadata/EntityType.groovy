/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.metadata

/**
 * this class represents an entity type such as "patient" or "sample"
 */
class EntityType {

    String name
    String key
    int order
    EntityType parent

    static hasMany = [groups: Group, attributes: Attribute]

    static mappedBy = [
            attributes: "entityType"
    ]

    static constraints = {
        key validator: { it.matches(/[0-9a-z_]{2,}/) }
        parent nullable: true
    }

    static mapping = {
        order column: 'order_'
        name unique: true
        key unique: true
        order unique: true
    }

    List<Group> getListOfGroups() {
        return Group.findAllByEntityType(this, [sort: "order", order: "asc"])
    }

    List<Attribute> getOrderedListOfAttributes() {
        List<Group> groups = getListOfGroups()
        List<Attribute> attributeList = []
        for (Group group : groups) {
            attributeList.addAll(group.getListOfAttributes())
        }
        return attributeList
    }

    static transients = ['isMdsk', 'queryAlias']

    String queryAlias = ""
    boolean isMdsk = false

    transient beforeInsert = {
        //throw new RuntimeException('Use DataService.createAttribute() instead.')
    }

    transient beforeUpdate = {
        //throw new RuntimeException('Not implemented.')
    }

    transient beforeDelete = {
        //throw new RuntimeException('Not implemented.')
    }
}
