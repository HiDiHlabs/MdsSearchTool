/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.config

import grails.util.Environment
import groovy.transform.Canonical

class PropertiesValidationService {
    ConfigService configService

    void validateStartUpProperties() {
        List<PropertyProblem> errorList = []

        Properties properties = configService.parsePropertiesFile()

        List<MdSearchProperty> used = MdSearchProperty.values().findAll { it.usedIn.contains(Environment.current.getName().toUpperCase() as UsedIn) }
        used.each {
            if (!properties[it.key]) {
                if (it.defaultValue == null) {
                    errorList << new PropertyProblem("The required configuration property was not found: ${it.key}")
                } else {
                    log.info("Using default configuration '${it.defaultValue}' for '${it.key}'")
                }
            }
        }

        properties.each { String key, String value ->
            MdSearchProperty mdSearchProperty = MdSearchProperty.findByKey(key)
            if (!mdSearchProperty) {
                log.warn("Found unknown key '${key}' in the mdsearch properties file")
            } else if (!mdSearchProperty.validator.validate(value)) {
                errorList << new PropertyProblem("The value '${value}' for the key '${key}' is not valid for the check '${mdSearchProperty.validator}'")
            }
        }

        if (!errorList.isEmpty()) {
            throw new Exception("Configuration is invalid: ${errorList*.toString().join("\n")}")
        }
    }

}

@Canonical
class PropertyProblem {
    final String message

    @Override
    String toString() {
        return "${message}"
    }
}

@Canonical
class OptionProblem {
    final String message
    ProblemType type
    
    enum ProblemType {
        MISSING, TYPE_INVALID, VALUE_INVALID
    }

    @Override
    String toString() {
        return "${message} - ${type}"
    }
}
