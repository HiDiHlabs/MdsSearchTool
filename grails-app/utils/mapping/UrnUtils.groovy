package mapping

class UrnUtils {


    public static String getMajor (String urn){

        String[] split = urn.split(":")
        if (split.length > 4){

            StringBuilder stringBuilder = new StringBuilder()

            boolean isFirstElement = true
            for (int i=0; i< 4; i++){

                if (!isFirstElement){
                    stringBuilder.append(':')
                }else{
                    isFirstElement = false
                }

                stringBuilder.append(split[i])

            }

            urn = stringBuilder.toString()

        }

        return urn

    }

    /** convert URN string to string used as db key */
    public static urnToKey(String urn) {
        assert (!urn.contains("_"))
        return urn.replace(":", "_").replace(".", "__")
    }

    /** convert string used as db key to URN string */
    public static keyToUrn(String key) {
        assert (!key.contains(".") && !key.contains(":"))
        return key.replace("__", ".").replace("_", ":")
    }

}
