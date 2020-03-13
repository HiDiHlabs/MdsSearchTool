package entity;

import de.samply.share.model.ccp.*;
import de.samply.share.model.ccp.Entity;


import javax.xml.bind.annotation.XmlRootElement;

public class EntityDesignation {

    private final static String PATIENT = "Patient";

    public static String getDesignation (Entity entity){

        String result = null;

        if (entity instanceof Patient || entity instanceof Case || entity instanceof Sample){

            result = getDesignationFromXmlAnnotation(entity);

        } else if (entity instanceof Container){

            result = ((Container) entity).getDesignation();

        }

        return result;
    }

    private static String getDesignationFromXmlAnnotation (Entity entity){

        try {
            XmlRootElement xmlRootElement = entity.getClass().getAnnotation(XmlRootElement.class);
            return xmlRootElement.name();

        } catch (Exception e){
            return null;
        }
    }
}
