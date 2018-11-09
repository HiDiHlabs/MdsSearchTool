/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.entity

import de.dkfz.ichip.value.Value
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType

class Entity {
    long id
    EntityType type
    Long parentId
    Map<Attribute, Value> values
}
