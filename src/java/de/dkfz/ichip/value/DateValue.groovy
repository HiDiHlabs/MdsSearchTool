/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value

import java.sql.Timestamp

public class DateValue implements Value<Date, Date, Timestamp> {
    private Date value;

    @Override
    public Value<Date, Date, Timestamp> set(String value) throws IllegalArgumentException {
        if (value == null || value.trim().isEmpty()) {
            this.value = null;
        } else {
            this.value = new Date(Long.parseLong(value));
        }
        return this;
    }

    @Override
    public Value<Date, Date, Timestamp> set(Date value) {
        this.value = value;
        return this;
    }

    @Override
    public ValueType getType() {
        return ValueType.DATE;
    }

    @Override
    public Date getActualValue() {
        return value;
    }

    @Override
    public Date getValue() {
        return getActualValue();
    }

    @Override
    public Timestamp getSqlValue() {
        return new Timestamp(value.time);
    }

    @Override
    public String toDisplayString() {
        return value?.toString();
    }
}
