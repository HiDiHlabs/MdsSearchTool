/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.query;

/**
 * Simple enum-class that holds all supported logical operators to connect
 * conditions
 *
 * @author kabbe
 *
 */
public enum LogicalOperator {
    AND(" AND "),
    OR (" OR "),
    ;

    private String sqlToken;
    private String displayString;

    LogicalOperator(String token) {
        this.sqlToken = token;
        this.displayString = token.trim();
    }

    /**
     * returns sql-token that can be pasted into hsql-queries
     * @return sql-token
     */
    public String getSqlToken() {
        return this.sqlToken;
    }

    public String toString() {
        return this.displayString;
    }
}
