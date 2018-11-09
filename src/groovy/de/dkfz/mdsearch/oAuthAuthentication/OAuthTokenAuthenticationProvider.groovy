/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.oAuthAuthentication

import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException

/**
 *
 */
class OAuthTokenAuthenticationProvider implements AuthenticationProvider {
    private static final Log log = LogFactory.getLog(this)

    /**
     * Authenticates the application user and returns a populated
     * Authentication object if successful.
     * @param auth
     * @return
     * @throws AuthenticationException
     */
    @Override
    Authentication authenticate(Authentication auth) throws AuthenticationException {

        OAuthAuthenticationToken authentication = (OAuthAuthenticationToken) auth

        try {

            //make additional checks
            log.info("logged in")

        } catch (AuthenticationException authenticationException) {

            throw authenticationException
        }
        return createSuccessfulAuthentication(authentication)
    }

    private Authentication createSuccessfulAuthentication(Authentication authentication) {
        authentication.setAuthenticated(true)
        return authentication
    }

    /**
     * Tests whether this provider supports the Authentication
     * type being passed in.
     * @param authentication
     * @return
     */
    @Override
    boolean supports(Class<? extends Object> authentication) {
        return OAuthAuthenticationToken.class.isAssignableFrom(authentication)
    }


}