/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */


import de.dkfz.mdsearch.config.MdSearchProperty
import de.dkfz.mdsearch.config.ConfigService
import org.apache.commons.logging.LogFactory
import org.apache.log4j.rolling.RollingFileAppender
import org.apache.log4j.rolling.TimeBasedRollingPolicy

Properties mdsearchProperties = ConfigService.parsePropertiesFile()


grails.project.groupId = appName // change this to alter the default package name and Maven publishing destination

// The ACCEPT header will not be used for content negotiation for user agents containing the following strings (defaults to the 4 major rendering engines)
grails.mime.disable.accept.header.userAgents = ['Gecko', 'WebKit', 'Presto', 'Trident']
grails.mime.types = [ // the first one is the default format
                      all          : '*/*', // 'all' maps to '*' or the first available format in withFormat
                      atom         : 'application/atom+xml',
                      css          : 'text/css',
                      csv          : 'text/csv',
                      form         : 'application/x-www-form-urlencoded',
                      html         : ['text/html', 'application/xhtml+xml'],
                      js           : 'text/javascript',
                      json         : ['application/json', 'text/json'],
                      multipartForm: 'multipart/form-data',
                      rss          : 'application/rss+xml',
                      text         : 'text/plain',
                      hal          : ['application/hal+json', 'application/hal+xml'],
                      xml          : ['text/xml', 'application/xml']
]

// URL Mapping Cache Max Size, defaults to 5000
//grails.urlmapping.cache.maxsize = 1000

// What URL patterns should be processed by the resources plugin
grails.resources.adhoc.patterns = ['/images/*', '/css/*', '/js/*', '/plugins/*']

// GSP settings
grails {
    views {
        gsp {
            encoding = 'UTF-8'
            htmlcodec = 'xml' // use xml escaping instead of HTML4 escaping
            codecs {
                expression = 'html' // escapes values inside ${}
                scriptlet = 'html' // escapes output from scriptlets in GSPs
                taglib = 'none' // escapes output from taglibs
                staticparts = 'none' // escapes output from static template parts
            }
        }
        // escapes all not-encoded output at final stage of outputting
        // filteringCodecForContentType.'text/html' = 'html'
    }
}

grails.databinding.trimStrings = false
grails.databinding.convertEmptyStringsToNull = false

grails.converters.encoding = "UTF-8"
// enable Sitemesh preprocessing of GSP pages
grails.views.gsp.sitemesh.preprocess = true
// scaffolding templates configuration
grails.scaffolding.templates.domainSuffix = 'Instance'

// Set to false to use the new Grails 1.2 JSONBuilder in the render method
grails.json.legacy.builder = false
// enabled native2ascii conversion of i18n properties files
grails.enable.native2ascii = true
// packages to include in Spring bean scanning
grails.spring.bean.packages = []
// whether to disable processing of multi part requests
grails.web.disable.multipart = false

// request parameters to mask when logging exceptions
grails.exceptionresolver.params.exclude = ['password']

// enable query caching by default
grails.hibernate.cache.queries = true

grails.gorm.default.mapping = {
    id generator: 'identity'
}

// set per-environment serverURL stem for creating absolute links
environments {
    development {
        grails.logging.jul.usebridge = true
    }
    production {
        grails.logging.jul.usebridge = false
        // TODO: grails.serverURL = "http://www.changeme.com"
    }
}

