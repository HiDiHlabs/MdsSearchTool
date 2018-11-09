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
import org.springframework.context.ApplicationEventPublisher
import org.springframework.context.ApplicationEventPublisherAware
import org.springframework.security.authentication.AuthenticationManager
import org.springframework.security.authentication.event.InteractiveAuthenticationSuccessEvent
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.web.authentication.AuthenticationFailureHandler
import org.springframework.security.web.authentication.AuthenticationSuccessHandler
import org.springframework.security.web.authentication.WebAuthenticationDetails
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy
import org.springframework.web.filter.GenericFilterBean

import javax.servlet.FilterChain
import javax.servlet.ServletException
import javax.servlet.ServletRequest
import javax.servlet.ServletResponse
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse

/**
 * Part of the security filter chain for math-based authentication.
 */
class OAuthAuthenticationFilter extends GenericFilterBean implements ApplicationEventPublisherAware {
    private static final Log log = LogFactory.getLog(this)

    String filterProcessesUrl
    AuthenticationManager authenticationManager
    SessionAuthenticationStrategy sessionAuthenticationStrategy
    AuthenticationSuccessHandler authenticationSuccessHandler
    AuthenticationFailureHandler authenticationFailureHandler
    ApplicationEventPublisher applicationEventPublisher

    /**
     * If the incoming request URI contains 'j_spring_security_oauth_check',
     * the filter commences oauth-based authentication.
     * @param req
     * @param resp
     * @param chain
     * @throws IOException
     * @throws ServletException
     */
    @Override
    void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)  throws IOException,
            ServletException {
        HttpServletRequest request = (HttpServletRequest) req
        HttpServletResponse response = (HttpServletResponse) resp

        // If the request URI doesn't contain the filterProcessesUrl,
        // it isn't a request that should be handled by this filter
        if(!request.getRequestURI().contains(filterProcessesUrl)) {
            chain.doFilter(request, response)
            return
        }

        log.info('Request requires OAuth-based authentication')

        Authentication authentication

        try {
            authentication = attemptAuthentication(request)
            if(!authentication) {
                return
            }
            sessionAuthenticationStrategy.onAuthentication(authentication, request, response)

        } catch(AuthenticationException failed) {
            unsuccessfulAuthentication(request, response, failed)
            return
        }
        successfulAuthentication(request, response, authentication)
    }

    /**
     * Builds an Authentication object and passes it to the AuthenticationManager
     * to attempt to authenticate the user.
     * @param request
     * @return
     * @throws AuthenticationException
     */
    Authentication attemptAuthentication(HttpServletRequest request) throws AuthenticationException {
        String token = request.getParameter('idToken')
        String accessToken = request.getParameter('accessToken')
        log.info("token ${token} accessToken: ${accessToken}")
        OAuthAuthenticationToken authtoken = new OAuthAuthenticationToken(["idToken":token,"accessToken":accessToken])
        authtoken.details= new WebAuthenticationDetails(request)
        return this.getAuthenticationManager().authenticate(authtoken)
    }

    /**
     * Puts the populated Authentication instance in the SecurityContextHolder
     * at which point the user is authenticated.
     * @param request
     * @param response
     * @param authentication
     */
    private void successfulAuthentication(HttpServletRequest request,
                                          HttpServletResponse response,
                                          Authentication authentication) {
        log.info("Successfully authenticated with OAuth-based authentication: " + authentication)
        // When a populated Authentication object is placed in the SecurityContextHolder,
        // the user is authenticated.
        SecurityContextHolder.getContext().setAuthentication(authentication)

        applicationEventPublisher.publishEvent(new InteractiveAuthenticationSuccessEvent(authentication, this.getClass()))

        authenticationSuccessHandler.onAuthenticationSuccess(request, response, authentication)
    }

    /**
     * Clears the SecurityContextHolder handles unsuccessful authentication.
     * @param request
     * @param response
     * @param failed
     */
    private void unsuccessfulAuthentication(HttpServletRequest request,
                                            HttpServletResponse response,
                                            AuthenticationException failed) {
        SecurityContextHolder.clearContext()
        log.error('OAuth-based authentication failed: ' + failed.toString())
        authenticationFailureHandler.onAuthenticationFailure(request,
                response,
                failed)
    }


}
