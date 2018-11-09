/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

eventCompileStart = {
    // get current git revision, remove last character (which is a newline), write it to a template file
    new File("grails-app/views/layouts/_version.gsp").text = ("git rev-parse --short HEAD".execute().text)[0..-2]
    new File("grails-app/views/layouts/_date.gsp").text = new Date().format("yyyy-MM-dd")
}
