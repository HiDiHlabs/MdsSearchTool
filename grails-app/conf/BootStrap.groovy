/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */


import de.dkfz.mdsearch.config.MdSearchProperty
import de.dkfz.mdsearch.config.ConfigService
import de.dkfz.mdsearch.userData.Role
import de.dkfz.mdsearch.userData.User
import de.dkfz.mdsearch.userData.UserRole
import grails.plugin.springsecurity.SecurityFilterPosition
import grails.plugin.springsecurity.SpringSecurityUtils

class BootStrap {

    def init = { servletContext ->
        SpringSecurityUtils.clientRegisterFilter('oAuthAuthenticationFilter',
                SecurityFilterPosition.SECURITY_CONTEXT_FILTER.order + 10)
        Properties mdSearchProperties = ConfigService.parsePropertiesFile()

        String monitoringUser = mdSearchProperties.getProperty(MdSearchProperty.MONITORING_USER.key)
        String monitoringPwd = mdSearchProperties.getProperty(MdSearchProperty.MONITORING_PASSWORD.key)

        String testSearchUser = mdSearchProperties.getProperty(MdSearchProperty.TEST_SEARCH_USER.key)
        String testSearchPwd = mdSearchProperties.getProperty(MdSearchProperty.TEST_SEARCH__PASSWORD.key)


        if(monitoringUser && monitoringPwd && !monitoringUser.empty && !monitoringPwd.empty){
            if (User.findByUsername(monitoringUser) == null) {
                new Role(authority: 'ROLE_MONITORING').save(flush: true)
                User monitor = new User(username: monitoringUser, password: monitoringPwd, enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, mail: "monitoring@mail.com", displayName: "monitoring-user").save(flush: true)
                new UserRole(user: monitor, role: Role.findByAuthority('ROLE_MONITORING')).save(flush: true, failOnError: true)
            }
        }

        if(testSearchUser && testSearchPwd && !testSearchUser.empty && !testSearchPwd.empty){
            if (User.findByUsername(testSearchUser) == null) {
                new Role(authority: 'ROLE_USER').save(flush: true)
                User user = new User(username: testSearchUser, password: testSearchPwd, enabled: true, accountExpired: false, accountLocked: false, passwordExpired: false, mail: "test-user@mail.com", displayName: "test-user").save(flush: true)
                new UserRole(user: user, role: Role.findByAuthority('ROLE_USER')).save(flush: true, failOnError: true)
            }
        }

    }
    def destroy = {
    }
}
