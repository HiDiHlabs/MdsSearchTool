/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

import de.dkfz.mdsearch.metadata.EntityType;

public interface ICriteria {
    public abstract void restrictTo(Condition condition);

    public abstract void restrictSelectionTo(EntityType entityTypes);

    public abstract Condition getCondition();

    public abstract EntityType getSelectionObject();
}
