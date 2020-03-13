package entity;

import de.samply.share.model.ccp.Entity;
import de.samply.share.model.ccp.Patient;


import java.util.ArrayList;
import java.util.List;


public abstract class EntityParser {

    protected abstract void parse(Entity entity, Entity entityParent);

    protected void parse(Entity entity){
        parseEntityAndChildren(entity, null);
    }

    private void parseEntityAndChildren(Entity entity, Entity entityParent){

        parse(entity, entityParent);
        for (Entity entityChild : getChildren(entity)){
            parseEntityAndChildren(entityChild, entity);
        }

    }

    private List<Entity> getChildren(Entity entity){

        List<Entity> entityList = new ArrayList<>();

        if (entity instanceof Patient){

            Patient patient = (Patient) entity;

            entityList.addAll(patient.getCase());
            entityList.addAll(patient.getSample());

        }

        entityList.addAll(entity.getContainer());

        return entityList;
    }

}
