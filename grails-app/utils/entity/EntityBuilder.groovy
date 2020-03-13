package entity

import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.upload.MDS;
import de.dkfz.mdsearch.xml.Attribute;
import de.dkfz.ichip.entity.Entity;
import de.dkfz.mdsearch.metadata.EntityType;
import de.dkfz.ichip.value.Value;
import de.samply.share.model.ccp.Patient
import definitions.MDS

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

public class EntityBuilder {



    def dataService
    private Entity entity;
    private Map<String, String> errorsMap = new HashMap<>();
    String siteid
    String teilerId


    public Entity getEntity() {
        return entity;
    }

    public Map<String, String> getErrorsMap() {
        return errorsMap;
    }

    public EntityBuilder(de.samply.share.model.ccp.Entity sourceEntity, Entity entityParent, String siteId, String teilerId) {

        this.siteid = siteId
        this.teilerId = teilerId

        EntityType entityType = getEntityType(sourceEntity);
        Map<Attribute, Value> attributeValues = getAttributeValues(sourceEntity, entityType);

        this.entity = createEntity(entityType, attributeValues, entityParent);

    }

    private Entity createEntity(EntityType type, Map<Attribute, Value> values, Entity entityParent) {
        return dataService.createEntity(entType, entityAttributemap, pat)
    }

    private Map<Attribute, Value> getAttributeValues (de.samply.share.model.ccp.Entity sourceEntity, EntityType entityType){

        Map<Attribute, Value> attributeValueMap = new HashMap<>();

        for (de.samply.share.model.ccp.Attribute sourceAttribute : sourceEntity.getAttribute()){

            Attribute attribute = convertToAttribute(sourceAttribute);
            Value value = getValue(attribute, sourceAttribute);

            if (attribute != null && value != null){
                attributeValueMap.put(attribute, value);
            }

        }

        addPatientAttributes(sourceEntity, entityType, attributeValueMap)

        return attributeValueMap;

    }

    private void addPatientAttributes (de.samply.share.model.ccp.Entity sourceEntity, EntityType entityType, Map<Attribute, Value> attributeValueMap){

        if (sourceEntity instanceof Patient){

            def mds = getMDS(entityType)

            Attribute siteId = de.dkfz.mdsearch.metadata.Attribute.findByKey(mds.getSiteID())
            Attribute teilerId = de.dkfz.mdsearch.metadata.Attribute.findByKey(mds.getTeilerID())

            log.info("set ids")

            attributeValueMap.put(siteId, createValue(siteId, site))
            attributeValueMap.put(teilerId, createValue(teilerId, teiler))


        }

    }

    private MDS getMDS (EntityType entityType){
        return entityType.key.toUpperCase() as MDS
    }


    private EntityType getEntityType (de.samply.share.model.ccp.Entity sourceEntity){

        String designation = EntityDesignation.getDesignation(sourceEntity);
        return getEntityType(designation);

    }

    private EntityType getEntityType (String designation){
        return (designation != null) ?  EntityType.findByKey(designation) : null
    }

    private Attribute convertToAttribute (de.samply.share.model.ccp.Attribute attribute){

        String key = attribute.getMdrKey();
        return de.dkfz.mdsearch.metadata.Attribute.findByKey(key)

    }

    private Value getValue (Attribute targetAttribute, de.samply.share.model.ccp.Attribute sourceAttribute){
        return ValueParser.getValue()
    }


}
