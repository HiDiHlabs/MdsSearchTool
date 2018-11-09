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
         tnm.urn_dktk_dataelement_99
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

         LEFT JOIN (SELECT * FROM mds_k hist WHERE  hist.urn_dktk_dataelement_7 IS NOT NULL OR
                                                    hist.urn_dktk_dataelement_8 IS NOT NULL OR
                                                    hist.urn_dktk_dataelement_9 IS NOT NULL
                   )  hist
           ON single.parent_id = hist.parent_id
         LEFT JOIN (SELECT * FROM mds_k meta WHERE   meta.urn_dktk_dataelement_21 IS NOT NULL OR
                                                     meta.urn_dktk_dataelement_77 IS NOT NULL OR
                                                     meta.urn_dktk_dataelement_98 IS NOT NULL
                   ) meta
           ON single.parent_id = meta.parent_id
         LEFT JOIN (SELECT * FROM mds_k prog WHERE   prog.urn_dktk_dataelement_23 IS NOT NULL OR
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
         LEFT JOIN (SELECT * FROM mds_k tnm WHERE        tnm.urn_dktk_dataelement_10 IS NOT NULL OR
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
WITH DATA;

--REFRESH MATERIALIZED VIEW mds_k_view WITH DATA;

--REFRESH MATERIALIZED VIEW mds_k_view WITH NO DATA;

--DROP MATERIALIZED VIEW mds_k_view;