/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

import groovy.transform.ToString;

import java.util.List;

/**
 * this condition is used to hold a list of other conditions
 * which are combined with an operator
 */
@ToString
public class ConditionList implements Condition {
    private final List<Condition> conditionList;
    private final LogicalOperator operator;

    public ConditionList(LogicalOperator operator, List<Condition> conditionList) {
        this.conditionList = conditionList;
        this.operator = operator;
    }

    @Override
    public final ConditionType getType() {
        return ConditionType.LIST;
    }

    public List<Condition> getConditions() {
        return conditionList;
    }

    public LogicalOperator getOperator() {
        return operator;
    }
}
