/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.metadata

class ListItem {

    String key
    String value
    String description
    int order
    static belongsTo = [listOfValues: ListOfValues]

    static mapping = {
        order column: 'order_'
    }

    static constraints = {
        key unique: 'listOfValues'
        //value unique: 'listOfValues'
    }
}
