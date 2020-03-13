package entity


import de.samply.share.model.ccp.Entity;


import java.util.Map;

public class EntityExtractor extends EntityParser {

    private ParsedEntity parsedEntity = new ParsedEntity();
    private Map<de.samply.share.model.ccp.Entity, de.dkfz.ichip.entity.Entity> entitySourceTargetMap = new HashMap<>();

    public EntityExtractor(Entity entity) {
        parse(entity);
    }

    @Override
    protected void parse(Entity entity, Entity entityParent) {

        de.dkfz.ichip.entity.Entity targetEntityParent = entitySourceTargetMap.get(entityParent);
        createEntity(entity, targetEntityParent);

    }

    private void createEntity (Entity sourceEntity, de.dkfz.ichip.entity.Entity entityParent){

        EntityBuilder entityBuilder = new EntityBuilder(sourceEntity, entityParent);

        de.dkfz.ichip.entity.Entity targetEntity = entityBuilder.getEntity();

        if (targetEntity != null){

            entitySourceTargetMap.put(sourceEntity, targetEntity);
            parsedEntity.addEntity(targetEntity);

        }

        Map<String, String> errorsMap = entityBuilder.getErrorsMap();
        getErrorsMap().putAll(errorsMap);

    }

    private Map<String, String> getErrorsMap() {
        return parsedEntity.getErrorsMap();
    }

    public ParsedEntity getParsedEntity() {
        return parsedEntity;
    }

}
