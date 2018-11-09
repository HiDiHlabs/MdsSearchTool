/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.config

import org.apache.commons.validator.routines.EmailValidator

import java.time.DateTimeException
import java.time.ZoneId

enum TypeValidators {

    BOOLEAN({ it ==~ /true|false/ }, { ["true", "false"] }),

    POSITIVE_NUMBER({ it ==~ /^[\+]?\d+$/ }, null),

    FLOAT({ it ==~ /^[\+\-]?\d+\.?\d*$/ }, null),

    SINGLE_WORD_TEXT({ it ==~ /\S+/ }, null),

    SINGLE_WORD_TEXT_OPTIONAL({ it ==~ /\S*/ }, null),

    SINGLE_LINE_TEXT({ it ==~ /[^\n]*/ }, null),

    MULTI_LINE_TEXT({ it ==~ /[\s\S]*/ }, null),

    MAIL({ EmailValidator.getInstance().isValid(it) }, null),

    PLUGIN({ it ==~ /^\d+\.\d+\.\d+(\-\d+)?$/ }, null),

    TIME_ZONE({ try { ZoneId.of(it); return true } catch (DateTimeException ignored) { return false } }, { ZoneId.getAvailableZoneIds().sort() }),

    private Closure validator
    private final Closure<List<String>> allowedValues

    TypeValidators(Closure validator, Closure<List<String>> allowedValues) {
        this.validator = validator
        this.allowedValues = allowedValues
    }

    boolean validate(String value) {
        value != null && validator(value)
    }

    List<String> getAllowedValues() {
        if (allowedValues) {
            return allowedValues.call()
        } else {
            return null
        }
    }
}
