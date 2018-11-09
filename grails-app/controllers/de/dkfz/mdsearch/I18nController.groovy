/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import javax.servlet.ServletContext

class I18nController {

    def index(I18nCommand cmd) {
        File file = new File("grails-app/i18n/", cmd.id)
        if(file.exists()) {
            render new FileInputStream(file).getText()
        } else {
            ServletContext context = grailsApplication.parentContext.servletContext
            String filename = "/WEB-INF/grails-app/i18n/${cmd.id}"
            if (context.getResource(filename)) {
                render context.getResourceAsStream(filename).getText()
            }
        }
        render "# message file not available"
    }
}
class I18nCommand {
    String id
}
