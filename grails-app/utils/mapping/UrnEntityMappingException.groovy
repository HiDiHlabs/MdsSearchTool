package mapping

class UrnEntityMappingException extends Exception{

    public UrnEntityMappingException(String message) {
        super(message);
    }

    public UrnEntityMappingException(String message, Throwable cause) {
        super(message, cause);
    }

    public UrnEntityMappingException(Throwable cause) {
        super(cause);
    }

    public UrnEntityMappingException(String message, Throwable cause, boolean enableSuppression, boolean writableStackTrace) {
        super(message, cause, enableSuppression, writableStackTrace);
    }

}
