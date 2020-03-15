package entity

import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.DataService
import de.dkfz.mdsearch.metadata.Attribute;
import de.dkfz.ichip.entity.Entity;
import de.dkfz.mdsearch.metadata.EntityType;
import de.dkfz.ichip.value.Value
import de.utils.decryption.IdGenerator
import definitions.MDS
import mapping.UrnUtils
import de.samply.share.model.ccp.Patient

public class EntityBuilder {



    private DataService dataService
    private Entity entity
    private Map<String, String> errorsMap = new HashMap<>()

    private String siteid
    private String teilerId


    public Entity getEntity() {
        return entity;
    }

    public Map<String, String> getErrorsMap() {
        return errorsMap;
    }

    public EntityBuilder(DataService dataService, de.samply.share.model.ccp.Entity sourceEntity, Entity entityParent, String siteId, String teilerId) {

        this.dataService = dataService
        this.siteid = siteId
        this.teilerId = teilerId

        EntityType entityType = getEntityType(sourceEntity);
        Map<Attribute, Value> attributeValues = getAttributeValues(sourceEntity, entityType);

        this.entity = createEntity(entityType, attributeValues, entityParent);

    }

    private Entity createEntity(EntityType entityType, Map<Attribute, Value> attributeValues, Entity parentEntity) {
        return dataService.createEntity(entityType, attributeValues, parentEntity)
    }

    private Map<Attribute, Value> getAttributeValues (de.samply.share.model.ccp.Entity sourceEntity, EntityType entityType) {

        Map<Attribute, Value> attributeValueMap = new HashMap<>();

        for (de.samply.share.model.ccp.Attribute sourceAttribute : sourceEntity.getAttribute()){

            Attribute attribute = convertToAttribute(sourceAttribute);
            Value value = getValue(attribute, sourceAttribute);

            if (attribute != null && value != null){
                attributeValueMap.put(attribute, value);
            }

        }

        addEntityAttributes(sourceEntity, entityType, attributeValueMap)

        return attributeValueMap;

    }


    private void addEntityAttributes(de.samply.share.model.ccp.Entity sourceEntity, EntityType entityType, Map<Attribute, Value> attributeValueMap){


        String entityId = getEntityId(sourceEntity)

        def mds = getMDS(entityType)

        addAttributeKeyValue(mds.getID(), entityId, attributeValueMap)
        addAttributeKeyValue(mds.getSiteID(), siteid, attributeValueMap)
        addAttributeKeyValue(mds.getTeilerID(), teilerId, attributeValueMap)

        if (sourceEntity instanceof Patient) {
            addUpdateAt(attributeValueMap)
        }

    }

    private String getEntityId (de.samply.share.model.ccp.Entity sourceEntity) {

        String entityId = sourceEntity.getId()
        if (entityId == null){

            entityId = generateRandomId()
            sourceEntity.setId(entityId)
        }

        return entityId

    }

    private void addUpdateAt (Map<Attribute, Value> attributeValueMap){

        Attribute attributeUpdateAt = new Attribute();
        attributeUpdateAt.setType(ValueType.DATE)
        attributeUpdateAt.setKey("updated_at")
        Value updateAtValue = ValueType.createValueForType(attributeUpdateAt.type).set(new Date())

        attributeValueMap.put(attributeUpdateAt, updateAtValue)

    }

    private void addAttributeKeyValue (String attributeId, String value, Map<Attribute, Value> attributeValueMap){

        Attribute attribute = Attribute.findByKey(attributeId)
        Value attributeValue = getValue(attribute, value)

        attributeValueMap.put(attribute, attributeValue)

    }

    private String generateRandomId (){
        return IdGenerator.generateRandomId()
    }


    private MDS getMDS (EntityType entityType){
        return entityType.key.toUpperCase() as MDS
    }


    private EntityType getEntityType (de.samply.share.model.ccp.Entity sourceEntity){

        String designation = EntityDesignation.getDesignation(sourceEntity);
        return getEntityType(designation);

    }

    private EntityType getEntityType (String designation){
        return (designation != null) ?  EntityType.findByName(designation) : null
    }

    private Attribute convertToAttribute (de.samply.share.model.ccp.Attribute attribute){

        String key = getKey(attribute)
        return de.dkfz.mdsearch.metadata.Attribute.findByKey(key)

    }

    private String getKey (de.samply.share.model.ccp.Attribute attribute){

        String key = attribute.getMdrKey();
        key = UrnUtils.getMajor(key)

        return UrnUtils.urnToKey(key)

    }



    private Value getValue (Attribute targetAttribute, de.samply.share.model.ccp.Attribute sourceAttribute){
        return ValueParser.getValue(targetAttribute, sourceAttribute, errorsMap)
    }

    private Value getValue (Attribute targetAttribute, String value){
        return ValueParser.getValue(value, targetAttribute, errorsMap)
    }






}
