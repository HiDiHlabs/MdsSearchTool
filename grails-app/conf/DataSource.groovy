/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

import de.dkfz.ichip.sql.SequencePostgreSQL9Dialect
import de.dkfz.mdsearch.config.MdSearchProperty
import de.dkfz.mdsearch.config.ConfigService

Properties mdSearchProperties = ConfigService.parsePropertiesFile()

String server = mdSearchProperties.getProperty(MdSearchProperty.DATABASE_SERVER.key)
String port = mdSearchProperties.getProperty(MdSearchProperty.DATABASE_PORT.key)
String database = mdSearchProperties.getProperty(MdSearchProperty.DATABASE_SCHEMA.key)

// common settings
dataSource {
    pooled = true
    dbCreate = "validate"
    driverClassName = "org.postgresql.Driver"
    dialect = SequencePostgreSQL9Dialect
    username = mdSearchProperties.getProperty(MdSearchProperty.DATABASE_USERNAME.key)
    password = mdSearchProperties.getProperty(MdSearchProperty.DATABASE_PASSWORD.key)
    url = "jdbc:postgresql://${server}:${port}/${database}"
    properties {
        jmxEnabled = true
        initialSize = 5
        maxActive = 20
        minIdle = 5
        maxIdle = 15
        maxWait = 10000
        maxAge = 10 * 60000
        timeBetweenEvictionRunsMillis = 5000
        minEvictableIdleTimeMillis = 60000
        validationQueryTimeout = 3
        validationInterval = 15000
        testOnBorrow = true
        testWhileIdle = true
        testOnReturn = false
        jdbcInterceptors = "ConnectionState;StatementCache(max=200)"
        defaultTransactionIsolation = java.sql.Connection.TRANSACTION_READ_COMMITTED
    }
}

hibernate {
    cache.use_second_level_cache = false
    cache.use_query_cache = false
    format_sql = true
    use_sql_comments = true
}
