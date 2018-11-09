/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch


import de.dkfz.mdsearch.upload.EntityCatalogCheckService
import de.dkfz.mdsearch.upload.MdsCheckService
import grails.converters.JSON

class AdminController {
    MdsCheckService mdsCheckService
    EntityCatalogCheckService entityCatalogCheckService


    def index() {    }

    def updateMetadata() {
        boolean successful = mdsCheckService.checkAndUpdateAttributes()
        if (successful) {
            successful = entityCatalogCheckService.updateEntityCatalog()
        }
        render(["successful": successful] as JSON)
    }
}
