/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.metadata

/**
 * list of values for {@link Attribute}s where only predefined values are allowed
 */
class ListOfValues {

    String name

    static hasMany = [listItems: ListItem]

    static mapping = {
        listItems joinTable: false, column: 'list_of_values_id'
    }

    static constraints = {
        listItems(nullable: true)
        name unique: true
    }

    Map<String, String> getLoVItems() {
        Map<String, String> items = [:]
        ListItem.findAllByListOfValues(this, [sort: "order", order: "asc"]).each {
            items.put(it.key, it.value)
        }
        return items
    }

    static String getValueForKey(String key, Attribute attribute) {
        return ListItem.findByListOfValuesAndKey(attribute.listOfValues, key).value
    }

    static ListItem getItemForKey(String key, Attribute attribute) {
        return ListItem.findByListOfValuesAndKey(attribute.listOfValues, key)
    }
}
