/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.config

import grails.util.Environment
import org.springframework.beans.BeansException
import org.springframework.context.ApplicationContext
import org.springframework.context.ApplicationContextAware


class ConfigService implements ApplicationContextAware {

    protected Map<MdSearchProperty, String> mdSearchProperties

    static ApplicationContext context

    /**
     * Parses the file in the environment variable $MDSEARCH_PROPERTIES with fallback to ~/.mdsearch.properties
     * This method must only be used in ConfigService, Config.groovy and DataSource.groovy
     */
    static Properties parsePropertiesFile() {
        Properties properties = new Properties()
        String propertiesFile = System.getenv("MDSEARCH_PROPERTIES")
        if (propertiesFile && new File(propertiesFile).canRead()) {
            properties.load(new FileInputStream(propertiesFile))
        } else {
            if(Environment.isDevelopmentMode()){
                properties.load(new FileInputStream("${System.getProperty("user.home")}${File.separator}.mdsearch.properties"))
            }else{
               throw new Exception("Provide config with ")
            }
        }
        return properties
    }

    ConfigService() {
        Properties properties = parsePropertiesFile()
        this.mdSearchProperties = properties.collectEntries { key, value ->
            MdSearchProperty otpProperty = MdSearchProperty.findByKey(key)
            if (otpProperty) {
                return [(otpProperty): value]
            } else {
                return [:]
            }
        }
    }

    static ConfigService getInstance() {
        return context.getBean("configService")
    }


    File getRootPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_PROJECT_ROOT) ?: "")
    }

    File getScriptOutputPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_SCRIPTS_OUTPUT) ?: "")
    }

    File getProcessingRootPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_PROCESSING_ROOT) ?: "")
    }

    File getToolsPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_TOOLS) ?: "")
    }


    File getLoggingRootPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_CLUSTER_LOGS_OTP) ?: "")
    }

    File getJobLogDirectory() {
        return getAndCheckPathFromProperty(MdSearchProperty.PATH_JOB_LOGS)
    }

    File getStackTracesDirectory() {
        return getAndCheckPathFromProperty(MdSearchProperty.PATH_STACK_TRACES)
    }

    File getRoddyPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_RODDY) ?: "")
    }

    // this path is where the metadata file is copied
    File getSeqCenterInboxPath() {
        return new File(mdSearchProperties.get(MdSearchProperty.PATH_SEQ_CENTER_INBOX) ?: "")
    }


    String getLdapServer() {
        return mdSearchProperties.get(MdSearchProperty.LDAP_SERVER)
    }

    String getLdapSearchBase() {
        return mdSearchProperties.get(MdSearchProperty.LDAP_SEARCH_BASE)
    }

    String getLdapManagerDistinguishedName() {
        return mdSearchProperties.get(MdSearchProperty.LDAP_MANAGER_DN)
    }

    String getLdapManagerPassword() {
        return mdSearchProperties.get(MdSearchProperty.LDAP_MANAGER_PASSWORD)
    }

    String getEnvironmentName() {
        if (mdSearchProperties.get(MdSearchProperty.CONFIG_ENVIRONMENT_NAME)) {
            return mdSearchProperties.get(MdSearchProperty.CONFIG_ENVIRONMENT_NAME)
        } else {
            return Environment.getCurrent().name
        }
    }


    private File getAndCheckPathFromProperty(MdSearchProperty property) {
        File file = new File(mdSearchProperties.get(property) ?: property.defaultValue)
        if (!file.absolute && Environment.getCurrent() == Environment.PRODUCTION) {
            throw new RuntimeException("${property} is \"${file}\", but only an absolute path is allowed.")
        }
        return file
    }

    private boolean getBooleanValue(MdSearchProperty otpPropertiesValue, boolean defaultValue) {
        return mdSearchProperties.get(otpPropertiesValue) ? Boolean.parseBoolean(mdSearchProperties.get(otpPropertiesValue)) : defaultValue
    }

    @Override
    void setApplicationContext(ApplicationContext applicationContext) throws BeansException {
        context = applicationContext
    }
}