// log4j configuration
log4j = {
    environments {
        production {
            String n = System.getProperty('mdsearch.instance')

            // login logs, rotated monthly
            def loginAppender = new RollingFileAppender(name: 'loginAppender', layout: pattern(conversionPattern: "%d %-5p %x - %m%n"))
            def loginPolicy = new TimeBasedRollingPolicy(activeFileName: "logs/mdsearch-${n}-login.log", fileNamePattern: "logs/archive/mdsearch-${n}-login.%d{yyyy-MM}.log")
            loginPolicy.activateOptions()
            loginAppender.setRollingPolicy loginPolicy

            // queries logs, rotated monthly
            def queryAppender = new RollingFileAppender(name: 'queryAppender', layout: pattern(conversionPattern: "%d %-5p %x - %m%n"))
            def queryPolicy = new TimeBasedRollingPolicy(activeFileName: "logs/mdsearch-${n}-query.log", fileNamePattern: "logs/archive/mdsearch-${n}-query.%d{yyyy-MM}.log")
            queryPolicy.activateOptions()
            queryAppender.setRollingPolicy queryPolicy

            // upload logs, rotated daily and gzipped
            def uploadAppender = new RollingFileAppender(name: 'uploadAppender', layout: pattern(conversionPattern: "%d %-5p %x - %m%n"))
            def uploadPolicy = new TimeBasedRollingPolicy(activeFileName: "logs/mdsearch-${n}-upload.log", fileNamePattern: "logs/archive/mdsearch-${n}-upload.%d{yyyy-MM-dd}.gz")
            uploadPolicy.activateOptions()
            uploadAppender.setRollingPolicy uploadPolicy

            // upload Error logs, rotated daily and gzipped
            def uploadErrorAppender = new RollingFileAppender(name: 'uploadErrorAppender', layout: pattern(conversionPattern: "%d %-5p %x - %m%n"))
            def uploadErrorPolicy = new TimeBasedRollingPolicy(activeFileName: "logs/mdsearch-${n}-uploadError.log", fileNamePattern: "logs/archive/mdsearch-${n}-uploadError.%d{yyyy-MM-dd}.gz")
            uploadErrorPolicy.activateOptions()
            uploadErrorAppender.setRollingPolicy uploadErrorPolicy

            // MDR update logs, rotated monthly
            def mdrAppender = new RollingFileAppender(name: 'mdrAppender', layout: pattern(conversionPattern: "%d %-5p %x - %m%n"))
            def mdrPolicy = new TimeBasedRollingPolicy(activeFileName: "logs/mdsearch-${n}-mdr.log", fileNamePattern: "logs/archive/mdsearch-${n}-mdr.%d{yyyy-MM}.log")
            mdrPolicy.activateOptions()
            mdrAppender.setRollingPolicy mdrPolicy

            // debug logs are rotated daily and gzipped
            def debugAppender = new RollingFileAppender(name: 'debugAppender', layout: pattern(conversionPattern: "%d [%t] %-5p %c %x - %m%n"))
            def debugPolicy = new TimeBasedRollingPolicy(activeFileName: "logs/mdsearch-${n}-debug.log", fileNamePattern: "logs/archive/mdsearch-${n}-debug.%d{yyyy-MM-dd}.gz")
            debugPolicy.activateOptions()
            debugAppender.setRollingPolicy debugPolicy

            appenders {
                appender loginAppender
                appender queryAppender
                appender uploadAppender
                appender uploadErrorAppender
                appender mdrAppender
                appender debugAppender
            }
        }
    }

    info 'loginAppender': [
            'Config',
            'de.dkfz.mdsearch.AuthController',
            'de.dkfz.mdsearch.Authentication.OauthService',
            'de.dkfz.mdsearch.oAuthAuthentication.OAuthAuthenticationToken',
            'de.dkfz.mdsearch.oAuthAuthentication.OAuthAuthenticationFilter',
            'de.dkfz.mdsearch.oAuthAuthentication.OAuthTokenAuthenticationProvider',

    ]
    info 'queryAppender': [
            'de.dkfz.mdsearch.QueryService',
            'de.dkfz.mdsearch.SearchController',
            'SearchController'
    ]
    info 'uploadErrorAppender': [
            'de.dkfz.mdsearch.UploadController'
    ]
    info 'uploadAppender': [
            'de.dkfz.mdsearch.upload.UploadService'
    ]
    info 'mdrAppender': [
            'de.dkfz.mdsearch.upload.MdsCheckService',
            'de.dkfz.mdsearch.upload.MdrService',
    ]

    error 'debugAppender': [
            'org.codehaus.groovy.grails.web.servlet',        // controllers
            'org.codehaus.groovy.grails.web.pages',          // GSP
            'org.codehaus.groovy.grails.web.sitemesh',       // layouts
            'org.codehaus.groovy.grails.web.mapping.filter', // URL mapping
            'org.codehaus.groovy.grails.web.mapping',        // URL mapping
            'org.codehaus.groovy.grails.commons',            // core / classloading
            'org.codehaus.groovy.grails.plugins',            // plugins
            'org.codehaus.groovy.grails.orm.hibernate',      // hibernate integration
            'org.springframework',
            'org.hibernate',
            'net.sf.ehcache.hibernate'
            // uncomment to log hibernate/SQL statements
            /*'org.hibernate.SQL',
    ]
    trace 'debugAppender': [
            'org.hibernate.type.descriptor.sql.BasicBinder', */
    ]
}

grails.plugin.springsecurity.useBasicAuth = true
grails.plugin.springsecurity.basic.realmName = "definitions.MDS Upload WebService"

grails.plugin.springsecurity.filterChain.chainMap = [
        '/sites/**': 'JOINED_FILTERS,-exceptionTranslationFilter',
        '/stats/**': 'JOINED_FILTERS,-exceptionTranslationFilter',
        '/**'      : 'JOINED_FILTERS,-basicAuthenticationFilter,-basicExceptionTranslationFilter'
]

grails.plugin.springsecurity.providerNames = ['oAuthTokenAuthenticationProvider', 'daoAuthenticationProvider', 'dktkAuthenticationProvider', 'anonymousAuthenticationProvider']
grails.plugin.springsecurity.userLookup.userDomainClassName = 'de.dkfz.mdsearch.userData.User'
grails.plugin.springsecurity.userLookup.authorityJoinClassName = 'de.dkfz.mdsearch.userData.UserRole'
grails.plugin.springsecurity.authority.className = 'de.dkfz.mdsearch.userData.userData.Role'

