/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.util

import org.apache.xerces.jaxp.validation.XMLSchemaFactory
import org.xml.sax.SAXException

import javax.xml.XMLConstants
import javax.xml.transform.Source
import javax.xml.transform.stream.StreamSource

class XMLValidator {


    /**
     * Validates and throws SAXException if validation fails
     * @param XMLContent current parsing xml content
     * @throws org.xml.sax.SAXException
     */
    private static void validate(String XMLContent) throws SAXException{

        def xsdFiles = []
        def patientxsd = new StreamSource(new URL("http://schema.samply.de/ccp/Patient.xsd").openStream())
        xsdFiles.add(patientxsd)
        def casexsd = new StreamSource(new URL("http://schema.samply.de/ccp/Case.xsd").openStream())
        xsdFiles.add(casexsd)
        def samplexsd = new StreamSource(new URL("http://schema.samply.de/ccp/Sample.xsd").openStream())
        xsdFiles.add(samplexsd)
        def attributexsd = new StreamSource(new URL("http://schema.samply.de/ccp/Attribute.xsd").openStream())
        xsdFiles.add(attributexsd)
        def mdrkeyxsd = new StreamSource(new URL("http://schema.samply.de/ccp/MdrKey.xsd").openStream())
        xsdFiles.add(mdrkeyxsd)
        def valuexsd = new StreamSource(new URL("http://schema.samply.de/ccp/Value.xsd").openStream())
        xsdFiles.add(valuexsd)

        def factory = XMLSchemaFactory.newInstance(XMLConstants.W3C_XML_SCHEMA_NS_URI)
        def schema = factory.newSchema((Source[])xsdFiles.toArray())
        def validator = schema.newValidator()
        validator.validate(new StreamSource(new StringReader(XMLContent)))
    }
}
