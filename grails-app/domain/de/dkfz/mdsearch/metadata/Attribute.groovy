/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.metadata

import de.dkfz.ichip.value.ValueType

/**
 * this class represents an attribute and its properties
 * such as its name, description, type and constraints
 */
class Attribute {

    String name
    String description
    String keyVersion
    ValueType type
    String unit
    String format
    String key
    EntityType entityType
    boolean groupable
    boolean nullable

    ListOfValues listOfValues

    static constraints = {
        key validator: { it.matches(/[0-9a-z_]{2,}/) }
        listOfValues(nullable: true)
        entityType(nullable: false)
        groupable(nullable: false)
        unit nullable: true
        format nullable: true
    }

    static mapping = {
        keyVersion column: 'version_'
        groupable defaulValue: false
        nullable defaultValue: false
        key unique: true
    }

    transient beforeInsert = {
        //throw new RuntimeException('Use DataService.createAttribute() instead.')
    }

    transient beforeUpdate = {
        //throw new RuntimeException('Use DataService.updateAttribute() instead.')
    }

    transient beforeDelete = {
        //throw new RuntimeException('Not implemented.')
    }
}
