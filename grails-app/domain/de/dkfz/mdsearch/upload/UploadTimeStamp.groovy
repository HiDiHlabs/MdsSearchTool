/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.upload

class UploadTimeStamp {


    String site
    String teiler
    String lastUpload

    static mapping = {
        table 'upload_time'
    }

    static constraints = {
        site unique: true

    }


}
