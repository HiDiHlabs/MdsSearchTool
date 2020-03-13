package entity;

import de.samply.share.model.ccp.Patient;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;
import java.io.StringReader;


public class PatientXmlParser {



    public ParsedEntity read (String xmlPatient, String siteId, String teilerId) throws PatientXmlParserException {

        Patient patient = unmarshallPatient(xmlPatient);
        EntityExtractor entityExtractor = new EntityExtractor(patient);

        return entityExtractor.getParsedEntity();

    }

    private Patient unmarshallPatient(String xmlPatient) throws PatientXmlParserException {

        try {

            return unmarshallPatient_WithoutManagementException(xmlPatient);

        } catch (JAXBException e) {
            throw new PatientXmlParserException(e);
        }

    }

    private Patient unmarshallPatient_WithoutManagementException (String xmlPatient) throws JAXBException {

        JAXBContext jaxbContext = JAXBContext.newInstance(Patient.class);
        Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller();
        Object object = jaxbUnmarshaller.unmarshal(new StringReader(xmlPatient));

        return (object instanceof JAXBElement) ? (Patient) ((JAXBElement) object).getValue() : (Patient) object;

    }


}
