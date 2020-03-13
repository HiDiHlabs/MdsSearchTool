package entity

import de.dkfz.ichip.value.Value
import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.upload.MdsCheckService
import de.dkfz.mdsearch.xml.Attribute

import java.text.SimpleDateFormat

class ValueParser {

    public static Value getValue (Attribute targetAttribute, de.samply.share.model.ccp.Attribute sourceAttribute, Map<String, String> errorsMap){

        String value = targetAttribute.getValue().getValue();
        return parseValue(targetAttribute, value);

    }

    private static String parseValue (Attribute attribute, String val){

        if (attribute != null) {
            if (attribute.type == ValueType.LIST) {
                def items = attribute.listOfValues?.getLoVItems()
                if (items != null) {
                    if (!attribute.unit.equals(MdsCheckService.DataType.BOOLEAN.name())) {
                        if (!items.containsKey(val)) {
                            errorsMap.put(mdrkey, val)
                            log.error("${attribute.key} has no value ${val}")
                            return null
                        }
                    }
                }
            }
            if (!attribute.format.equals("") && !attribute.format.equals("enumerated")) {
                if (val.matches(attribute.format) || attribute.type.name().equals(MdsCheckService.DataType.DATE.name())) {
                    if (attribute.unit.equals(MdsCheckService.DataType.BOOLEAN.name()) && (val.equals("false") || val.equals("true"))) {
                        if (val.equals("false")) {
                            val = "f"
                        } else {
                            val = "t"
                        }
                    }

                    if (attribute.type.equals(ValueType.DATE)) {
                        if (!validateDate(val, attribute.format)) {
                            isValid = false
                            errorsMap.put(mdrkey, val)
                            log.error(" Value: ${val} doesn't match given regular expression ${attribute.format} for dataelement ${mdrkey}")
                        }
                    }

                } else {
                    errorsMap.put(mdrkey, val)
                    log.error(" Value: ${val} doesn't match given regular expression for dataelement ${mdrkey}")
                    return null
                }
            }

            if (isValid) {
                Value value = this.createValue(attribute, val)
                return value
            }

        }

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

}
