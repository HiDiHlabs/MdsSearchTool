package definitions

public final enum MDS {


    PATIENT(null, "Patient", "patient", 0, null),
    SAMPLE (null, "Sample", "sample", 1, "patient"),
    DIAGNOSIS (null, "Diagnosis", "diagnosis", 2, "patient"),
    TUMOUR (null, "Tumour", "tumour", 3, "diagnosis"),
    HISTOLOGY (null, "Histology", "histology", 4, "tumour"),
    METASTASIS (null, "Metastasis", "metastasis", 5, "tumour"),
    TNM (null, "Tnm", "tnm", 6, "tumour"),
    MOLECULAR_MARKER (null, "MolecularMarker", "molecular_marker", 7, "tumour"),
    PROGRESS (null, "Progress", "progress", 8, "tumour"),
    SURGERY (null, "Surgery", "surgery", 9, "progress");
    /*
    RADIATION_THERAPY (null, "RadiationTherapy", "radiation_therapy", 10, "progress"),
    RADIATION_ADVERSE_EFFECTS (null, "RadiationAdverseEffects", "radiation_adverse_effects", 11, "radiation_therapy"),
    SYSTEM_THERAPY (null, "SystemTherapy", "system_therapy", 12, "progress"),
    SYSTEM_ADVERSE_EFFECTS (null, "SystemAdverseEffects", "system_adverse_effects", 13, "system_therapy");
    */

    String mdrDesignation
    String name
    String key
    int order
    String parentKey

    def getSiteID() {
        return "${key}_site_id"
    }

    def getTeilerID() {
        return "${key}_teiler_id"
    }

    def getID() {
        return "${key}_id"
    }

    MDS(mdrDesignation, name, key, order, parentKey) {
        this.mdrDesignation = mdrDesignation
        this.name = name
        this.key = key
        this.order = order
        this.parentKey = parentKey
    }

}
