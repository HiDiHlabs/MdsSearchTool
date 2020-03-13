/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package mapping

import java.io.BufferedReader;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class UrnEntityMapping {

    private String csvSeparator = "\t";

    private Map<String, String> urnEntity = new HashMap<>();

    public UrnEntityMapping() throws UrnEntityMappingException {
        inititalizeMapping();
    }

    private void inititalizeMapping () throws UrnEntityMappingException {

        try {
            inititalizeMapping_WithoutManagementException();
        } catch (IOException e) {
            throw new UrnEntityMappingException(e);
        }

    }


    private void inititalizeMapping_WithoutManagementException () throws IOException {

        String urnEntityFile = System.getenv("URN_ENTITY_MAPPING");
        //String urnEntityFile = "C:\\projects\\MdsSearchTool\\docker\\web\\urnEntity.csv";
        if (urnEntityFile != null) {
            parseFile(urnEntityFile);
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

        String[] split = line.split(csvSeparator);
        if (split.length >= 2){

            String urn = split[0];
            String entity = split[1];

            urnEntity.put(urn, entity);

        }

    }

    public Map<String, String> getUrnEntity() {
        return urnEntity;
    }

}
