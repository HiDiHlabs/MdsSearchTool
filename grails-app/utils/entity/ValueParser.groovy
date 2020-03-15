package entity

import de.dkfz.ichip.value.Value
import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.upload.MdsCheckService
import de.dkfz.mdsearch.metadata.Attribute
import org.apache.commons.logging.Log
import org.apache.commons.logging.LogFactory

import java.text.ParseException
import java.text.SimpleDateFormat

class ValueParser {

    private static final Log log = LogFactory.getLog(this)


    public static Value getValue (Attribute targetAttribute, de.samply.share.model.ccp.Attribute sourceAttribute, Map<String, String> errorsMap){

        String value = sourceAttribute.getValue().getValue()
        return getValue(value, targetAttribute, errorsMap)

    }

    public static Value getValue(String value, Attribute attribute, Map<String, String> errorsMap){

        if (attribute != null && value != null) {

            boolean isValid = true
            String attributeKey = attribute.key


            if (attribute.type == ValueType.LIST) {
                def items = attribute.listOfValues?.getLoVItems()
                if (items != null) {
                    if (!attribute.unit.equals(MdsCheckService.DataType.BOOLEAN.name())) {
                        if (!items.containsKey(value)) {
                            errorsMap.put(attributeKey, value)
                            log.error("${attribute.key} has no value ${value}")
                            return null
                        }
                    }
                }
            }


            if (attribute.format != null && !attribute.format.equals("") && !attribute.format.equals("enumerated")) {


                if (value.matches(attribute.format)  || attribute.type.name().equals(MdsCheckService.DataType.DATE.name())) {
                    if (attribute.unit.equals(MdsCheckService.DataType.BOOLEAN.name()) && (value.equals("false") || value.equals("true"))) {
                        if (value.equals("false")) {
                            value = "f"
                        } else {
                            value = "t"
                        }
                    }

                    if (attribute.type.equals(ValueType.DATE)) {
                        if (!validateDate(value, attribute.format)) {
                            isValid = false
                            errorsMap.put(attributeKey, value)
                            log.error(" Value: ${value} doesn't match given regular expression ${attribute.format} for dataelement ${attributeKey}")
                        }
                    }

                } else {
                    errorsMap.put(attributeKey, value)
                    log.error(" Value: ${value} doesn't match given regular expression for dataelement ${attributeKey}")
                    return null
                }


            }

            if (isValid) {
                return createValue(attribute, value)
            }

        }

        return null

    }

    private static Value createValue(de.dkfz.mdsearch.metadata.Attribute attribute, String value) {

        Value val = ValueType.createValueForType(attribute.type)

        if (attribute.type.equals(ValueType.DATE)) {
            SimpleDateFormat dateFormat = new SimpleDateFormat(attribute.format)
            Date date = dateFormat.parse(value.toString())
            val.set(date)
        } else {
            val.set(value)
        }

        return val
    }

    private static boolean validateDate(String date, String pattern) throws ParseException {

        String regex = pattern.replaceAll("\\w", "\\\\d").replace(".", "\\.");
        if (!date.matches(regex)) {
            return false;
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        sdf.setLenient(false);
        try {
            sdf.parse(date);
        } catch (ParseException e) {
            return false;
        }
        return true;

    }


}
