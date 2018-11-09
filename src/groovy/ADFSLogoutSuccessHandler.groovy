/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */


import de.dkfz.mdsearch.config.ConfigService
import de.dkfz.mdsearch.config.MdSearchProperty
import de.dkfz.mdsearch.oAuthAuthentication.OAuthAuthenticationToken
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler
import javax.servlet.ServletException
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import org.springframework.security.core.Authentication


class ADFSLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
    private static final ThreadLocal<Authentication> AUTH_HOLDER = new ThreadLocal<Authentication>()

    void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {
        AUTH_HOLDER.set authentication

        try {
            super.handle(request, response, authentication)
        }
        finally {
            AUTH_HOLDER.remove()

        }
    }

    @Override
    protected String determineTargetUrl(HttpServletRequest request, HttpServletResponse response) {
        Authentication auth = AUTH_HOLDER.get()

        String url = super.determineTargetUrl(request, response)

        if (auth instanceof OAuthAuthenticationToken) {
            Properties mdsearchProperties = ConfigService.parsePropertiesFile()
            url = mdsearchProperties.getProperty(MdSearchProperty.ADFS_LOGOUT_URL.key)
        }

        return url
    }


}
