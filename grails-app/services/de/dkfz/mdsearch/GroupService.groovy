/*
 * Copyright (c) 2018. dkfz
 *
 * Distributed under the MIT License (license terms are at https://github.com/eilslabs/MdsSearchTool/blob/master/LICENSE).
 *
 *
 */

package de.dkfz.mdsearch

import de.dkfz.ichip.value.ValueType
import de.dkfz.mdsearch.metadata.Attribute
import de.dkfz.mdsearch.metadata.EntityType
import de.dkfz.mdsearch.metadata.Group
import de.dkfz.mdsearch.upload.MdsCheckService
import mapping.UrnUtils
import org.springframework.context.MessageSource

class GroupService {

    MessageSource messageSource

    /*
     * Describes an attribute model
     * key          = database name
     * name         = displayed name
     * description  = for tool tips, e.g. details
     * type         = custom data type (STRING, LONG, DOUBLE, DATE, LIST)
     * lov          = if type is LIST, this entry contains the values
     * format       = for tool tips, e.g. date dd/mm/yy
     */
    class AttributeModel {
        String key
        String name
        String description
        String type
        LinkedHashMap<String, String> lov
        String format
        String jsFormat
        String entity
        List<AttributeModel> subGroups
        List<AttributeModel> codes
        boolean isInSubGroup = false
    }

