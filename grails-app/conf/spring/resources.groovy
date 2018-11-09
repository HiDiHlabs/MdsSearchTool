/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

import de.dkfz.mdsearch.oAuthAuthentication.OAuthAuthenticationFilter
import de.dkfz.mdsearch.oAuthAuthentication.OAuthTokenAuthenticationProvider
import grails.plugin.springsecurity.SpringSecurityUtils
import grails.util.Holders
import org.springframework.security.ldap.authentication.ad.ActiveDirectoryLdapAuthenticationProvider
import org.springframework.security.ldap.userdetails.InetOrgPersonContextMapper
import org.springframework.security.web.authentication.session.NullAuthenticatedSessionStrategy

// Place your Spring DSL code here
beans = {
    def conf = SpringSecurityUtils.securityConfig

    oAuthAuthenticationFilter(OAuthAuthenticationFilter) {
        filterProcessesUrl = 'j_spring_security_token_check'
        authenticationSuccessHandler = ref('authenticationSuccessHandler')
        authenticationFailureHandler = ref('authenticationFailureHandler')
        authenticationManager = ref('authenticationManager')
        sessionAuthenticationStrategy = ref('sessionAuthenticationStrategy')
    }

    // custom logout redirect
    logoutSuccessHandler(ADFSLogoutSuccessHandler) {
        redirectStrategy = ref('redirectStrategy')
        defaultTargetUrl = conf.logout.afterLogoutUrl
    }

    sessionAuthenticationStrategy(NullAuthenticatedSessionStrategy)

    ldapDaoAuthenticationProvider(LdapDaoAuthenticationProvider)

    oAuthTokenAuthenticationProvider(OAuthTokenAuthenticationProvider)

    inetPersonOrgContextMapper(InetOrgPersonContextMapper)

    ldapAuthoritiesMapper(LDAPGrantedAuthoritiesMapper)

    dktkAuthenticationProvider(ActiveDirectoryLdapAuthenticationProvider, Holders.config.springsecurity.ad.domain,
            Holders.config.springsecurity.ad.url) {
        authoritiesMapper = ref('ldapAuthoritiesMapper')
        userDetailsContextMapper = ref('inetPersonOrgContextMapper')
    }

    xmlns context: "http://www.springframework.org/schema/context"
    context.'component-scan'('base-package': "de.dkfz.mdsearch")

    xmlns task: "http://www.springframework.org/schema/task"
    task.executor(id: "taskExecutor", "pool-size": 10)
    task.scheduler(id: "taskScheduler", "pool-size": 10)
    task.'annotation-driven'(executor: "taskExecutor", scheduler: "taskScheduler")
}
