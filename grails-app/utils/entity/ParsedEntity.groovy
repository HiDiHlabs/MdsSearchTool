package entity;

import de.dkfz.ichip.entity.Entity;



import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class ParsedEntity {


    private List<Entity> entities = new ArrayList<>();
    private Map<String, String> errorsMap = new HashMap<>();

    public List<Entity> getEntities(){
        return entities;
    }

    public Map<String, String> getErrorsMap() {
        return errorsMap;
    }

    void addEntity(Entity entity) {
        this.entities.add(entity);
    }

}
