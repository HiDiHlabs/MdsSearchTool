/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import de.dkfz.mdsearch.Authentication.OauthService
import org.apache.commons.lang.StringUtils
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

class AuthController {
    private static final Log log = LogFactory.getLog(this)
    OauthService oauthService
    static allowedMethods = [callback: 'GET', clearToken: 'GET']

    /**
     * The callback action for OAuth2 login
     */
    def callback(String code) {
        def tokenMap = getToken(code)
        if (!tokenMap) {
            redirect(controller: "home", action: "index",)
        } else {

            redirect(action: 'j_spring_security_token_check', params: tokenMap)
        }
    }


    private Map<String, String> getToken(String code) {

        def response = oauthService.exchangeAuthCode(code)

        if (response == null) {
            log.error("Auth code exchange failed: $response.error")
            return null
        } else {
            String idToken = response.id_token
            String accessToken = response.access_token
            String refreshToken = response.refresh_token
            return ["idToken": StringUtils.substringBetween(idToken, ".", "."), "accessToken": accessToken, "refreshToken": refreshToken]
        }
    }


    def clearToken() {
        session.removeAttribute('accessToken')
        redirect uri: '/'
    }

    def refreshToken() {

        if (session.accessToken && session.refresh_token) {
            def response = oauthService.exchangeRefreshToken(session.refresh_token)

            if (response.error) {
                log.error "Access token refresh failed: $response"
            } else {
                session.accessToken = response
            }
        }

        redirect(controller: "search", action: "index")
    }


}
