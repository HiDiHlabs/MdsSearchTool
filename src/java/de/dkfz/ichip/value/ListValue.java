/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.value;

import de.dkfz.mdsearch.metadata.ListItem;

public class ListValue implements Value<ListItem, String, String> {
    private ListItem item;
    private String stringValue;

    @Override
    public Value<ListItem, String, String> set(String key) {
        this.item = null;
        this.stringValue = key;
        return this;
    }

    @Override
    public Value<ListItem, String, String> set(ListItem value) {
        this.item = value;
        this.stringValue = value.getValue();
        return this;
    }

    @Override
    public ValueType getType() {
        return ValueType.LIST;
    }

    @Override
    public ListItem getActualValue() {
        return this.item;
    }

    @Override
    public String getValue() {
        return stringValue;
    }

    @Override
    public String getSqlValue() {
        return stringValue;
    }

    @Override
    public String toDisplayString() {
        return stringValue;
    }

    @Override
    public String toString() {
        return item.getKey();
    }
}
