/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

/**
 * interface used to createAttribute queries for the {@link QueryService}
 */
public interface Condition {
    public ConditionType getType();
}
