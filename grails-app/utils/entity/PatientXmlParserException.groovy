package entity;

public class PatientXmlParserException extends Exception {

    public PatientXmlParserException(String message) {
        super(message);
    }

    public PatientXmlParserException(String message, Throwable cause) {
        super(message, cause);
    }

    public PatientXmlParserException(Throwable cause) {
        super(cause);
    }

    public PatientXmlParserException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
