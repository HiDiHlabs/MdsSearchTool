/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value;

public enum ValueType {
    DATE,
    DATETIME,
    STRING,
    DOUBLE,
    LONG,
    LIST,
    ;

    public static Value createValueForType(ValueType type) {
        switch (type) {
            case DATETIME:
            case DATE:
                return new DateValue();
            case STRING:
                return new StringValue();
            case LONG:
                return new LongValue();
            case DOUBLE:
                return new DoubleValue();
            case LIST:
                return new ListValue();
        }
        return null;
    }

    public String getSqlType() {
        switch (this) {
            case DATETIME:
            case DATE:
                return "timestamp without time zone";
            case STRING:
                return "character varying(255)";
            case LONG:
                return "integer";
            case DOUBLE:
                return "double precision";
            case LIST:
                return "character varying(255)";
        }
        return null;
    }
}
