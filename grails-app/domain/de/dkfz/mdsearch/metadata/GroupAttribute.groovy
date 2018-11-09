/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.metadata;

/**
 * mapping table between {@link Group} and {@link Attribute}
 * this is necessary because this relationship has an attribute which gives the display {@link order}
 */
class GroupAttribute implements Serializable {

    int order

    Group group
    Attribute attribute

    static mapping = {
        id composite: ['group', 'attribute']
        order column: 'order_'
    }
}
