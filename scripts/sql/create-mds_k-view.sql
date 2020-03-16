CREATE MATERIALIZED VIEW mds_k_view AS
SELECT
	patient.patient_id,
	urn_dktk_dataelement_3, --Diagnosis
	urn_dktk_dataelement_28, --Diagnosis
	urn_dktk_dataelement_29, --Diagnosis
	urn_dktk_dataelement_83, --Diagnosis
	urn_dktk_dataelement_7, --Histology
	urn_dktk_dataelement_8, --Histology
	urn_dktk_dataelement_9, --Histology
	urn_dktk_dataelement_21, --Metastasis
	urn_dktk_dataelement_77, --Metastasis
	urn_dktk_dataelement_98, --Metastasis
--	urn_marker_dataelement_1, --MolecularMarker
--	urn_marker_dataelement_2, --MolecularMarker
--	urn_marker_dataelement_3, --MolecularMarker
--	urn_marker_dataelement_4, --MolecularMarker
	urn_dktk_dataelement_1, --Patient
	urn_dktk_dataelement_26, --Patient
	urn_dktk_dataelement_48, --Patient
	urn_dktk_dataelement_53, --Patient
	urn_dktk_dataelement_54, --Patient
	urn_dktk_dataelement_62, --Patient
	urn_dktk_dataelement_63, --Patient
	urn_dktk_dataelement_64, --Patient
	urn_dktk_dataelement_91, --Patient
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
	urn_dktk_dataelement_49, --Sample
	urn_dktk_dataelement_50, --Sample
	urn_dktk_dataelement_90, --Sample
	urn_dktk_dataelement_95, --Sample
	urn_dktk_dataelement_97, --Sample
	urn_dktk_dataelement_19, --Surgery
	urn_dktk_dataelement_20, --Surgery
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
WITH DATA;



--REFRESH MATERIALIZED VIEW mds_k_view WITH NO DATA;

--DROP MATERIALIZED VIEW mds_k_view;