/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.oAuthAuthentication

import groovy.json.JsonSlurper
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.springframework.security.core.Authentication
import org.springframework.security.core.CredentialsContainer
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority


import java.security.Principal

/**
 *
 */
class OAuthAuthenticationToken implements Authentication, CredentialsContainer {
    private static final Log log = LogFactory.getLog(this)

    Object credentials
    Object username
    String name
    String email
    String roles
    String userType
    String token
    String refreshToken
    Object details
    Principal principal
    Collection<GrantedAuthority> authorities = []
    Boolean authenticated = false

    OAuthAuthenticationToken(Map<String,String> tokenList) {
        log.info("create Authentication token")
        token = tokenList.get("accessToken")
        refreshToken = tokenList.get("refreshToken")
        String decodedToken= new String(tokenList.get("idToken").decodeBase64())
        JsonSlurper slurper = new JsonSlurper()
        def parsedToken = slurper.parseText(decodedToken)
        log.info parsedToken
        this.name = parsedToken.name
        this.email = parsedToken.email
        this.username = parsedToken.email
        this.roles =  parsedToken.roles
        this.userType = parsedToken.usertype
        log.info("Roles in Authentication Token: ${parsedToken.roles}")
        log.info("Usertype in Authentication Token: ${parsedToken.usertype}")
        this.authorities << new SimpleGrantedAuthority('ROLE_USER')
        this.principal = new Principal() {
            @Override
            String getName() {
                return email
            }
        }
        log.info("Authentication token created")

    }

    @Override
    boolean isAuthenticated() {
        return authenticated
    }

    @Override
    void setAuthenticated(boolean authenticated) throws IllegalArgumentException {
        this.authenticated = authenticated
    }

    @Override
    String getName() {
        return getEmail()
    }

    String isCredentialsNonExpired(){
        return "NA"
    }

    String getEmail(){
        return email
    }

    String getDisplayName() {
        return name
    }

    String getAccessToken(){
        return token
    }

    String getRefreshToken(){
        return refreshToken
    }

    @Override
    void eraseCredentials() {
        if (this.credentials instanceof CredentialsContainer) {
            ((CredentialsContainer)this.credentials).eraseCredentials();
        }
    }
}
