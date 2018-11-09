/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.ichip.sql;

import org.hibernate.dialect.PostgreSQL9Dialect;

public class SequencePostgreSQL9Dialect extends PostgreSQL9Dialect {

    public SequencePostgreSQL9Dialect() {
    }

    public boolean supportsInsertSelectIdentity() {
        return true;
    }

    public String appendIdentitySelectToInsert(String insertString) {
        return insertString + " RETURNING id";
    }
}