grails.plugin.springsecurity.securityConfigType = "InterceptUrlMap"
grails.plugin.springsecurity.interceptUrlMap = [
        '/login/**' : ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/auth/**'  : ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/home/**'  : ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/i18n/**'  : ['IS_AUTHENTICATED_ANONYMOUSLY'],
        '/sites/**' : ['ROLE_UPLOAD'],
        '/stats/**' : ['ROLE_UPLOAD', "ROLE_ADMIN", "ROLE_MONITORING"],
        '/upload/**': ['ROLE_UPLOAD'],
        '/admin/**' : ['ROLE_ADMIN'],
        '/**'       : ['ROLE_USER']
]


grails.plugin.springsecurity.useSecurityEventListener = true


grails.plugin.springsecurity.onAbstractAuthenticationFailureEvent = { e, appCtx ->
    // handle AbstractAuthenticationFailureEvent
    log = LogFactory.getLog(Config)
    log.info "Authentication event: ${e?.class?.simpleName} \n" +
            "Timestamp: ${new Date(e?.getTimestamp())} \n" +
            "Username: ${e?.getAuthentication()?.getPrincipal()} \n" +
            "Is authenticated: ${e?.getAuthentication()?.isAuthenticated()} \n" +
            "Roles: ${e?.getAuthentication()?.getAuthorities()} \n" +
            "Remote-IP: ${e?.getAuthentication()?.getDetails()?.getRemoteAddress()} \n" +
            "Session-Id: ${e?.getAuthentication()?.getDetails()?.getSessionId()} \n"
}

grails.plugin.springsecurity.onAuthenticationSuccessEvent = { e, appCtx ->
    // handle AuthenticationSuccessEvent
    log = LogFactory.getLog(Config)
    log.info "Authentication event: ${e?.class?.simpleName} \n" +
            "Timestamp: ${new Date(e?.getTimestamp())} \n" +
            "Username: ${e?.getAuthentication()?.getPrincipal()?.getUsername()} \n" +
            "Granted Authorities: ${e?.getAuthentication()?.getPrincipal()?.getAuthorities()} \n" +
            "Password none expired: ${e?.getAuthentication()?.getPrincipal()?.isCredentialsNonExpired()} \n" +
            "Is authenticated: ${e?.getAuthentication()?.isAuthenticated()} \n" +
            "Roles: ${e?.getAuthentication()?.getAuthorities()} \n" +
            "Remote-IP: ${e?.getAuthentication()?.getDetails()?.getRemoteAddress()} \n" +
            "Session-Id: ${e?.getAuthentication()?.getDetails()?.getSessionId()} \n"
}


grails.plugin.springsecurity.auth.loginFormUrl = '/home/index'

grails.plugin.springsecurity.password.algorithm = 'bcrypt'
grails.plugin.springsecurity.password.bcrypt.logrounds = 10
grails.plugin.springsecurity.successHandler.alwaysUseDefault = true
grails.plugin.springsecurity.successHandler.defaultTargetUrl = '/search/index'

// settings for spring security AD authentication provider
springsecurity.ad.domain = mdsearchProperties.getProperty(MdSearchProperty.AD_DOMAIN.key)
springsecurity.ad.url = mdsearchProperties.getProperty(MdSearchProperty.AD_SERVER.key)

environments {

    production {

        security.adfs.callback.url = mdsearchProperties.getProperty(MdSearchProperty.ADFS_CALLBACK_URL.key)
        security.adfs.url = mdsearchProperties.getProperty(MdSearchProperty.ADFS_URL.key)
        security.adfs.client.id = mdsearchProperties.getProperty(MdSearchProperty.ADFS_ClIENT_ID.key)
        security.adfs.client.secret = mdsearchProperties.getProperty(MdSearchProperty.ADFS_CLIENT_SECRET.key)
        security.adfs.logout.url = mdsearchProperties.getProperty(MdSearchProperty.ADFS_LOGOUT_URL.key)
        security.adfs.ip = mdsearchProperties.getProperty(MdSearchProperty.ADFS_IP.key)

        server.url = mdsearchProperties.getProperty(MdSearchProperty.CONFIG_SERVER_URL.key)

        decentralsearch.forwarding.url = mdsearchProperties.getProperty(MdSearchProperty.DECENTRALSEARCH_FORWARDING_URL.key)
    }
}

// a map for mapping of LDAP/AD groups to roles:
// a user who is member of all the groups in a key gets all the roles in the corresponding value
List<String> user = mdsearchProperties.getProperty(MdSearchProperty.LDAP_ROLEMAPPING_USER.key).split(",")
List<String> admin = mdsearchProperties.getProperty(MdSearchProperty.LDAP_ROLEMAPPING_ADMIN.key).split(",")
List<String> upload = mdsearchProperties.getProperty(MdSearchProperty.LDAP_ROLEMAPPING_UPLOAD.key).split(",")
Map<List, List> roleMapping = [:]
if (user) {
    user.each {
        roleMapping.put([it], ["ROLE_USER"])
    }
}
if (admin) {
    admin.each {
        if (roleMapping.get([it])) {
            roleMapping.get([it]).add("ROLE_ADMIN")
        } else {
            roleMapping.put([it], ["ROLE_ADMIN"])
        }
    }
}
if (upload) {
    upload.each {
        // uploader must only have the UPLOAD role
        roleMapping.put([it], ["ROLE_UPLOAD"])
    }
}
authorities.mapping = roleMapping
roleMapping.each{ k, v -> println "${k}:${v}" }
