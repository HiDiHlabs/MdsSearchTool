
/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.xml;

import java.util.ArrayList;
import java.util.List;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlElements;
import javax.xml.bind.annotation.XmlSeeAlso;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java-Klasse für ConditionType complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType name="ConditionType">
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;choice maxOccurs="unbounded" minOccurs="0">
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}And"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Eq"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Like"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Geq"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Gt"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}IsNotNull"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}IsNull"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Leq"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Lt"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Neq"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Or"/>
 *       &lt;/choice>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "ConditionType", namespace = "http://schema.samply.de/ccp/Query", propOrder = {
    "andOrEqOrLike"
})
@XmlSeeAlso({
    Where.class,
    Or.class,
    And.class
})
public class ConditionType {

    @XmlElements({
        @XmlElement(name = "And", namespace = "http://schema.samply.de/ccp/Query", type = And.class),
        @XmlElement(name = "Eq", namespace = "http://schema.samply.de/ccp/Query", type = Eq.class),
        @XmlElement(name = "Like", namespace = "http://schema.samply.de/ccp/Query", type = Like.class),
        @XmlElement(name = "Geq", namespace = "http://schema.samply.de/ccp/Query", type = Geq.class),
        @XmlElement(name = "Gt", namespace = "http://schema.samply.de/ccp/Query", type = Gt.class),
        @XmlElement(name = "IsNotNull", namespace = "http://schema.samply.de/ccp/Query", type = IsNotNull.class),
        @XmlElement(name = "IsNull", namespace = "http://schema.samply.de/ccp/Query", type = IsNull.class),
        @XmlElement(name = "Leq", namespace = "http://schema.samply.de/ccp/Query", type = Leq.class),
        @XmlElement(name = "Lt", namespace = "http://schema.samply.de/ccp/Query", type = Lt.class),
        @XmlElement(name = "Neq", namespace = "http://schema.samply.de/ccp/Query", type = Neq.class),
        @XmlElement(name = "Or", namespace = "http://schema.samply.de/ccp/Query", type = Or.class)
    })
    protected List<Object> andOrEqOrLike;

    /**
     * Gets the value of the andOrEqOrLike property.
     * 
     * <p>
     * This accessor method returns a reference to the live list,
     * not a snapshot. Therefore any modification you make to the
     * returned list will be present inside the JAXB object.
     * This is why there is not a <CODE>set</CODE> method for the andOrEqOrLike property.
     * 
     * <p>
     * For example, to add a new item, do as follows:
     * <pre>
     *    getAndOrEqOrLike().add(newItem);
     * </pre>
     * 
     * 
     * <p>
     * Objects of the following type(s) are allowed in the list
     * {@link And }
     * {@link Eq }
     * {@link Like }
     * {@link Geq }
     * {@link Gt }
     * {@link IsNotNull }
     * {@link IsNull }
     * {@link Leq }
     * {@link Lt }
     * {@link Neq }
     * {@link Or }
     * 
     * 
     */
    public List<Object> getAndOrEqOrLike() {
        if (andOrEqOrLike == null) {
            andOrEqOrLike = new ArrayList<Object>();
        }
        return this.andOrEqOrLike;
    }

}
