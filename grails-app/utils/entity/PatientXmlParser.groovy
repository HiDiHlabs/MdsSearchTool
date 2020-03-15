package entity

import de.dkfz.mdsearch.DataService;
import de.samply.share.model.ccp.Patient
import de.utils.decryption.IdDecryptor;

import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller

public class PatientXmlParser {


    private DataService dataService
    private IdDecryptor idDecryptor

    PatientXmlParser(DataService dataService) {
        this.dataService = dataService
    }

    public ParsedEntity read (String xmlPatient, String siteId, String teilerId) throws PatientXmlParserException {

        Patient patient = unmarshallPatient(xmlPatient)
        decryptPatient(patient)
        EntityExtractor entityExtractor = new EntityExtractor(dataService, patient, siteId, teilerId)

        return entityExtractor.getParsedEntity()

    }


    private Patient unmarshallPatient(String xmlPatient) throws PatientXmlParserException {

        try {

            return unmarshallPatient_WithoutManagementException(xmlPatient)

        } catch (JAXBException e) {
            throw new PatientXmlParserException(e)
        }

    }

    private Patient unmarshallPatient_WithoutManagementException (String xmlPatient) throws JAXBException {

        JAXBContext jaxbContext = JAXBContext.newInstance(Patient.class)
        Unmarshaller jaxbUnmarshaller = jaxbContext.createUnmarshaller()
        Object object = jaxbUnmarshaller.unmarshal(new StringReader(xmlPatient))

        return (object instanceof JAXBElement) ? (Patient) ((JAXBElement) object).getValue() : (Patient) object

    }

    private void decryptPatient (Patient patient){

        String patientId = patient.getId()
        patientId = getDecryptedPatientId(patientId)
        patient.setId(patientId)

    }

    private IdDecryptor getIdDecryptor(){

        if (idDecryptor == null) {
            idDecryptor = new IdDecryptor(System.getProperty("user.home") + "/key/private-key.der", 200)
        }

        return idDecryptor

    }

    private String getDecryptedPatientId(String encryptedId) throws EntityBuilderException{

        try {

            return getDecryptedPatientId_WithoutManagementException(encryptedId)

        } catch (IdDecryptor.CryptoException e) {
            log.error(e)
            throw new PatientXmlParserException("Encrypted Id is not valid!")
        }


    }

    private String getDecryptedPatientId_WithoutManagementException(String encryptedId){
        return getIdDecryptor().decrypt(encryptedId)
    }



}
