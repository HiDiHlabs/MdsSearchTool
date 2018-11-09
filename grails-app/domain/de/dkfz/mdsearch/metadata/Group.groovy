/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.metadata

/**
 * this class defines which attributes may be shown the user interface
 * only {@link Attribute}s that belong to a group may visible,
 * group are shown in the order defined by {@link #order}
 */
class Group {

    String name
    int order

    static belongsTo = [
            entityType: EntityType
    ]

    static mapping = {
        table 'group_'
        order column: 'order_'
    }

    static constraints = {
        entityType(nullable: true)
        name unique: true
        order unique: 'entityType'
    }

    List<Attribute> getListOfAttributes() {
        return GroupAttribute.findAllByGroup(this, [sort: "order", order: "asc"]).collect { it.attribute } as List
    }
}
