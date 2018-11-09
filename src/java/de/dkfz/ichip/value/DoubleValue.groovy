/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value

class DoubleValue implements Value<Double, Double, Double> {
    private double value

    @Override
    Value<Double, Double, Double> set(String value) throws IllegalArgumentException {
        this.value = Double.parseDouble(value)
        return this
    }

    @Override
    Value<Double, Double, Double> set(Double value) {
        this.value = value
        return this
    }

    @Override
    ValueType getType() {
        return ValueType.DOUBLE
    }

    @Override
    Double getActualValue() {
        return value
    }

    @Override
    Double getValue() {
        return getActualValue()
    }

    @Override
    public Double getSqlValue() {
        return getActualValue();
    }

    @Override
    String toDisplayString() {
        return toString()
    }

    @Override
    String toString() {
        return Double.toString(value)
    }
}
