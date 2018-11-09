/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.Authentication

import groovy.json.JsonSlurper
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory
import org.apache.http.HttpResponse
import org.apache.http.client.HttpClient
import org.apache.http.client.methods.HttpPost
import org.apache.http.entity.StringEntity
import org.apache.http.impl.client.DefaultHttpClient
import org.apache.http.protocol.HTTP
import org.apache.http.util.EntityUtils
import org.codehaus.groovy.grails.commons.GrailsApplication

import javax.annotation.PreDestroy

class OauthService {

    GrailsApplication grailsApplication
    private static final Log log = LogFactory.getLog(this)

    @Lazy
    private String oauthProviderUrl = grailsApplication.config.security.adfs.url + '/oauth2/token'

    private HttpClient httpClient = new DefaultHttpClient()

    /**
     * Exchange an authorization code for an access token
     * @param authCode
     * @return
     */
    def exchangeAuthCode(String authCode) {
        def clientId
        def clientSecret

        clientId = grailsApplication.config.security.adfs.client.id
        clientSecret = grailsApplication.config.security.adfs.client.secret
        log.info("exchange code with client id: $clientId ")

        def params = [
                code         : authCode,
                client_id    : clientId,
                client_secret: clientSecret,
        ]

        getJsonResponse(params)
    }

    /**
     * Exchange a refresh Token for an access token
     * @param authCode
     * @return
     */
    def exchangeRefreshToken(String refreshtoken) {
        def clientId = grailsApplication.config.security.adfs.client.id
        def clientSecret = grailsApplication.config.security.adfs.client.secret

        def params = [
                refresh_token: refreshtoken,
                client_id    : clientId,
                client_secret: clientSecret,
        ]

        getJsonResponse(params)
    }


    private getJsonResponse(Map<String, String> params) {

        HttpPost httpPost = new HttpPost(oauthProviderUrl)
        if (params.get("code") != null) {
            httpPost.setEntity(new StringEntity("{\"code\":\"${params.get("code")}\",\"client_id\":\"${params.get("client_id")}\",\"client_secret\":\"${params.get("client_secret")}\" } "))
        } else {
            httpPost.setEntity(new StringEntity("{\"refresh_token\":\"${params.get("refresh_token")}\",\"client_id\":\"${params.get("client_id")}\",\"client_secret\":\"${params.get("client_secret")}\" } "))
        }
        httpPost.setHeader(HTTP.CONTENT_TYPE, "application/json")

        HttpResponse response = httpClient.execute(httpPost)

        try {
            String responseBody = response.entity.content.text
            log.info("OAuth response: $responseBody")
            EntityUtils.consume(response.entity)

            new JsonSlurper().parseText(responseBody)

        } finally {
            httpPost.releaseConnection()
        }
    }


    @PreDestroy
    private void close() {
        httpClient.connectionManager.shutdown()
    }
}
