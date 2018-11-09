
/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch.xml;

import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlAttribute;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlType;


/**
 * <p>Java-Klasse für anonymous complex type.
 * 
 * <p>Das folgende Schemafragment gibt den erwarteten Content an, der in dieser Klasse enthalten ist.
 * 
 * <pre>
 * &lt;complexType>
 *   &lt;complexContent>
 *     &lt;restriction base="{http://www.w3.org/2001/XMLSchema}anyType">
 *       &lt;all>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Where"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}OrderBy" minOccurs="0"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}GroupBy" minOccurs="0"/>
 *       &lt;/all>
 *       &lt;attribute name="id" type="{http://www.w3.org/2001/XMLSchema}string" />
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {

})
@XmlRootElement(name = "Query", namespace = "http://schema.samply.de/ccp/Query")
public class Query {

    @XmlElement(name = "Where", namespace = "http://schema.samply.de/ccp/Query", required = true)
    protected Where where;
    @XmlElement(name = "OrderBy", namespace = "http://schema.samply.de/ccp/Query")
    protected OrderBy orderBy;
    @XmlElement(name = "GroupBy", namespace = "http://schema.samply.de/ccp/Query")
    protected GroupBy groupBy;
    @XmlAttribute(name = "id")
    protected String id;

    /**
     * Ruft den Wert der where-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link Where }
     *     
     */
    public Where getWhere() {
        return where;
    }

    /**
     * Legt den Wert der where-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link Where }
     *     
     */
    public void setWhere(Where value) {
        this.where = value;
    }

    /**
     * Ruft den Wert der orderBy-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link OrderBy }
     *     
     */
    public OrderBy getOrderBy() {
        return orderBy;
    }

    /**
     * Legt den Wert der orderBy-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link OrderBy }
     *     
     */
    public void setOrderBy(OrderBy value) {
        this.orderBy = value;
    }

    /**
     * Ruft den Wert der groupBy-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link GroupBy }
     *     
     */
    public GroupBy getGroupBy() {
        return groupBy;
    }

    /**
     * Legt den Wert der groupBy-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link GroupBy }
     *     
     */
    public void setGroupBy(GroupBy value) {
        this.groupBy = value;
    }

    /**
     * Ruft den Wert der id-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link String }
     *     
     */
    public String getId() {
        return id;
    }

    /**
     * Legt den Wert der id-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link String }
     *     
     */
    public void setId(String value) {
        this.id = value;
    }

}
