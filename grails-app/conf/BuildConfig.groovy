 /*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */
grails.servlet.version = "3.0" // Change depending on target container compliance (2.5 or 3.0)
grails.project.class.dir = "target/classes"
grails.project.test.class.dir = "target/test-classes"
grails.project.test.reports.dir = "target/test-reports"
grails.project.work.dir = "target/work"
grails.project.target.level = 1.8
grails.project.source.level = 1.8
grails.project.dependency.resolver = "maven" // or ivy

grails.project.dependency.resolution = {
    // inherit Grails' default dependencies
    inherits("global") {
    }
    log "error" // log level of Ivy resolver, either 'error', 'warn', 'info', 'debug' or 'verbose'
    checksums true // Whether to verify checksums on resolve

    repositories {
        inherits true // Whether to inherit repository definitions from plugins

        String repoUrl = System.getenv("MAVEN_REPOSITORY_URL")
        String samplyRepoUrl = System.getenv("MAVEN_SAMPLY_REPOSITORY_URL")
        //String samplySnapshotRepoUrl = System.getenv("MAVEN_SAMPLY_SNAPSHOT_REPOSITORY_URL")

        assert repoUrl : "Set the environment variable MAVEN_REPOSITORY_URL"
        //assert samplyRepoUrl : "Set the environment variable MAVEN_SAMPLY_REPOSITORY_URL"
        //assert samplySnapshotRepoUrl : "Set the environment variable MAVEN_SAMPLY_SNAPSHOT_REPOSITORY_URL"

        mavenRepo repoUrl
        mavenRepo samplyRepoUrl

    }

    dependencies {
        // specify dependencies here under either 'build', 'compile', 'runtime', 'test' or 'provided' scopes eg.
        runtime("org.postgresql:postgresql:9.4-1200-jdbc41") {
            exclude "slf4j-simple" //http://www.slf4j.org/codes.html#multiple_bindings
        }
        compile "org.antlr:stringtemplate:4.0.2"
        compile "com.fasterxml.jackson.core:jackson-databind:2.2.0"
        compile "log4j:apache-log4j-extras:1.2.17"
        compile "de.samply:share-dto:4.6.5"
        compile "de.samply:common-mdrvalidator:2.0.0"
    }

    plugins {
        // plugins for the build system only
        build ':tomcat:8.0.50'

        // plugins for the compile step
        runtime ":resources:1.2.14"
        compile ":lesscss-resources:1.3.3"
        compile ":spring-security-core:2.0.0"
        compile ":spring-security-ldap:2.0.1"
        compile ":standalone:1.3"
        compile ":rest:0.8"
        compile ":console:1.5.3"
        compile ":remote-ssh:0.7"

        // plugins needed at runtime but not for compilation
        runtime ":hibernate4:4.3.6.1"
        runtime ":jquery:1.11.1"
        runtime ":jquery-ui:1.10.4"
    }
}
