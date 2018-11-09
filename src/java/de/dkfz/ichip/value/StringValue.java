/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value;

public class StringValue implements Value<String, String, String> {
    private String value;

    @Override
    public Value<String, String, String> set(String value) throws IllegalArgumentException {
        this.value = value;
        return this;
    }

    @Override
    public ValueType getType() {
        return ValueType.STRING;
    }

    /*@Override
    public Class getType() {
        return String.class;
    }*/

    @Override
    public String getActualValue() {
        return value;
    }

    @Override
    public String getValue() {
        return getActualValue();
    }

    @Override
    public String getSqlValue() { return getActualValue(); }

    @Override
    public String toString() {
        return value;
    }

    @Override
    public String toDisplayString() {
        return value;
    }
}
