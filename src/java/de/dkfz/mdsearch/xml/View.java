
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
 *       &lt;sequence>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}Query"/>
 *         &lt;element ref="{http://schema.samply.de/ccp/Query}ViewFields" minOccurs="0"/>
 *       &lt;/sequence>
 *     &lt;/restriction>
 *   &lt;/complexContent>
 * &lt;/complexType>
 * </pre>
 * 
 * 
 */
@XmlAccessorType(XmlAccessType.FIELD)
@XmlType(name = "", propOrder = {
    "query",
    "viewFields"
})
@XmlRootElement(name = "View", namespace = "http://schema.samply.de/ccp/Query")
public class View {

    @XmlElement(name = "Query", namespace = "http://schema.samply.de/ccp/Query", required = true)
    protected Query query;
    @XmlElement(name = "ViewFields", namespace = "http://schema.samply.de/ccp/Query")
    protected ViewFields viewFields;

    /**
     * Ruft den Wert der query-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link Query }
     *     
     */
    public Query getQuery() {
        return query;
    }

    /**
     * Legt den Wert der query-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link Query }
     *     
     */
    public void setQuery(Query value) {
        this.query = value;
    }

    /**
     * Ruft den Wert der viewFields-Eigenschaft ab.
     * 
     * @return
     *     possible object is
     *     {@link ViewFields }
     *     
     */
    public ViewFields getViewFields() {
        return viewFields;
    }

    /**
     * Legt den Wert der viewFields-Eigenschaft fest.
     * 
     * @param value
     *     allowed object is
     *     {@link ViewFields }
     *     
     */
    public void setViewFields(ViewFields value) {
        this.viewFields = value;
    }

}
