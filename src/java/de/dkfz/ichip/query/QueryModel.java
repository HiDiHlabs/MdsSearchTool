/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

import java.util.List;


public class QueryModel {
    public String key;
    public List<FilterModel> filter;


    public static class FilterModel {
        public CompOperator op;
        public String val1;
        public String val2;
    }

    public static enum CompOperator {
        EQ,
        LT,
        GT,
        LE,
        GE,
        CO,
        SW,
        BT,
        NE,
        EM,
    }
}
