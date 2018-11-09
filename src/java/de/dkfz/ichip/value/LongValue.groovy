/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value

class LongValue implements Value<Long, Long, Long> {
    private long value

    @Override
    Value<Long, Long, Long> set(String value) throws IllegalArgumentException {
        this.value = Long.parseLong(value)
        return this
    }

    @Override
    Value<Long, Long, Long> set(Long value) {
        this.value = value
        return this
    }

    @Override
    ValueType getType() {
        return ValueType.LONG
    }

    @Override
    Long getActualValue() {
        return value
    }

    @Override
    Long getValue() {
        return getActualValue()
    }

    @Override
    Long getSqlValue() {
        return getActualValue()
    }

    @Override
    String toDisplayString() {
        return Long.toString(value)
    }
}
