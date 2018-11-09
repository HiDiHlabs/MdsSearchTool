/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value;

public interface Value<T, S, Q> {

    public Value<T, S, Q> set(String value) throws IllegalArgumentException;
    public Value<T, S, Q> set(T value);

    public ValueType getType();

    public T getActualValue();

    public S getValue();

    public Q getSqlValue();

    public String toString();

    public String toDisplayString();
}
