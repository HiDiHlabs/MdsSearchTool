/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

import de.dkfz.mdsearch.metadata.EntityType;
import groovy.transform.ToString;

@ToString
public class Criteria implements ICriteria {
    private Condition condition;
    private EntityType entityTypes;

    @Override
    public void restrictTo(Condition condition) {
        this.condition = condition;
    }

    @Override
    public void restrictSelectionTo(EntityType entityTypes) {
        this.entityTypes = entityTypes;
    }

    @Override
    public Condition getCondition() {
        return condition;
    }

    @Override
    public EntityType getSelectionObject() {
        return entityTypes;
    }
}
