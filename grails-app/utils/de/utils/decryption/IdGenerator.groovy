package de.utils.decryption

class IdGenerator {

    private static int leftLimit = 48; // numeral '0'
    private static int rightLimit = 122; // letter 'z'
    private static int targetStringLength = 10;
    private static Random random = new Random();

    public static String generateRandomId (){

        return random.ints(leftLimit, rightLimit + 1)
                .filter({ i -> (i <= 57 || i >= 65) && (i <= 90 || i >= 97) })
                .limit(targetStringLength)
                .collect(StringBuilder.&new, StringBuilder.&appendCodePoint, StringBuilder.&append)
                .toString();

    }


}
