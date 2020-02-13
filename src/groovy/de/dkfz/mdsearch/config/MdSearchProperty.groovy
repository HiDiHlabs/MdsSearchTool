/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.config


import grails.util.Environment

enum MdSearchProperty {

    AD_SERVER('security.ad.server', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    AD_DOMAIN('security.ad.domain', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),

    ADFS_CALLBACK_URL('security.adfs.callback.url', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    ADFS_URL('security.adfs.url', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    ADFS_ClIENT_ID('security.adfs.client.id', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    ADFS_CLIENT_SECRET('security.adfs.client.secret', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    ADFS_LOGOUT_URL('security.adfs.logout.url', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    ADFS_IP('security.adfs.ip', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),

    LDAP_ROLEMAPPING_UPLOAD('security.ldap.rolemapping.upload', TypeValidators.SINGLE_LINE_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    LDAP_ROLEMAPPING_USER('security.ldap.rolemapping.user', TypeValidators.SINGLE_LINE_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    LDAP_ROLEMAPPING_ADMIN('security.ldap.rolemapping.admin', TypeValidators.SINGLE_LINE_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),


    DATABASE_SERVER('database.server', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    DATABASE_PORT('database.port', TypeValidators.POSITIVE_NUMBER, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    DATABASE_SCHEMA('database.database', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    DATABASE_USERNAME('database.username', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    DATABASE_PASSWORD('database.password', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),

    DECENTRALSEARCH_FORWARDING_URL('decentralsearch.forwarding.url', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION)),

    MDR_BASE_URL('mdr.url', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),

    MONITORING_USER('monitoring.username', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    MONITORING_PASSWORD('monitoring.password', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),

    ADMIN_USER('admin.username', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    ADMIN_PASSWORD('admin.password', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),


    TEST_SEARCH_USER('testsearch.username', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),
    TEST_SEARCH__PASSWORD('testsearch.password', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION, UsedIn.DEVELOPMENT)),

    CONFIG_SERVER_URL('server.url', TypeValidators.SINGLE_WORD_TEXT, EnumSet.of(UsedIn.PRODUCTION)),
    CONFIG_ENVIRONMENT_NAME('environment.name', TypeValidators.SINGLE_LINE_TEXT, EnumSet.of(UsedIn.PRODUCTION), Environment.getCurrent().name),

    final String key

    final TypeValidators validator

    EnumSet<UsedIn> usedIn

    final String defaultValue


    MdSearchProperty(String key, TypeValidators validator, EnumSet<UsedIn> usedIn, String defaultValue = null) {
        assert key
        assert validator
        assert usedIn

        this.key = key
        this.validator = validator
        this.usedIn = usedIn
        this.defaultValue = defaultValue
    }

    static MdSearchProperty findByKey(String key) {
        return values().find {
            it.key == key
        }
    }
}

enum UsedIn {
    DEVELOPMENT,
    PRODUCTION,
    TEST,
}
