/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

import de.dkfz.ichip.value.Value;
import de.dkfz.mdsearch.metadata.Attribute;
import de.dkfz.mdsearch.metadata.EntityType;
import groovy.transform.ToString;

/**
 * this class defines whether an attributes must match a given requirement
 *
 */
@ToString
public class EavCondition implements Condition {
    public EavCondition(EntityType entityType, Attribute attribute, Comparator comparator, Value value) {
        this.entityType = entityType;
        this.attribute = attribute;
        this.comparator = comparator;
        this.value = value;
    }

    @Override
    public final ConditionType getType() {
        return ((ConditionType) (ConditionType.EAV));
    }

    public EntityType getEntityType() {
        return entityType;
    }

    public Attribute getAttribute() {
        return attribute;
    }

    public Comparator getComparator() {
        return comparator;
    }

    public Value getValue() {
        return value;
    }

    private EntityType entityType;
    private Attribute attribute;
    private Comparator comparator;
    private Value value;
}
