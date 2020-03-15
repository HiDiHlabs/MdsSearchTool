CREATE MATERIALIZED VIEW mds_k_view AS
SELECT
	patient.patient_id,
	urn_adt_dataelement_28, --Diagnosis
	urn_adt_dataelement_29, --Diagnosis
	urn_adt_dataelement_109, --Diagnosis
	urn_dktk_dataelement_3, --Diagnosis
	urn_dktk_dataelement_28, --Diagnosis
	urn_dktk_dataelement_29, --Diagnosis
	urn_dktk_dataelement_83, --Diagnosis
	urn_adt_dataelement_37, --Histology
	urn_adt_dataelement_38, --Histology
	urn_adt_dataelement_40, --Histology
	urn_dktk_dataelement_7, --Histology
	urn_dktk_dataelement_8, --Histology
	urn_dktk_dataelement_9, --Histology
	urn_adt_dataelement_65, --Metastasis
	urn_adt_dataelement_66, --Metastasis
	urn_dktk_dataelement_21, --Metastasis
	urn_dktk_dataelement_77, --Metastasis
	urn_dktk_dataelement_98, --Metastasis
	urn_marker_dataelement_1, --MolecularMarker
	urn_marker_dataelement_2, --MolecularMarker
	urn_marker_dataelement_3, --MolecularMarker
	urn_marker_dataelement_4, --MolecularMarker
	urn_adt_dataelement_9, --Patient
	urn_adt_dataelement_26, --Patient
	urn_adt_dataelement_103, --Patient
	urn_adt_dataelement_104, --Patient
	urn_adt_dataelement_105, --Patient
	urn_adt_dataelement_106, --Patient
	urn_dktk_dataelement_1, --Patient
	urn_dktk_dataelement_26, --Patient
	urn_dktk_dataelement_48, --Patient
	urn_dktk_dataelement_53, --Patient
	urn_dktk_dataelement_54, --Patient
	urn_dktk_dataelement_62, --Patient
	urn_dktk_dataelement_63, --Patient
	urn_dktk_dataelement_64, --Patient
	urn_dktk_dataelement_91, --Patient
	urn_adt_dataelement_68, --Progress
	urn_adt_dataelement_96, --Progress
	urn_adt_dataelement_97, --Progress
	urn_dktk_dataelement_23, --Progress
	urn_dktk_dataelement_24, --Progress
	urn_dktk_dataelement_25, --Progress
	urn_dktk_dataelement_33, --Progress
	urn_dktk_dataelement_34, --Progress
	urn_dktk_dataelement_36, --Progress
	urn_dktk_dataelement_38, --Progress
	urn_dktk_dataelement_39, --Progress
	urn_dktk_dataelement_40, --Progress
	urn_dktk_dataelement_43, --Progress
	urn_dktk_dataelement_45, --Progress
	urn_dktk_dataelement_46, --Progress
	urn_dktk_dataelement_67, --Progress
	urn_dktk_dataelement_68, --Progress
	urn_dktk_dataelement_69, --Progress
	urn_dktk_dataelement_70, --Progress
	urn_dktk_dataelement_72, --Progress
	urn_dktk_dataelement_73, --Progress
	urn_dktk_dataelement_74, --Progress
	urn_adt_dataelement_83, --RadiationAdverseEffects
	urn_adt_dataelement_84, --RadiationAdverseEffects
	urn_adt_dataelement_85, --RadiationAdverseEffects
	urn_adt_dataelement_73, --RadiationTherapy
	urn_adt_dataelement_74, --RadiationTherapy
	urn_adt_dataelement_75, --RadiationTherapy
	urn_adt_dataelement_76, --RadiationTherapy
	urn_adt_dataelement_77, --RadiationTherapy
	urn_adt_dataelement_78, --RadiationTherapy
	urn_adt_dataelement_79, --RadiationTherapy
	urn_adt_dataelement_80, --RadiationTherapy
	urn_adt_dataelement_81, --RadiationTherapy
	urn_adt_dataelement_82, --RadiationTherapy
	urn_dktk_dataelement_49, --Sample
	urn_dktk_dataelement_50, --Sample
	urn_dktk_dataelement_90, --Sample
	urn_dktk_dataelement_95, --Sample
	urn_dktk_dataelement_97, --Sample
	urn_dktk_dataelement_19, --Surgery
	urn_dktk_dataelement_20, --Surgery
	urn_adt_dataelement_94, --SystemAdverseEffects
	urn_adt_dataelement_95, --SystemAdverseEffects
	urn_adt_dataelement_110, --SystemAdverseEffects
	urn_adt_dataelement_86, --SystemTherapy
	urn_adt_dataelement_87, --SystemTherapy
	urn_adt_dataelement_88, --SystemTherapy
	urn_adt_dataelement_89, --SystemTherapy
	urn_adt_dataelement_90, --SystemTherapy
	urn_adt_dataelement_91, --SystemTherapy
	urn_adt_dataelement_92, --SystemTherapy
	urn_adt_dataelement_93, --SystemTherapy
	urn_adt_dataelement_27, --Tnm
	urn_adt_dataelement_45, --Tnm
	urn_adt_dataelement_46, --Tnm
	urn_adt_dataelement_47, --Tnm
	urn_adt_dataelement_48, --Tnm
	urn_adt_dataelement_50, --Tnm
	urn_adt_dataelement_51, --Tnm
	urn_adt_dataelement_52, --Tnm
	urn_adt_dataelement_53, --Tnm
	urn_adt_dataelement_54, --Tnm
	urn_adt_dataelement_55, --Tnm
	urn_adt_dataelement_56, --Tnm
	urn_adt_dataelement_57, --Tnm
	urn_adt_dataelement_58, --Tnm
	urn_adt_dataelement_59, --Tnm
	urn_adt_dataelement_60, --Tnm
	urn_dktk_dataelement_2, --Tnm
	urn_dktk_dataelement_10, --Tnm
	urn_dktk_dataelement_18, --Tnm
	urn_dktk_dataelement_78, --Tnm
	urn_dktk_dataelement_79, --Tnm
	urn_dktk_dataelement_80, --Tnm
	urn_dktk_dataelement_81, --Tnm
	urn_dktk_dataelement_82, --Tnm
	urn_dktk_dataelement_89, --Tnm
	urn_dktk_dataelement_99, --Tnm
	urn_dktk_dataelement_100, --Tnm
	urn_dktk_dataelement_101, --Tnm
	urn_adt_dataelement_30, --Tumour
	urn_adt_dataelement_31, --Tumour
	urn_adt_dataelement_32, --Tumour
	urn_adt_dataelement_33, --Tumour
	urn_dktk_dataelement_4, --Tumour
	urn_dktk_dataelement_5, --Tumour
	urn_dktk_dataelement_6 --Tumour

	FROM patient
		LEFT JOIN sample ON sample.parent_id = patient.id
		LEFT JOIN diagnosis ON diagnosis.parent_id = patient.id
			LEFT JOIN tumour ON tumour.parent_id = diagnosis.id
				LEFT JOIN histology ON histology.parent_id = tumour.id
				LEFT JOIN metastasis ON metastasis.parent_id = tumour.id
				LEFT JOIN tnm ON tnm.parent_id = tumour.id
				LEFT JOIN molecular_marker ON molecular_marker.parent_id = tumour.id
				LEFT JOIN progress ON progress.parent_id = tumour.id
					LEFT JOIN surgery ON surgery.parent_id = progress.id
					LEFT JOIN radiation_therapy ON radiation_therapy.parent_id = progress.id
						LEFT JOIN radiation_adverse_effects ON radiation_adverse_effects.parent_id = radiation_therapy.id
					LEFT JOIN system_therapy ON system_therapy.parent_id = progress.id
						LEFT JOIN system_adverse_effects ON system_adverse_effects.parent_id = system_therapy.id
