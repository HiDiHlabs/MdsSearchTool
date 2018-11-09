/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

class UrlMappings {

    static mappings = {
        "/sites/$siteid/teiler/$teilerid/uploadStats"(controller: "upload", action: "uploadStats", method: "GET")
        "/sites/$siteid/teiler/$teilerid/uploadStats"(controller: "upload", action: "resetUploadStats", method: "DELETE")
        "/sites/$siteid/teiler/$teilerid/uploadStats"(controller: "upload", action: "setUploadStats", method: "PUT")
        "/sites/$siteid/teiler/$teilerid/patsPrefix/$prefix"(controller: "upload", action: "deletePatientsWithPrefix", method: "DELETE")
        "/sites/$siteid/teiler/$teilerid/pats/$patientid"(resource: "upload", method: "PUT")
        "/sites/$siteid/teiler/$teilerid/pats/$patientid/cases/$caseid"(controller: "upload", action: "uploadCase", method: "PUT")
        "/sites/$siteid/teiler/$teilerid/pats/$patientid/samples/$sampleid"(controller: "upload", action: "uploadSample", method: "PUT")
        "/stats/sites/$site/days/$ndays"(controller: "upload", action: "getMonitoringStats", method: "GET")

        "/$controller/$action?/$id?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
        "500"(view: '/error')
    }
}
