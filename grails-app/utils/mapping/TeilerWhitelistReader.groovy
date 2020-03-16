package mapping

import java.nio.file.Files
import java.nio.file.Paths

class TeilerWhitelistReader {

    private final static String comment = "--"
    private final static String TEILER_WHITELIST = "TEILER_WHITELIST"

    private Set<String> teilerWhiteList = new java.util.HashSet()

    public TeilerWhitelistReader() throws TeilerWhitelistReaderException {
        inititalizeWhiteList();
    }

    private void inititalizeWhiteList() throws TeilerWhitelistReaderException {

        try {
            inititalizeMapping_WithoutManagementException();
        } catch (IOException e) {
            throw new TeilerWhitelistReaderException(e);
        }

    }


    private void inititalizeMapping_WithoutManagementException () throws IOException {

        String siteWhitelistFile = System.getenv(TEILER_WHITELIST);

        if (siteWhitelistFile != null) {
            parseFile(siteWhitelistFile);
        }

    }

    private void parseFile(String urnEntityFile) throws IOException {

        BufferedReader bufferedReader = null;

        try {

            bufferedReader = Files.newBufferedReader(Paths.get(urnEntityFile));
            parse (bufferedReader);

        } finally{
            bufferedReader.close();
        }

    }

    private void parse (BufferedReader bufferedReader) throws IOException {

        String line;
        while ((line = bufferedReader.readLine()) != null) {
            parse(line);
        }

    }

    private void parse (String line){


        if (!isComment(line) && line.length() > 0) {
            teilerWhiteList.add(line.toLowerCase())
        }

    }

    private boolean isComment (String line){
        return (line != null && line.length()> comment.length() && line.substring(0, comment.length()).equals(comment))
    }

    Set<String> getTeilerWhiteList() {
        return teilerWhiteList
    }

}