WITH DATA;



/*
CREATE MATERIALIZED VIEW mds_k_view AS
    SELECT
        single.parent_id,
        single.urn_dktk_dataelement_1,
        single.urn_dktk_dataelement_19,
        single.urn_dktk_dataelement_26,
        single.urn_dktk_dataelement_48,
        single.urn_dktk_dataelement_53,
        single.urn_dktk_dataelement_54,
        single.urn_dktk_dataelement_28,
        single.urn_dktk_dataelement_29,
        single.urn_dktk_dataelement_83,
        single.urn_dktk_dataelement_4,
        single.urn_dktk_dataelement_5,
        single.urn_dktk_dataelement_6,
        hist.urn_dktk_dataelement_7,
        hist.urn_dktk_dataelement_8,
        hist.urn_dktk_dataelement_9,
        meta.urn_dktk_dataelement_21,
        meta.urn_dktk_dataelement_77,
        meta.urn_dktk_dataelement_98,
        prog.urn_dktk_dataelement_23,
        prog.urn_dktk_dataelement_24,
        prog.urn_dktk_dataelement_25,
        prog.urn_dktk_dataelement_33,
        prog.urn_dktk_dataelement_34,
        prog.urn_dktk_dataelement_36,
        prog.urn_dktk_dataelement_38,
        prog.urn_dktk_dataelement_39,
        prog.urn_dktk_dataelement_40,
        prog.urn_dktk_dataelement_43,
        prog.urn_dktk_dataelement_45,
        prog.urn_dktk_dataelement_46,
        prog.urn_dktk_dataelement_67,
        prog.urn_dktk_dataelement_69,
        prog.urn_dktk_dataelement_72,
        prog.urn_dktk_dataelement_73,
        prog.urn_dktk_dataelement_74,
        tnm.urn_dktk_dataelement_10,
        tnm.urn_dktk_dataelement_100,
        tnm.urn_dktk_dataelement_101,
        tnm.urn_dktk_dataelement_18,
        tnm.urn_dktk_dataelement_2,
        tnm.urn_dktk_dataelement_20,
        tnm.urn_dktk_dataelement_3,
        tnm.urn_dktk_dataelement_78,
        tnm.urn_dktk_dataelement_79,
        tnm.urn_dktk_dataelement_80,
        tnm.urn_dktk_dataelement_81,
        tnm.urn_dktk_dataelement_82,
        tnm.urn_dktk_dataelement_89,
        tnm.urn_dktk_dataelement_99,
        sampl.urn_dktk_dataelement_49,
        sampl.urn_dktk_dataelement_90,
        sampl.urn_dktk_dataelement_50,
        sampl.urn_dktk_dataelement_97,
        sampl.urn_dktk_dataelement_95


    FROM (SELECT DISTINCT
            single.parent_id,
            single.urn_dktk_dataelement_1,
            single.urn_dktk_dataelement_19,
            single.urn_dktk_dataelement_26,
            single.urn_dktk_dataelement_48,
            single.urn_dktk_dataelement_53,
            single.urn_dktk_dataelement_54,
            single.urn_dktk_dataelement_28, --/ 10 AS urn_dktk_dataelement_28,
            single.urn_dktk_dataelement_29,
            single.urn_dktk_dataelement_83,
            single.urn_dktk_dataelement_4,
            single.urn_dktk_dataelement_5,
            single.urn_dktk_dataelement_6
        FROM mds_k single
        ) single

    LEFT JOIN (SELECT * FROM mds_k hist WHERE
                                            hist.urn_dktk_dataelement_7 IS NOT NULL OR
                                            hist.urn_dktk_dataelement_8 IS NOT NULL OR
                                            hist.urn_dktk_dataelement_9 IS NOT NULL
           )  hist
    ON single.parent_id = hist.parent_id

    LEFT JOIN (SELECT * FROM mds_k meta WHERE
                                            meta.urn_dktk_dataelement_21 IS NOT NULL OR
                                            meta.urn_dktk_dataelement_77 IS NOT NULL OR
                                            meta.urn_dktk_dataelement_98 IS NOT NULL
            ) meta
    ON single.parent_id = meta.parent_id

    LEFT JOIN (SELECT * FROM mds_k prog WHERE
                                            prog.urn_dktk_dataelement_23 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_24 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_25 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_33 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_34 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_36 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_38 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_39 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_40 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_43 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_45 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_46 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_67 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_69 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_72 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_73 IS NOT NULL OR
                                            prog.urn_dktk_dataelement_74 IS NOT NULL
        ) prog
    ON single.parent_id = prog.parent_id

    LEFT JOIN (SELECT * FROM mds_k tnm WHERE
                                            tnm.urn_dktk_dataelement_10 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_100 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_101 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_18 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_2 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_20 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_3 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_78 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_79 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_80 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_81 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_82 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_89 IS NOT NULL OR
                                            tnm.urn_dktk_dataelement_99 IS NOT NULL
           ) tnm
    ON single.parent_id = tnm.parent_id

    LEFT JOIN (SELECT * FROM mds_b sampl WHERE
                                            sampl.urn_dktk_dataelement_49 IS NOT NULL OR
                                            sampl.urn_dktk_dataelement_90 IS NOT NULL OR
                                            sampl.urn_dktk_dataelement_50 IS NOT NULL OR
                                            sampl.urn_dktk_dataelement_97 IS NOT NULL OR
                                            sampl.urn_dktk_dataelement_95 IS NOT NULL
    ) sampl
    ON single.parent_id = sampl.parent_id

WITH DATA;
*/
--REFRESH MATERIALIZED VIEW mds_k_view WITH DATA;

--REFRESH MATERIALIZED VIEW mds_k_view WITH NO DATA;

--DROP MATERIALIZED VIEW mds_k_view;