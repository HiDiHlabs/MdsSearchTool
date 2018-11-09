/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import grails.converters.JSON


class AjaxController {
    def queryService

    def index() {}

    /*
     * gets triggered when a string is written into a input box with type "String"
     * calls the createAutoCompletionQuery function with the parameters received from the java script part
     * returns all property values which contain the value (params.value)
     * e.g. property = sample_type, value = "bl" -> return = "Blut"
     */

    def autoCompleteValue(AutoCompleteCommand cmd) {
        EntityType entityType = EntityType.findByKey(cmd.id)
        Attribute attribute = Attribute.findByKey(cmd.attribute)
        String term = cmd.term
        List<String> autoCompleteResult = queryService.createAutoCompleteQuery(entityType, attribute, term)
        render autoCompleteResult as JSON
    }
}

class AutoCompleteCommand {
    String id  // entityType of the attribute
    String attribute
    String term
}