    /*
     * Returns the property by group information needed for the dynamically created interface
     * the structure of the returned data looks like this: [group:[property1, property2]]
     * where each property is an object of the AttributeModel class
     */
    LinkedHashMap getGroupStructure() {
        LinkedHashMap queryMap = [:]
        List<EntityType> entities = EntityType.listOrderByOrder()

        //TODO Remove following code after Entities catalog is added to MDR

        AttributeModel gliome = new AttributeModel(key: "urn_dktk_code_Gliome", name: "Gliome, alle Gruppen", description: "Gliome, alle Gruppen", type: ValueType.LIST)
        gliome.codes = []
        AttributeModel neoplasien = new AttributeModel(key: "urn_dktk_code_Neoplasien", name: "Neoplasien des Plexus chorioideus & neuroepitheliomatöse Neoplasien sowie Tumore der kranialen und spinalen Nerven, alle Gruppen", description: "Neoplasien des Plexus chorioideus & neuroepitheliomatöse Neoplasien sowie Tumore der kranialen und spinalen Nerven, alle Gruppen", type: ValueType.LIST)
        neoplasien.codes = []
        AttributeModel neuroonk = new AttributeModel(key: "urn_dktk_code_Neuroonk", name: "Weitere neuroonkologische Tumorgruppen", description: "Weitere neuroonkologische Tumorgruppen", type: ValueType.LIST)
        neuroonk.codes = []
        AttributeModel gliosarkom = new AttributeModel(key: "urn_dktk_code_Gliosarkom", name: "Gliosarkom", description: "Gliosarkom", type: ValueType.LIST)
        gliosarkom.codes = []
        AttributeModel zNSLymphom = new AttributeModel(key: "urn_dktk_code_ZNS-Lymphom", name: "ZNS-Lymphom", description: "ZNS-Lymphom", type: ValueType.LIST)
        zNSLymphom.codes = []
        AttributeModel kopf = new AttributeModel(key: "urn_dktk_code_Kopf-Hals", name: "Kopf-Hals-Ca, alle Gruppen", description: "Kopf-Hals-Ca, alle Gruppen", type: ValueType.LIST)
        kopf.codes = []
        AttributeModel cup = new AttributeModel(key: "urn_dktk_code_cup", name: "Cancer of unknown primary (CUP)", description: "Cancer of unknown primary (CUP)", type: ValueType.LIST)
        cup.codes = []
        AttributeModel nSCLC = new AttributeModel(key: "urn_dktk_code_NSCLC", name: "NSCLC, alle Gruppen", description: "NSCLC, alle Gruppen", type: ValueType.LIST)
        nSCLC.codes = []
        AttributeModel sCLC = new AttributeModel(key: "urn_dktk_code_ONeuroendokrines", name: "SCLC (ohne neuroendokrines Ca)", description: "SCLC (ohne neuroendokrines Ca)", type: ValueType.LIST)
        sCLC.codes = []
        AttributeModel neuroendocrinesca = new AttributeModel(key: "urn_dktk_code_Neuroendocrines", name: "Neuroendocrines Ca (ohne SCLC)", description: "Neuroendocrines Ca (ohne SCLC)", type: ValueType.LIST)
        neuroendocrinesca.codes = []
        AttributeModel lungensarkom = new AttributeModel(key: "urn_dktk_code_Lungensarkom", name: "Lungensarkom", description: "Lungensarkom", type: ValueType.LIST)
        lungensarkom.codes = []
        AttributeModel thymom = new AttributeModel(key: "urn_dktk_code_Thymom", name: "Thymom", description: "Thymom", type: ValueType.LIST)
        thymom.codes = []
        AttributeModel malignes = new AttributeModel(key: "urn_dktk_code_malignes", name: "Malignes Mesotheliom", description: "Malignes Mesotheliom", type: ValueType.LIST)
        malignes.codes = []
        AttributeModel oesophagus = new AttributeModel(key: "urn_dktk_code_oesophagus", name: "Ösophagus/Magenübergang-Ca, alle Gruppen", description: "Ösophagus/Magenübergang-Ca, alle Gruppen", type: ValueType.LIST)
        oesophagus.codes = []
        AttributeModel magen = new AttributeModel(key: "urn_dktk_code_Magen", name: "Magen Tumore, alle Gruppen", description: "Magen Tumore, alle Gruppen", type: ValueType.LIST)
        magen.codes = []
        AttributeModel gastrointestinale = new AttributeModel(key: "urn_dktk_code_Gastrointestinale", name: "Gastrointestinale Tumore, alle Gruppen", description: "Gastrointestinale Tumore, alle Gruppen", type: ValueType.LIST)
        gastrointestinale.codes = []
        AttributeModel leberca = new AttributeModel(key: "urn_dktk_code_leberca", name: "Leber-Ca, alle Gruppen", description: "Leber-Ca, alle Gruppen", type: ValueType.LIST)
        leberca.codes = []
        AttributeModel pankreasca = new AttributeModel(key: "urn_dktk_code_pankreasca", name: "Pankreas-Ca, alle Gruppen", description: "Pankreas-Ca, alle Gruppen", type: ValueType.LIST)
        pankreasca.codes = []
        AttributeModel neuroendokrine = new AttributeModel(key: "urn_dktk_code_Neuroendokrine", name: "Neuroendokrine Tumore, Grad I bis IV", description: "Neuroendokrine Tumore, Grad I bis IV", type: ValueType.LIST)
        neuroendokrine.codes = []
        AttributeModel neuroendokrinet = new AttributeModel(key: "urn_dktk_code_NeuroendokrineT", name: "Weitere Neuroendokrine Tumorgruppen", description: "Weitere Neuroendokrine Tumorgruppen", type: ValueType.LIST)
        neuroendokrinet.codes = []
        AttributeModel gIST = new AttributeModel(key: "urn_dktk_code_GIST", name: "Gastrointestinales Stromasarkom (GIST)", description: "Gastrointestinales Stromasarkom (GIST)", type: ValueType.LIST)
        gIST.codes = []
        AttributeModel maltLymphom = new AttributeModel(key: "urn_dktk_code_maltL", name: "MALT-Lymphom", description: "MALT-Lymphom", type: ValueType.LIST)
        maltLymphom.codes = []
        //gynaekologisch
        AttributeModel mamaca = new AttributeModel(key: "urn_dktk_code_mamaca", name: "Mamma-Ca", description: "Mamma-Ca", type: ValueType.LIST)
        mamaca.codes = []
        AttributeModel gynaekologische = new AttributeModel(key: "urn_dktk_code_Gynaekologische", name: "Gynäkologische Tumore (außer Ovarial)", description: "Gynäkologische Tumore (außer Ovarial)", type: ValueType.LIST)
        gynaekologische.codes = []
        AttributeModel ovarialca = new AttributeModel(key: "urn_dktk_code_Ovarial-Ca", name: "Ovarial-Ca", description: "Ovarial-Ca", type: ValueType.LIST)
        ovarialca.codes = []
        //urologisch
        AttributeModel penisca = new AttributeModel(key: "urn_dktk_code_Penis-Ca", name: "Penis-Ca, alle Gruppen", description: "Penis-Ca, alle Gruppen", type: ValueType.LIST)
        penisca.codes = []
        AttributeModel prostate = new AttributeModel(key: "urn_dktk_code_Prostata-Ca", name: "Prostata-Ca, alle Gruppen", description: "Prostata-Ca, alle Gruppen", type: ValueType.LIST)
        prostate.codes = []
        AttributeModel net = new AttributeModel(key: "urn_dktk_code_NET", name: "NET (Prostata)", description: "NET (Prostata)", type: ValueType.LIST)
        net.codes = []
        AttributeModel hoden = new AttributeModel(key: "urn_dktk_code_hoden", name: "Hoden-Ca, alle Gruppen", description: "Hoden-Ca, alle Gruppen", type: ValueType.LIST)
        hoden.codes = []
        AttributeModel nierenzell = new AttributeModel(key: "urn_dktk_code_Nierenzell-Ca", name: "Nierenzell-Ca, alle Gruppen", description: "Nierenzell-Ca, alle Gruppen", type: ValueType.LIST)
        nierenzell.codes = []
        AttributeModel urothel = new AttributeModel(key: "urn_dktk_code_Urothel-Ca", name: "Urothel-Ca", description: "Urothel-Ca", type: ValueType.LIST)
        urothel.codes = []
        AttributeModel harnblasen = new AttributeModel(key: "urn_dktk_code_Harnblasen", name: "Harnblasen Tumore, alle Gruppen", description: "Harnblasen Tumore, alle Gruppen", type: ValueType.LIST)
        harnblasen.codes = []
        //Dermatologische
        AttributeModel malmelanom = new AttributeModel(key: "urn_dktk_code_malmelanom", name: "Malignes Melanom", description: "Malignes Melanom", type: ValueType.LIST)
        malmelanom.codes = []
        AttributeModel mukmelanom = new AttributeModel(key: "urn_dktk_code_mukmelanom", name: "Mukosales Melanom", description: "Mukosales Melanom", type: ValueType.LIST)
        mukmelanom.codes = []
        AttributeModel basalzell = new AttributeModel(key: "urn_dktk_code_basalzell", name: "Basalzell-Ca", description: "Basalzell-Ca", type: ValueType.LIST)
        basalzell.codes = []
        AttributeModel plattenepithel = new AttributeModel(key: "urn_dktk_code_mukmelanom", name: "Plattenepithel-Ca", description: "Plattenepithel-Ca", type: ValueType.LIST)
        plattenepithel.codes = []
        AttributeModel sonstigerHauttumor = new AttributeModel(key: "urn_dktk_code_sonstigerHauttumor", name: "Sonstiger Hauttumor", description: "Sonstiger Hauttumor", type: ValueType.LIST)
        sonstigerHauttumor.codes = []
        AttributeModel sarkom = new AttributeModel(key: "urn_dktk_code_Sarkom", name: "Sarkom", description: "Sarkom", type: ValueType.LIST)
        sarkom.codes = []
        AttributeModel lymphom = new AttributeModel(key: "urn_dktk_code_Lymphom", name: "Lymphom", description: "Lymphom", type: ValueType.LIST)
        lymphom.codes = []
        //Haematologische
        AttributeModel lymphatischeLeukaemie = new AttributeModel(key: "urn_dktk_code_lymphatischeLeukaemie", name: "Lymphatische Leukämie", description: "Lymphatische Leukämie", type: ValueType.LIST)
        lymphatischeLeukaemie.codes = []
        AttributeModel akuteLeukaemie = new AttributeModel(key: "urn_dktk_code_akuteLeukaemie", name: "Akute Leukämie - gemischter Phänotyp", description: "Akute Leukämie - gemischter Phänotyp", type: ValueType.LIST)
        akuteLeukaemie.codes = []
        AttributeModel myeloischeLeukaemie = new AttributeModel(key: "urn_dktk_code_myeloischeLeukaemie", name: "Myeloische Leukämie, alle Gruppen", description: "Myeloische Leukämie, alle Gruppen", type: ValueType.LIST)
        myeloischeLeukaemie.codes = []
        AttributeModel myeloproliferative = new AttributeModel(key: "urn_dktk_code_Myeloproliferative", name: "Chronische myeloproliferative Erkrankung, alle Gruppen", description: "Chronische myeloproliferative Erkrankung, alle Gruppen", type: ValueType.LIST)
        myeloproliferative.codes = []
        AttributeModel myelodysplastischesSyndrom = new AttributeModel(key: "urn_dktk_code_myelodysplastischesSyndrom", name: "Myelodysplastisches Syndrom", description: "Myelodysplastisches Syndrom", type: ValueType.LIST)
        myelodysplastischesSyndrom.codes = []
        AttributeModel multiplesMyelom = new AttributeModel(key: "urn_dktk_code_multiplesMyelom", name: "Multiples Myelom", description: "Multiples Myelom", type: ValueType.LIST)
        multiplesMyelom.codes = []
        AttributeModel nKZellLeukaemie = new AttributeModel(key: "urn_dktk_code_nKZellLeukaemie", name: "NK-Zell-Leukämie, aggressiv", description: "NK-Zell-Leukämie, aggressiv", type: ValueType.LIST)
        nKZellLeukaemie.codes = []
        AttributeModel hodgkinLymphom = new AttributeModel(key: "urn_dktk_code_hodgkinLymphom", name: "Hodgkin-Lymphom", description: "Hodgkin-Lymphom", type: ValueType.LIST)
        hodgkinLymphom.codes = []
        AttributeModel burkitt = new AttributeModel(key: "urn_dktk_code_Burkitt-Lymphom", name: "Burkitt-Lymphom, alle Gruppen", description: "Burkitt-Lymphom, alle Gruppen", type: ValueType.LIST)
        burkitt.codes = []
        AttributeModel hodgkin = new AttributeModel(key: "urn_dktk_code_Non-Hodgkin-Lymphome", name: "Non-Hodgkin-Lymphome, alle Gruppen", description: "Non-Hodgkin-Lymphome, alle Gruppen", type: ValueType.LIST)
        hodgkin.codes = []
        AttributeModel weiterehaematologischeGruppen = new AttributeModel(key: "urn_dktk_code_weiterehaematologischeGruppen", name: "Weitere hämatologische Gruppen ", description: "Weitere hämatologische Gruppen ", type: ValueType.LIST)
        weiterehaematologischeGruppen.codes = []
        //Sarkome
        AttributeModel ewingSarkom = new AttributeModel(key: "urn_dktk_code_ewingSarkom", name: "Ewing-Sarkom", description: "Ewing-Sarkom", type: ValueType.LIST)
        ewingSarkom.codes = []
        AttributeModel osteosarkom = new AttributeModel(key: "urn_dktk_code_osteosarkom", name: "Osteosarkom/Chondrosarkom", description: "Osteosarkom/Chondrosarkom", type: ValueType.LIST)
        osteosarkom.codes = []
        AttributeModel kaposiSarkom = new AttributeModel(key: "urn_dktk_code_kaposiSarkom", name: "Kaposi-Sarkom", description: "Kaposi-Sarkom", type: ValueType.LIST)
        kaposiSarkom.codes = []
        AttributeModel weichteilsarkome = new AttributeModel(key: "urn_dktk_code_Weichteilsarkome", name: "Weichteilsarkome", description: "Weichteilsarkome", type: ValueType.LIST)
        weichteilsarkome.codes = []
        AttributeModel stromasarkom = new AttributeModel(key: "urn_dktk_code_Stromasarkom", name: "Gastrointestinales Stromasarkom", description: "Gastrointestinales Stromasarkom", type: ValueType.LIST)
        stromasarkom.codes = []
        AttributeModel gliosarkom2 = new AttributeModel(key: "urn_dktk_code_Gliosarkom2", name: "Gliosarkom", description: "Gliosarkom", type: ValueType.LIST)
        gliosarkom2.codes = []
        AttributeModel undifferenzierterTumor = new AttributeModel(key: "urn_dktk_code_undifferenzierterTumor", name: "Undifferenzierter/unklassifizierter Tumor", description: "Undifferenzierter/unklassifizierter Tumor", type: ValueType.LIST)
        undifferenzierterTumor.codes = []
        AttributeModel blastome = new AttributeModel(key: "urn_dktk_code_Blastome", name: "Blastome, alle Gruppen", description: "Blastome, alle Gruppen", type: ValueType.LIST)
        blastome.codes = []
        AttributeModel keimzellentumore = new AttributeModel(key: "urn_dktk_code_Keimzellentumore", name: "Keimzellentumore, alle Gruppen", description: "Keimzellentumore, alle Gruppen", type: ValueType.LIST)
        keimzellentumore.codes = []

        //TODO End of Entities Catalog related code

        for (entity in entities) {
            List<Group> groups = entity.getListOfGroups()
            for (group in groups) {
                List groupList = []
                List<Attribute> attributes = group.getListOfAttributes()
                for (attribute in attributes) {
                    AttributeModel model = new AttributeModel()
                    model.key = attribute.key
                    model.name = attribute.name
                    model.description = attribute.description
                    model.type = attribute.type
                    println "group name: " + model.name
                    if (attribute.type == ValueType.LIST) {
                        if (attribute.key == "urn_dktk_dataelement_50") {
                            model.lov = attribute.listOfValues?.getLoVItems()?.findAll { it.value == "Ja" }
                        } else if (attribute.key == "urn_dktk_dataelement_89") {
                            List uiccList = ["0", "IA", "IB", "IC", "II", "III", "IV", "IS"]
                            for (String uiccItem : uiccList) {
                                AttributeModel uicc = new AttributeModel()
                                uicc.key = "urn_dktk_dataelement_89"
                                uicc.name = uiccItem
                                uicc.description = uiccItem
                                uicc.type = attribute.type
                                if (uiccItem == "II") uicc.lov = attribute.listOfValues?.getLoVItems()?.findAll {
                                    it.value.startsWith(uiccItem) && !it.value.startsWith("III")
                                }
                                else uicc.lov = attribute.listOfValues?.getLoVItems()?.findAll {
                                    it.value.startsWith(uiccItem)
                                }
                                uicc.setIsInSubGroup(true)
                                if (!model.subGroups) model.subGroups = [uicc]
                                else model.subGroups.add(uicc)
                            }
                        } else if (attribute.key == "urn_dktk_dataelement_100") {
                            List tnmtList = ["0", "1", "2", "3", "4", "is", "is (Mamma)", "is (Prostata)", "X"]
                            for (String tnmtItem : tnmtList) {
                                AttributeModel tnmt = new AttributeModel()
                                tnmt.key = "urn_dktk_dataelement_100"
                                tnmt.name = tnmtItem
                                tnmt.description = tnmtItem
                                tnmt.type = attribute.type
                                if (tnmtItem == "is") tnmt.lov = attribute.listOfValues?.getLoVItems()?.findAll {
                                    it.value == tnmtItem
                                }
                                else if (tnmtItem == "is (Mamma)") tnmt.lov = attribute.listOfValues?.getLoVItems()?.findAll {
                                    it.value.endsWith("IS)") || it.value.endsWith("et)")
                                }
                                else if (tnmtItem == "is (Prostata)") tnmt.lov = attribute.listOfValues?.getLoVItems()?.findAll {
                                    it.value.startsWith("is(p")
                                }
                                else tnmt.lov = attribute.listOfValues?.getLoVItems()?.findAll {
                                        it.value.startsWith(tnmtItem)
                                    }
                                tnmt.setIsInSubGroup(true)
                                if (!model.subGroups) model.subGroups = [tnmt]
                                else model.subGroups.add(tnmt)
                            }
                        } else {
                            model.lov = attribute.listOfValues?.getLoVItems()
                        }
                        //TODO Remove following code after Entities catalog is added to MDR
                        if (attribute.getKey().startsWith("urn_dktk_code_")) {
                            def attrs = []
                            attribute.getListOfValues().getLoVItems().each { item ->
                                String urn = item.getKey()
                                urn = urn.substring(0, urn.lastIndexOf(":"))
                                String key = UrnUtils.urnToKey(urn)
                                Attribute attr = Attribute.findByKey(key)
                                AttributeModel attrm = new AttributeModel()
                                attrm.key = attr.key
                                attrm.name = attr.name
                                attrm.description = attr.description
                                attrm.type = attr.type
                                attrm.lov = attr.listOfValues?.getLoVItems()
                                if (attr.getKey() == "urn_dktk_code_3" || attr.getKey() == "urn_dktk_code_4" ||
                                        attr.getKey() == "urn_dktk_code_5" || attr.getKey() == "urn_dktk_code_6") {
                                    if (!model.subGroups) model.subGroups = [gliome]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == gliome.name
                                        }) model.subGroups.add(gliome)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    gliome.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_7" || attr.getKey() == "urn_dktk_code_8" ||
                                        attr.getKey() == "urn_dktk_code_9" || attr.getKey() == "urn_dktk_code_10"
                                        || attr.getKey() == "urn_dktk_code_11" || attr.getKey() == "urn_dktk_code_12"
                                        || attr.getKey() == "urn_dktk_code_13") {
                                    if (!model.subGroups) model.subGroups = [neoplasien]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == neoplasien.name
                                        }) model.subGroups.add(neoplasien)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    neoplasien.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_14" || attr.getKey() == "urn_dktk_code_15" ||
                                        attr.getKey() == "urn_dktk_code_16" || attr.getKey() == "urn_dktk_code_17") {
                                    if (!model.subGroups) model.subGroups = [neuroonk]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == neuroonk.name
                                        }) model.subGroups.add(neuroonk)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    neuroonk.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_18") {
                                    if (!model.subGroups) model.subGroups = [gliosarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == gliosarkom.name
                                        }) model.subGroups.add(gliosarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    gliosarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_19") {
                                    if (!model.subGroups) model.subGroups = [zNSLymphom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == zNSLymphom.name
                                        }) model.subGroups.add(zNSLymphom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    zNSLymphom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_21" || attr.getKey() == "urn_dktk_code_22" ||
                                        attr.getKey() == "urn_dktk_code_23" || attr.getKey() == "urn_dktk_code_24"
                                        || attr.getKey() == "urn_dktk_code_25" || attr.getKey() == "urn_dktk_code_26"
                                        || attr.getKey() == "urn_dktk_code_27" || attr.getKey() == "urn_dktk_code_28"
                                        || attr.getKey() == "urn_dktk_code_29" || attr.getKey() == "urn_dktk_code_30"
                                        || attr.getKey() == "urn_dktk_code_31") {
                                    if (!model.subGroups) model.subGroups = [kopf]
                                    else {
                                        if (!model.subGroups.find { it.name == kopf.name }) model.subGroups.add(kopf)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    kopf.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_32" || attr.getKey() == "urn_dktk_code_33") {
                                    if (!model.subGroups) model.subGroups = [cup]
                                    else {
                                        if (!model.subGroups.find { it.name == cup.name }) model.subGroups.add(cup)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    cup.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_35" || attr.getKey() == "urn_dktk_code_36" ||
                                        attr.getKey() == "urn_dktk_code_37" || attr.getKey() == "urn_dktk_code_38"
                                        || attr.getKey() == "urn_dktk_code_39" || attr.getKey() == "urn_dktk_code_40"
                                        || attr.getKey() == "urn_dktk_code_41" || attr.getKey() == "urn_dktk_code_42") {
                                    if (!model.subGroups) model.subGroups = [nSCLC]
                                    else {
                                        if (!model.subGroups.find { it.name == nSCLC.name }) model.subGroups.add(nSCLC)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    nSCLC.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_43") {
                                    if (!model.subGroups) model.subGroups = [sCLC]
                                    else {
                                        if (!model.subGroups.find { it.name == sCLC.name }) model.subGroups.add(sCLC)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    sCLC.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_44") {
                                    if (!model.subGroups) model.subGroups = [neuroendocrinesca]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == neuroendocrinesca.name
                                        }) model.subGroups.add(neuroendocrinesca)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    neuroendocrinesca.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_45") {
                                    if (!model.subGroups) model.subGroups = [lungensarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == lungensarkom.name
                                        }) model.subGroups.add(lungensarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    lungensarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_46") {
                                    if (!model.subGroups) model.subGroups = [thymom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == thymom.name
                                        }) model.subGroups.add(thymom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    thymom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_47") {
                                    if (!model.subGroups) model.subGroups = [malignes]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == malignes.name
                                        }) model.subGroups.add(malignes)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    malignes.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_49" || attr.getKey() == "urn_dktk_code_50" ||
                                        attr.getKey() == "urn_dktk_code_51" || attr.getKey() == "urn_dktk_code_52") {
                                    if (!model.subGroups) model.subGroups = [oesophagus]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == oesophagus.name
                                        }) model.subGroups.add(oesophagus)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    oesophagus.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_53" || attr.getKey() == "urn_dktk_code_54") {
                                    if (!model.subGroups) model.subGroups = [magen]
                                    else {
                                        if (!model.subGroups.find { it.name == magen.name }) model.subGroups.add(magen)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    magen.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_55" || attr.getKey() == "urn_dktk_code_56" ||
                                        attr.getKey() == "urn_dktk_code_57" || attr.getKey() == "urn_dktk_code_58") {
                                    if (!model.subGroups) model.subGroups = [gastrointestinale]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == gastrointestinale.name
                                        }) model.subGroups.add(gastrointestinale)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    gastrointestinale.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_59" || attr.getKey() == "urn_dktk_code_60" ||
                                        attr.getKey() == "urn_dktk_code_61" || attr.getKey() == "urn_dktk_code_62") {
                                    if (!model.subGroups) model.subGroups = [leberca]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == leberca.name
                                        }) model.subGroups.add(leberca)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    leberca.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_63" || attr.getKey() == "urn_dktk_code_64") {
                                    if (!model.subGroups) model.subGroups = [pankreasca]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == pankreasca.name
                                        }) model.subGroups.add(pankreasca)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    pankreasca.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_65" || attr.getKey() == "urn_dktk_code_66" ||
                                        attr.getKey() == "urn_dktk_code_67") {
                                    if (!model.subGroups) model.subGroups = [neuroendokrine]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == neuroendokrine.name
                                        }) model.subGroups.add(neuroendokrine)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    neuroendokrine.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_68") {
                                    if (!model.subGroups) model.subGroups = [neuroendokrinet]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == neuroendokrinet.name
                                        }) model.subGroups.add(neuroendokrinet)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    neuroendokrinet.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_69") {
                                    if (!model.subGroups) model.subGroups = [gIST]
                                    else {
                                        if (!model.subGroups.find { it.name == gIST.name }) model.subGroups.add(gIST)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    gIST.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_70") {
                                    if (!model.subGroups) model.subGroups = [maltLymphom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == maltLymphom.name
                                        }) model.subGroups.add(maltLymphom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    maltLymphom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_72" || attr.getKey() == "urn_dktk_code_73") {
                                    if (!model.subGroups) model.subGroups = [mamaca]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == mamaca.name
                                        }) model.subGroups.add(mamaca)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    mamaca.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_74" || attr.getKey() == "urn_dktk_code_75" ||
                                        attr.getKey() == "urn_dktk_code_76" || attr.getKey() == "urn_dktk_code_77"
                                        || attr.getKey() == "urn_dktk_code_80") {
                                    if (!model.subGroups) model.subGroups = [gynaekologische]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == gynaekologische.name
                                        }) model.subGroups.add(gynaekologische)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    gynaekologische.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_78" || attr.getKey() == "urn_dktk_code_79") {
                                    if (!model.subGroups) model.subGroups = [ovarialca]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == ovarialca.name
                                        }) model.subGroups.add(ovarialca)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    ovarialca.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_82" || attr.getKey() == "urn_dktk_code_83") {
                                    if (!model.subGroups) model.subGroups = [penisca]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == penisca.name
                                        }) model.subGroups.add(penisca)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    penisca.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_84" || attr.getKey() == "urn_dktk_code_85") {
                                    if (!model.subGroups) model.subGroups = [prostate]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == prostate.name
                                        }) model.subGroups.add(prostate)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    prostate.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_86") {
                                    if (!model.subGroups) model.subGroups = [net]
                                    else {
                                        if (!model.subGroups.find { it.name == net.name }) model.subGroups.add(net)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    net.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_87" || attr.getKey() == "urn_dktk_code_88" ||
                                        attr.getKey() == "urn_dktk_code_89" || attr.getKey() == "urn_dktk_code_90") {
                                    if (!model.subGroups) model.subGroups = [hoden]
                                    else {
                                        if (!model.subGroups.find { it.name == hoden.name }) model.subGroups.add(hoden)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    hoden.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_91" || attr.getKey() == "urn_dktk_code_92" ||
                                        attr.getKey() == "urn_dktk_code_93" || attr.getKey() == "urn_dktk_code_94") {
                                    if (!model.subGroups) model.subGroups = [nierenzell]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == nierenzell.name
                                        }) model.subGroups.add(nierenzell)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    nierenzell.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_95") {
                                    if (!model.subGroups) model.subGroups = [urothel]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == urothel.name
                                        }) model.subGroups.add(urothel)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    urothel.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_96" || attr.getKey() == "urn_dktk_code_97" ||
                                        attr.getKey() == "urn_dktk_code_98") {
                                    if (!model.subGroups) model.subGroups = [harnblasen]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == harnblasen.name
                                        }) model.subGroups.add(harnblasen)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    harnblasen.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_100" || attr.getKey() == "urn_dktk_code_101") {
                                    if (!model.subGroups) model.subGroups = [malmelanom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == malmelanom.name
                                        }) model.subGroups.add(malmelanom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    malmelanom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_102") {
                                    if (!model.subGroups) model.subGroups = [mukmelanom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == mukmelanom.name
                                        }) model.subGroups.add(mukmelanom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    mukmelanom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_103") {
                                    if (!model.subGroups) model.subGroups = [basalzell]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == basalzell.name
                                        }) model.subGroups.add(basalzell)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    basalzell.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_104" || attr.getKey() == "urn_dktk_code_105") {
                                    if (!model.subGroups) model.subGroups = [plattenepithel]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == plattenepithel.name
                                        }) model.subGroups.add(plattenepithel)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    plattenepithel.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_106") {
                                    if (!model.subGroups) model.subGroups = [sonstigerHauttumor]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == sonstigerHauttumor.name
                                        }) model.subGroups.add(sonstigerHauttumor)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    sonstigerHauttumor.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_107") {
                                    if (!model.subGroups) model.subGroups = [sarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == sarkom.name
                                        }) model.subGroups.add(sarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    sarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_108") {
                                    if (!model.subGroups) model.subGroups = [lymphom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == lymphom.name
                                        }) model.subGroups.add(lymphom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    lymphom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_110" || attr.getKey() == "urn_dktk_code_112" ||
                                        attr.getKey() == "urn_dktk_code_113" || attr.getKey() == "urn_dktk_code_114" ||
                                        attr.getKey() == "urn_dktk_code_115") {
                                    if (!model.subGroups) model.subGroups = [lymphatischeLeukaemie]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == lymphatischeLeukaemie.name
                                        }) model.subGroups.add(lymphatischeLeukaemie)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    lymphatischeLeukaemie.codes.add(attrm)
                                    if (attr.getKey() == "urn_dktk_code_113") {
                                        burkitt.codes.add(attrm)
                                    }
                                } else if (attr.getKey() == "urn_dktk_code_111") {
                                    if (!model.subGroups) model.subGroups = [akuteLeukaemie]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == akuteLeukaemie.name
                                        }) model.subGroups.add(akuteLeukaemie)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    akuteLeukaemie.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_116" || attr.getKey() == "urn_dktk_code_117" ||
                                        attr.getKey() == "urn_dktk_code_118") {
                                    if (!model.subGroups) model.subGroups = [myeloischeLeukaemie]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == myeloischeLeukaemie.name
                                        }) model.subGroups.add(myeloischeLeukaemie)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    myeloischeLeukaemie.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_119" || attr.getKey() == "urn_dktk_code_120" ||
                                        attr.getKey() == "urn_dktk_code_121" || attr.getKey() == "urn_dktk_code_122") {
                                    if (!model.subGroups) model.subGroups = [myeloproliferative]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == myeloproliferative.name
                                        }) model.subGroups.add(myeloproliferative)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    myeloproliferative.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_123") {
                                    if (!model.subGroups) model.subGroups = [myelodysplastischesSyndrom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == myelodysplastischesSyndrom.name
                                        }) model.subGroups.add(myelodysplastischesSyndrom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    myelodysplastischesSyndrom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_124") {
                                    if (!model.subGroups) model.subGroups = [multiplesMyelom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == multiplesMyelom.name
                                        }) model.subGroups.add(multiplesMyelom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    multiplesMyelom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_125") {
                                    if (!model.subGroups) model.subGroups = [nKZellLeukaemie]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == nKZellLeukaemie.name
                                        }) model.subGroups.add(nKZellLeukaemie)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    nKZellLeukaemie.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_126") {
                                    if (!model.subGroups) model.subGroups = [hodgkinLymphom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == hodgkinLymphom.name
                                        }) model.subGroups.add(hodgkinLymphom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    hodgkinLymphom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_113" || attr.getKey() == "urn_dktk_code_134") {
                                    if (!model.subGroups) model.subGroups = [burkitt]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == burkitt.name
                                        }) model.subGroups.add(burkitt)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    burkitt.codes.add(attrm)
                                    burkitt.codes = burkitt.codes.reverse()

                                    if (attr.getKey() == "urn_dktk_code_134") {
                                        hodgkin.codes.add(attrm)
                                    }
                                } else if (attr.getKey() == "urn_dktk_code_127" || attr.getKey() == "urn_dktk_code_128" ||
                                        attr.getKey() == "urn_dktk_code_129" || attr.getKey() == "urn_dktk_code_130"
                                        || attr.getKey() == "urn_dktk_code_131" || attr.getKey() == "urn_dktk_code_132"
                                        || attr.getKey() == "urn_dktk_code_133" || attr.getKey() == "urn_dktk_code_134"
                                        || attr.getKey() == "urn_dktk_code_135" || attr.getKey() == "urn_dktk_code_136") {
                                    if (!model.subGroups) model.subGroups = [burkitt]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == burkitt.name
                                        }) model.subGroups.add(burkitt)
                                    }
                                    if (!model.subGroups) model.subGroups = [hodgkin]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == hodgkin.name
                                        }) model.subGroups.add(hodgkin)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    hodgkin.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_137" || attr.getKey() == "urn_dktk_code_138" || attr.getKey() == "urn_dktk_code_139") {
                                    if (!model.subGroups) model.subGroups = [weiterehaematologischeGruppen]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == weiterehaematologischeGruppen.name
                                        }) model.subGroups.add(weiterehaematologischeGruppen)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    weiterehaematologischeGruppen.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_141" || attr.getKey() == "urn_dktk_code_142") {
                                    if (!model.subGroups) model.subGroups = [ewingSarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == ewingSarkom.name
                                        }) model.subGroups.add(ewingSarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    ewingSarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_143") {
                                    if (!model.subGroups) model.subGroups = [osteosarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == osteosarkom.name
                                        }) model.subGroups.add(osteosarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    osteosarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_144") {
                                    if (!model.subGroups) model.subGroups = [kaposiSarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == kaposiSarkom.name
                                        }) model.subGroups.add(kaposiSarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    kaposiSarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_145" || attr.getKey() == "urn_dktk_code_146" ||
                                        attr.getKey() == "urn_dktk_code_147" || attr.getKey() == "urn_dktk_code_148" ||
                                        attr.getKey() == "urn_dktk_code_150" || attr.getKey() == "urn_dktk_code_153" ||
                                        attr.getKey() == "urn_dktk_code_154" || attr.getKey() == "urn_dktk_code_155" ||
                                        attr.getKey() == "urn_dktk_code_156" || attr.getKey() == "urn_dktk_code_157" ||
                                        attr.getKey() == "urn_dktk_code_158" || attr.getKey() == "urn_dktk_code_159" ||
                                        attr.getKey() == "urn_dktk_code_160" || attr.getKey() == "urn_dktk_code_161" ||
                                        attr.getKey() == "urn_dktk_code_165" || attr.getKey() == "urn_dktk_code_163" ||
                                        attr.getKey() == "urn_dktk_code_149") {
                                    if (!model.subGroups) model.subGroups = [weichteilsarkome]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == weichteilsarkome.name
                                        }) model.subGroups.add(weichteilsarkome)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    weichteilsarkome.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_164") {
                                    if (!model.subGroups) model.subGroups = [gliosarkom2]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == gliosarkom2.name
                                        }) model.subGroups.add(gliosarkom2)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    gliosarkom2.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_151" || attr.getKey() == "urn_dktk_code_152") {
                                    if (!model.subGroups) model.subGroups = [stromasarkom]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == stromasarkom.name
                                        }) model.subGroups.add(stromasarkom)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    stromasarkom.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_162") {
                                    if (!model.subGroups) model.subGroups = [undifferenzierterTumor]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == undifferenzierterTumor.name
                                        }) model.subGroups.add(undifferenzierterTumor)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    undifferenzierterTumor.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_167" || attr.getKey() == "urn_dktk_code_168" ||
                                        attr.getKey() == "urn_dktk_code_169" || attr.getKey() == "urn_dktk_code_170"
                                        || attr.getKey() == "urn_dktk_code_171" || attr.getKey() == "urn_dktk_code_172"
                                        || attr.getKey() == "urn_dktk_code_173" || attr.getKey() == "urn_dktk_code_174"
                                        || attr.getKey() == "urn_dktk_code_175") {
                                    if (!model.subGroups) model.subGroups = [blastome]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == blastome.name
                                        }) model.subGroups.add(blastome)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    blastome.codes.add(attrm)
                                } else if (attr.getKey() == "urn_dktk_code_177" || attr.getKey() == "urn_dktk_code_178" ||
                                        attr.getKey() == "urn_dktk_code_179" || attr.getKey() == "urn_dktk_code_180"
                                        || attr.getKey() == "urn_dktk_code_181" || attr.getKey() == "urn_dktk_code_182") {
                                    if (!model.subGroups) model.subGroups = [keimzellentumore]
                                    else {
                                        if (!model.subGroups.find {
                                            it.name == keimzellentumore.name
                                        }) model.subGroups.add(keimzellentumore)
                                    }
                                    attrm.setIsInSubGroup(true)
                                    keimzellentumore.codes.add(attrm)
                                } else {
                                    attrs.add(attrm)
                                }

                            }
                            model.codes = attrs
                        }
                        //TODO End of Entities catalog related code
                    }
                    if (attribute.type == ValueType.DATE) {
                        model.format = messageSource.getMessage("date.format", null, null)
                        model.jsFormat = messageSource.getMessage("date.jsFormat", null, null)
                    } else {
                        model.format = 0
                    }
                    model.entity = entity.key
                    groupList.add(model)
                    if (group.name.equalsIgnoreCase("Klassifikation von Primärtumoren")) {
                        if (model.key == "urn_dktk_dataelement_89") {
                            AttributeModel tnm = new AttributeModel(key: "TNM", name: "TNM", description: "TNM", type: ValueType.LIST)
                            groupList.add(tnm)
                        }
                    }
                }
                queryMap["${group.name}"] = groupList
            }
        }
        return queryMap
    }
}
