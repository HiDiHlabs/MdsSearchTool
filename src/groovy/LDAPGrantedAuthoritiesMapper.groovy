/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

import grails.util.Holders
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.mapping.GrantedAuthoritiesMapper

/**
 * Map LDAP/AD groups to application roles
 */
class LDAPGrantedAuthoritiesMapper implements GrantedAuthoritiesMapper {


    Map<List<String>, List<String>> mapping

    enum LDAPAuthority implements GrantedAuthority{
        ROLE_USER,
        ROLE_UPLOAD,
        ROLE_ADMIN;

        String getAuthority() {
            return name()
        }
    }


    LDAPGrantedAuthoritiesMapper() {
        mapping = Holders.config.authorities?.mapping ?: [:]
    }

    Collection mapAuthorities(Collection<? extends GrantedAuthority> authorities) {
        Set roles = EnumSet.noneOf(LDAPAuthority.class) //empty EnumSet
        List<String> authoritiesAsString = authorities.collect { it.getAuthority() }
        for (Map.Entry<List<String>, List<String>> entry in mapping) {
            if(authoritiesAsString.containsAll(entry.key)) {
                for(String role : entry.value) {
                    roles.add(LDAPAuthority.valueOf(role))
                }
            }
        }
        return roles
    }
}
