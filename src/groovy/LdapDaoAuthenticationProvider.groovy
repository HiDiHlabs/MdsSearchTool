/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.security.authentication.AuthenticationProvider
import org.springframework.security.authentication.BadCredentialsException
import org.springframework.security.ldap.authentication.LdapAuthenticationProvider
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.Authentication
import org.springframework.security.core.AuthenticationException
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException


/*
 * This provider checks the user in the AD(Active Directory) and in the DB (Database)
 * If a user is in the DB without a password then the password of the AD is used
 * If a user is not in the DB then he has no access
 */
class LdapDaoAuthenticationProvider implements AuthenticationProvider {
    /* includes two providers
     * Ldap for the AD and Userdetails for the Users in the DB
     */
    @Autowired
    LdapAuthenticationProvider ldapAuthProvider
    @Autowired
    UserDetailsService userDetailService

    Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String username = authentication.getName()
        UserDetails loadedUser
        /*
         * Searching the user in the DB if he is not found in the DB then he has no access and an exception is thrown
         * if the password of the user is not empty but he is trying to login then also
         * an exception is thrown because only the password in the DB is valid.
         * After these two steps the user has to authenticate with Ldap
         */
        try {
            loadedUser = userDetailService.loadUserByUsername(username)
        } catch(UsernameNotFoundException notFound) {
            throw new BadCredentialsException("Bad credentials")
        }

        if(loadedUser.password != "") {
            throw new BadCredentialsException("Bad credentials")
        }

        return ldapAuthProvider.authenticate(authentication)
    }

    @Override
    boolean supports(Class<? extends Object> aClass) {
        return (aClass == UsernamePasswordAuthenticationToken)
    }
}
