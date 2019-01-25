--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.23
-- Dumped by pg_dump version 10.6

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: attribute; Type: TABLE DATA; Schema: public; Owner: dktktest
--

SET SESSION AUTHORIZATION DEFAULT;

\connect dktktest

--ALTER TABLE public.attribute DISABLE TRIGGER ALL;

COPY public.attribute (id, version, description, entity_type_id, groupable, nullable, key, list_of_values_id, name, type, unit, format, version_) FROM stdin;
1476	0	Standort Identifier	12	f	f	patient_site_id	\N	Patient Standort	STRING	\N	\N	1
1477	0	Teiler Identifier	12	f	f	patient_teiler_id	\N	Patient Teiler	STRING	\N	\N	1
1478	0	Patient Identifier	12	f	f	patient_id	\N	Patient ID	STRING	\N	\N	1
1479	0	Standort Identifier	13	f	f	mds_k_site_id	\N	Case Standort	STRING	\N	\N	1
1480	0	Teiler Identifier	13	f	f	mds_k_teiler_id	\N	Case Teiler	STRING	\N	\N	1
1481	0	Case Identifier	13	f	f	mds_k_id	\N	Case ID	STRING	\N	\N	1
1775	0	Beurteilung der Situation im Primärtumorbereich	13	f	t	urn_dktk_dataelement_72	1625	Lokales/regionäres Rezidiv	LIST	\N	enumerated	2
1781	0	Standort Identifier	14	f	f	mds_b_site_id	\N	Biomaterial Standort	STRING	\N	\N	1
1787	0	Gibt die Art des Biomaterials an	14	f	t	urn_dktk_dataelement_97	1631	Probenart	LIST	\N	enumerated	1
1793	0	Nephroblastom	13	f	t	urn_dktk_code_171	1637	Nephroblastom	LIST	\N	\N	1
1799	0	Keimzellentumore	13	f	t	urn_dktk_code_176	1643	Keimzellentumore	LIST	\N	\N	1
1805	0	Weiterer Keimzelltumor	13	f	t	urn_dktk_code_182	1649	Weiterer Keimzelltumor	LIST	\N	\N	1
1811	0	Myeloische Leukämie: Akute myeloische Leukämie	13	f	t	urn_dktk_code_116	1655	Myeloische Leukämie: Akute myeloische Leukämie	LIST	\N	\N	1
1817	0	Non-Hodgkin-Lymphom: Lymphoblastisches Lymphom	13	f	t	urn_dktk_code_136	1661	Non-Hodgkin-Lymphom: Lymphoblastisches Lymphom	LIST	\N	\N	1
1823	0	Chronische myeloproliferative Erkrankung: Essentielle Thrombozytämie	13	f	t	urn_dktk_code_121	1667	Chronische myeloproliferative Erkrankung: Essentielle Thrombozytämie	LIST	\N	\N	1
1829	0	Non-Hodgkin-Lymphom: Follikuläres Lymphom	13	f	t	urn_dktk_code_127	1673	Non-Hodgkin-Lymphom: Follikuläres Lymphom	LIST	\N	\N	1
1835	0	Non-Hodgkin-Lymphom: Mantelzell-Lymphom	13	f	t	urn_dktk_code_133	1679	Non-Hodgkin-Lymphom: Mantelzell-Lymphom	LIST	\N	\N	1
1841	0	Basalzell-Ca	13	f	t	urn_dktk_code_103	1685	Basalzell-Ca	LIST	\N	\N	1
1847	0	Sarkome	13	f	t	urn_dktk_code_140	1691	Sarkome	LIST	\N	\N	1
1853	0	Gastrointest. Stromatumor - unsicheren Verhaltens	13	f	t	urn_dktk_code_152	1697	Gastrointest. Stromatumor - unsicheren Verhaltens	LIST	\N	\N	1
1859	0	Undifferenzierter/unklassifizierter Tumor	13	f	t	urn_dktk_code_162	1703	Undifferenzierter/unklassifizierter Tumor	LIST	\N	\N	1
1865	0	Ewing-Sarkom: Soft Tissue Ewing Sarkom	13	f	t	urn_dktk_code_142	1709	Ewing-Sarkom: Soft Tissue Ewing Sarkom	LIST	\N	\N	1
1871	0	Fibrobl. Weichteilsarkom - unsicheren Verhaltens	13	f	t	urn_dktk_code_148	1715	Fibrobl. Weichteilsarkom - unsicheren Verhaltens	LIST	\N	\N	1
1877	0	Neuroendokriner Tumor	13	f	t	urn_dktk_code_86	1721	Neuroendokriner Tumor	LIST	\N	\N	1
1883	0	Harnblase: Plattenepithel-Ca	13	f	t	urn_dktk_code_96	1727	Harnblase: Plattenepithel-Ca	LIST	\N	\N	1
1889	0	Penis-Ca, anderes	13	f	t	urn_dktk_code_83	1733	Penis-Ca, anderes	LIST	\N	\N	1
1895	0	Mamma-Ca (in situ)	13	f	t	urn_dktk_code_73	1739	Mamma-Ca (in situ)	LIST	\N	\N	1
1901	0	Thoraxonkologie	13	f	t	urn_dktk_code_34	1745	Thoraxonkologie	LIST	\N	\N	1
1907	0	NSCLC, anderes: sarkomatoides Ca	13	f	t	urn_dktk_code_39	1751	NSCLC, anderes: sarkomatoides Ca	LIST	\N	\N	1
1913	0	Lungensarkom	13	f	t	urn_dktk_code_45	1757	Lungensarkom	LIST	\N	\N	1
1919	0	Pankreas: muzinöses Adeno-Ca	13	f	t	urn_dktk_code_63	1763	Pankreas: muzinöses Adeno-Ca	LIST	\N	\N	1
1925	0	Kolorektal: Adeno-Ca	13	f	t	urn_dktk_code_57	1769	Kolorektal: Adeno-Ca	LIST	\N	\N	1
1931	0	Leber: HCC	13	f	t	urn_dktk_code_59	1775	Leber: HCC	LIST	\N	\N	1
1937	0	Magenübergang: Adeno-Ca	13	f	t	urn_dktk_code_52	1781	Magenübergang: Adeno-Ca	LIST	\N	\N	1
1943	0	Gliosarkom	13	f	t	urn_dktk_code_18	1787	Gliosarkom	LIST	\N	\N	1
1949	0	Tumor der kranialen und spinalen Nerven - Grad III	13	f	t	urn_dktk_code_12	1793	Tumor der kranialen und spinalen Nerven - Grad III	LIST	\N	\N	1
1955	0	Gliom - Grad IV	13	f	t	urn_dktk_code_6	1799	Gliom - Grad IV	LIST	\N	\N	1
1961	0	Speicheldrüse: Adeno-Ca	13	f	t	urn_dktk_code_22	1805	Speicheldrüse: Adeno-Ca	LIST	\N	\N	1
1967	0	Larynx - Glottis: Plattenepithel-Ca	13	f	t	urn_dktk_code_28	1811	Larynx - Glottis: Plattenepithel-Ca	LIST	\N	\N	1
1776	0	Beurteilung der Situation im Bereich der regionären Lymphknoten	13	f	t	urn_dktk_dataelement_73	1626	Lymphknoten-Rezidiv	LIST	\N	enumerated	2
1782	0	Teiler Identifier	14	f	f	mds_b_teiler_id	\N	Biomaterial Teiler	STRING	\N	\N	1
1788	0	Gibt den Typ des Biomaterials an	14	f	t	urn_dktk_dataelement_95	1632	Probentyp	LIST	\N	enumerated	2
1794	0	Pankreatoblastom	13	f	t	urn_dktk_code_168	1638	Pankreatoblastom	LIST	\N	\N	1
1800	0	Germinom	13	f	t	urn_dktk_code_180	1644	Germinom	LIST	\N	\N	1
1806	0	Hämatologische Neoplasien	13	f	t	urn_dktk_code_109	1650	Hämatologische Neoplasien	LIST	\N	\N	1
1812	0	Myeloische Leukämie: Akute Promyelozytenleukämie	13	f	t	urn_dktk_code_117	1656	Myeloische Leukämie: Akute Promyelozytenleukämie	LIST	\N	\N	1
1818	0	Mastzelllymphom	13	f	t	urn_dktk_code_137	1662	Mastzelllymphom	LIST	\N	\N	1
1824	0	Chronische myeloproliferative Erkrankung: Primäre Myelofibrose	13	f	t	urn_dktk_code_120	1668	Chronische myeloproliferative Erkrankung: Primäre Myelofibrose	LIST	\N	\N	1
1830	0	Hodgkin-Lymphom	13	f	t	urn_dktk_code_126	1674	Hodgkin-Lymphom	LIST	\N	\N	1
1836	0	Non-Hodgkin-Lymphom: Großzelliges anaplastisches Lymphom	13	f	t	urn_dktk_code_132	1680	Non-Hodgkin-Lymphom: Großzelliges anaplastisches Lymphom	LIST	\N	\N	1
1842	0	Kutanes Lymphom	13	f	t	urn_dktk_code_108	1686	Kutanes Lymphom	LIST	\N	\N	1
1848	0	Synovialsarkom	13	f	t	urn_dktk_code_157	1692	Synovialsarkom	LIST	\N	\N	1
1854	0	Gastrointestinales Stromasarkom	13	f	t	urn_dktk_code_151	1698	Gastrointestinales Stromasarkom	LIST	\N	\N	1
1860	0	Weichteilsark. d. Nervenscheiden - unsicheren Verhaltens	13	f	t	urn_dktk_code_161	1704	Weichteilsark. d. Nervenscheiden - unsicheren Verhaltens	LIST	\N	\N	1
1866	0	Osteosarkom/Chondrosarkom	13	f	t	urn_dktk_code_143	1710	Osteosarkom/Chondrosarkom	LIST	\N	\N	1
1872	0	Fibrohistiozytäres Weichteilsarkom	13	f	t	urn_dktk_code_149	1716	Fibrohistiozytäres Weichteilsarkom	LIST	\N	\N	1
1878	0	Nierenzell-Ca: chromophob	13	f	t	urn_dktk_code_93	1722	Nierenzell-Ca: chromophob	LIST	\N	\N	1
1884	0	Urothel-Ca	13	f	t	urn_dktk_code_95	1728	Urothel-Ca	LIST	\N	\N	1
1890	0	Penis: Plattenepithel-Ca	13	f	t	urn_dktk_code_82	1734	Penis: Plattenepithel-Ca	LIST	\N	\N	1
1896	0	Mamma-Ca	13	f	t	urn_dktk_code_72	1740	Mamma-Ca	LIST	\N	\N	1
1902	0	NSCLC: Adeno-Ca	13	f	t	urn_dktk_code_35	1746	NSCLC: Adeno-Ca	LIST	\N	\N	1
1908	0	NSCLC, anderes: großzelliges Ca	13	f	t	urn_dktk_code_38	1752	NSCLC, anderes: großzelliges Ca	LIST	\N	\N	1
1914	0	Neuroendocrines Ca (ohne SCLC)	13	f	t	urn_dktk_code_44	1758	Neuroendocrines Ca (ohne SCLC)	LIST	\N	\N	1
1920	0	Neuroendokriner Tumor (NET): Gemischtes adeno-neuroendokrines Karzinom	13	f	t	urn_dktk_code_68	1764	Neuroendokriner Tumor (NET): Gemischtes adeno-neuroendokrines Karzinom	LIST	\N	\N	1
1926	0	Magen: Linitis plastica	13	f	t	urn_dktk_code_54	1770	Magen: Linitis plastica	LIST	\N	\N	1
1932	0	MALT-Lymphom	13	f	t	urn_dktk_code_70	1776	MALT-Lymphom	LIST	\N	\N	1
1938	0	Neuroonkologie	13	f	t	urn_dktk_code_2	1782	Neuroonkologie	LIST	\N	\N	1
1944	0	Atypischer teratoider/rhabdoider Tumor - Grad IV	13	f	t	urn_dktk_code_17	1788	Atypischer teratoider/rhabdoider Tumor - Grad IV	LIST	\N	\N	1
1950	0	Neuroepitheliomatöse Neoplasie - Grad III	13	f	t	urn_dktk_code_11	1794	Neuroepitheliomatöse Neoplasie - Grad III	LIST	\N	\N	1
1956	0	Kopf-Hals-Tumore	13	f	t	urn_dktk_code_20	1800	Kopf-Hals-Tumore	LIST	\N	\N	1
1962	0	Oropharynx: Plattenepithel-Ca	13	f	t	urn_dktk_code_23	1806	Oropharynx: Plattenepithel-Ca	LIST	\N	\N	1
1968	0	Larynx - Supraglottis: Plattenepithel-Ca	13	f	t	urn_dktk_code_29	1812	Larynx - Supraglottis: Plattenepithel-Ca	LIST	\N	\N	1
1777	0	Gesamtbeurteilung des Tumorstatus. Für den Fall, dass nur eine Primärtherapie gegeben wurde, wird "entspricht Primärtherapie" angezeigt. Es werden nur die Patienten ausgegeben, deren Dokumentation des Ansprechens innerhalb von 3 Monaten liegt	13	f	t	urn_dktk_dataelement_84	1627	Ansprechen innerhalb der letzten 3 Monate	LIST	\N	enumerated	2
1783	0	Biomaterial Identifier	14	f	f	mds_b_id	\N	Biomaterial ID	STRING	\N	\N	1
1789	0	Blastome	13	f	t	urn_dktk_code_166	1633	Blastome	LIST	\N	\N	1
1795	0	Pleuro-pulmonales Blastom	13	f	t	urn_dktk_code_169	1639	Pleuro-pulmonales Blastom	LIST	\N	\N	1
1801	0	Teratom	13	f	t	urn_dktk_code_181	1645	Teratom	LIST	\N	\N	1
1807	0	Lymphatische Leukämie: Chronische lymphatische Leukämie	13	f	t	urn_dktk_code_112	1651	Lymphatische Leukämie: Chronische lymphatische Leukämie	LIST	\N	\N	1
1813	0	Lymphatische Leukämie: Prolymphozytenleukämie	13	f	t	urn_dktk_code_114	1657	Lymphatische Leukämie: Prolymphozytenleukämie	LIST	\N	\N	1
1819	0	Neoplasie der Histiozyten und akzessorischer lymphoider Zellen	13	f	t	urn_dktk_code_138	1663	Neoplasie der Histiozyten und akzessorischer lymphoider Zellen	LIST	\N	\N	1
1825	0	Myelodysplastisches Syndrom	13	f	t	urn_dktk_code_123	1669	Myelodysplastisches Syndrom	LIST	\N	\N	1
1831	0	Non-Hodgkin-Lymphom: Marginalzonen-B-Zell-Lymphom	13	f	t	urn_dktk_code_129	1675	Non-Hodgkin-Lymphom: Marginalzonen-B-Zell-Lymphom	LIST	\N	\N	1
1837	0	Dermatologische Onkologie	13	f	t	urn_dktk_code_99	1681	Dermatologische Onkologie	LIST	\N	\N	1
1843	0	Sonstiger Hauttumor	13	f	t	urn_dktk_code_106	1687	Sonstiger Hauttumor	LIST	\N	\N	1
1849	0	Skelettmuskuläres Weichteilsarkom/Rhabdomyosarkom	13	f	t	urn_dktk_code_156	1693	Skelettmuskuläres Weichteilsarkom/Rhabdomyosarkom	LIST	\N	\N	1
1855	0	Fibrohistioz. Weichteilsarkom - unsicheren Verhaltens	13	f	t	urn_dktk_code_150	1699	Fibrohistioz. Weichteilsarkom - unsicheren Verhaltens	LIST	\N	\N	1
1861	0	Weichteilsarkom der Nervenscheiden	13	f	t	urn_dktk_code_160	1705	Weichteilsarkom der Nervenscheiden	LIST	\N	\N	1
1867	0	Kaposi-Sarkom	13	f	t	urn_dktk_code_144	1711	Kaposi-Sarkom	LIST	\N	\N	1
1873	0	Urologische Onkologie	13	f	t	urn_dktk_code_81	1717	Urologische Onkologie	LIST	\N	\N	1
1879	0	Nierenzell-Ca: papillär	13	f	t	urn_dktk_code_92	1723	Nierenzell-Ca: papillär	LIST	\N	\N	1
1885	0	Nierenzell-Ca, anderes	13	f	t	urn_dktk_code_94	1729	Nierenzell-Ca, anderes	LIST	\N	\N	1
1891	0	Gynäkologische Onkologie	13	f	t	urn_dktk_code_71	1735	Gynäkologische Onkologie	LIST	\N	\N	1
1897	0	Endometrium-Ca	13	f	t	urn_dktk_code_77	1741	Endometrium-Ca	LIST	\N	\N	1
1903	0	NSCLC: Plattenepithel-Ca	13	f	t	urn_dktk_code_36	1747	NSCLC: Plattenepithel-Ca	LIST	\N	\N	1
1909	0	NSCLC, anderes: NOS	13	f	t	urn_dktk_code_41	1753	NSCLC, anderes: NOS	LIST	\N	\N	1
1915	0	Gastrointestinale Onkologie	13	f	t	urn_dktk_code_48	1759	Gastrointestinale Onkologie	LIST	\N	\N	1
1921	0	Gastrointestinales Stromasarkom (GIST)	13	f	t	urn_dktk_code_69	1765	Gastrointestinales Stromasarkom (GIST)	LIST	\N	\N	1
1927	0	Gastrointestinal: Plattenepithel-Ca	13	f	t	urn_dktk_code_55	1771	Gastrointestinal: Plattenepithel-Ca	LIST	\N	\N	1
1933	0	Ösophagus: Adeno-Ca	13	f	t	urn_dktk_code_49	1777	Ösophagus: Adeno-Ca	LIST	\N	\N	1
1939	0	Gliom - Grad II	13	f	t	urn_dktk_code_4	1783	Gliom - Grad II	LIST	\N	\N	1
1945	0	Neuroektodermaler Tumor - Grad IV	13	f	t	urn_dktk_code_16	1789	Neuroektodermaler Tumor - Grad IV	LIST	\N	\N	1
1951	0	Neuroepitheliomatöse Neoplasie - Grad II	13	f	t	urn_dktk_code_10	1795	Neuroepitheliomatöse Neoplasie - Grad II	LIST	\N	\N	1
1957	0	Larynx - Subglottis: Plattenepithel-Ca	13	f	t	urn_dktk_code_30	1801	Larynx - Subglottis: Plattenepithel-Ca	LIST	\N	\N	1
1963	0	Nasopharynx: Plattenepithel-Ca	13	f	t	urn_dktk_code_24	1807	Nasopharynx: Plattenepithel-Ca	LIST	\N	\N	1
1969	0	Mundhöhle: Plattenepithel-Ca	13	f	t	urn_dktk_code_21	1813	Mundhöhle: Plattenepithel-Ca	LIST	\N	\N	1
1778	0	Entspricht dem Datum, an welchem dieser Verlauf dokumentiert wurde	13	f	t	urn_dktk_dataelement_47	\N	Datum des letztbekannten Verlaufs	DATE	\N	MM.yyyy	3
1784	0	Wann wurde die Probe entnommen (Entnahme-/Eingangsdatum)	14	f	t	urn_dktk_dataelement_49	\N	Entnahmedatum	DATE	\N	dd.MM.yyyy	4
1790	0	Retinoblastom	13	f	t	urn_dktk_code_172	1634	Retinoblastom	LIST	\N	\N	1
1796	0	Hepatoblastom	13	f	t	urn_dktk_code_167	1640	Hepatoblastom	LIST	\N	\N	1
1802	0	Dottersack-Ca	13	f	t	urn_dktk_code_178	1646	Dottersack-Ca	LIST	\N	\N	1
1808	0	Lymphatische Leukämie: Burkitt-Leukämie	13	f	t	urn_dktk_code_113	1652	Lymphatische Leukämie: Burkitt-Leukämie	LIST	\N	\N	1
1814	0	Lymphatische Leukämie: Sonstige	13	f	t	urn_dktk_code_115	1658	Lymphatische Leukämie: Sonstige	LIST	\N	\N	1
1820	0	Immunoproliferative Krankheit	13	f	t	urn_dktk_code_139	1664	Immunoproliferative Krankheit	LIST	\N	\N	1
1826	0	Chronische myeloproliferative Erkrankung, andere	13	f	t	urn_dktk_code_122	1670	Chronische myeloproliferative Erkrankung, andere	LIST	\N	\N	1
1832	0	Non-Hodgkin-Lymphom: Anderes kleinzelliges Lymphom	13	f	t	urn_dktk_code_128	1676	Non-Hodgkin-Lymphom: Anderes kleinzelliges Lymphom	LIST	\N	\N	1
1838	0	Plattenepithel-Ca	13	f	t	urn_dktk_code_104	1682	Plattenepithel-Ca	LIST	\N	\N	1
1844	0	Kutanes Sarkom	13	f	t	urn_dktk_code_107	1688	Kutanes Sarkom	LIST	\N	\N	1
1850	0	Perizyt. Weichteilsarkom - unsicheren Verhaltens	13	f	t	urn_dktk_code_155	1694	Perizyt. Weichteilsarkom - unsicheren Verhaltens	LIST	\N	\N	1
1856	0	Sonstiges Weichteilsark. (unklare Diff.) - unsicheren Verhaltens	13	f	t	urn_dktk_code_165	1700	Sonstiges Weichteilsark. (unklare Diff.) - unsicheren Verhaltens	LIST	\N	\N	1
1862	0	Vask. Weichteilsarkom - unsicheren Verhaltens	13	f	t	urn_dktk_code_159	1706	Vask. Weichteilsarkom - unsicheren Verhaltens	LIST	\N	\N	1
1868	0	Adipozytäres Weichteilsarkom	13	f	t	urn_dktk_code_145	1712	Adipozytäres Weichteilsarkom	LIST	\N	\N	1
1874	0	Hoden-Ca: Nicht-germinaler Hodentumor	13	f	t	urn_dktk_code_89	1718	Hoden-Ca: Nicht-germinaler Hodentumor	LIST	\N	\N	1
1880	0	Nierenzell-Ca: klarzellig	13	f	t	urn_dktk_code_91	1724	Nierenzell-Ca: klarzellig	LIST	\N	\N	1
1886	0	Harnblasen-Ca, anderes	13	f	t	urn_dktk_code_98	1730	Harnblasen-Ca, anderes	LIST	\N	\N	1
1892	0	Uterussarkom	13	f	t	urn_dktk_code_80	1736	Uterussarkom	LIST	\N	\N	1
1898	0	Zervix-Ca	13	f	t	urn_dktk_code_76	1742	Zervix-Ca	LIST	\N	\N	1
1904	0	NSCLC, anderes: adenosquamöses Ca	13	f	t	urn_dktk_code_37	1748	NSCLC, anderes: adenosquamöses Ca	LIST	\N	\N	1
1910	0	NSCLC, anderes: Speicheldrüsen-ähnliches Ca	13	f	t	urn_dktk_code_40	1754	NSCLC, anderes: Speicheldrüsen-ähnliches Ca	LIST	\N	\N	1
1916	0	Pankreas, anderes	13	f	t	urn_dktk_code_64	1760	Pankreas, anderes	LIST	\N	\N	1
1922	0	Neuroendokriner Tumor (NET) - Grad II	13	f	t	urn_dktk_code_66	1766	Neuroendokriner Tumor (NET) - Grad II	LIST	\N	\N	1
1928	0	Leber: fibrolamelläres Ca	13	f	t	urn_dktk_code_60	1772	Leber: fibrolamelläres Ca	LIST	\N	\N	1
1934	0	Ösophagus: Barrett-Ca	13	f	t	urn_dktk_code_51	1778	Ösophagus: Barrett-Ca	LIST	\N	\N	1
1940	0	Gliom - Grad III	13	f	t	urn_dktk_code_5	1784	Gliom - Grad III	LIST	\N	\N	1
1946	0	Medulloblastom - Grad IV	13	f	t	urn_dktk_code_15	1790	Medulloblastom - Grad IV	LIST	\N	\N	1
1952	0	Neuroepitheliomatöse Neoplasie - Grad I	13	f	t	urn_dktk_code_9	1796	Neuroepitheliomatöse Neoplasie - Grad I	LIST	\N	\N	1
1958	0	Larynx - Andere: Plattenepithel-Ca	13	f	t	urn_dktk_code_31	1802	Larynx - Andere: Plattenepithel-Ca	LIST	\N	\N	1
1964	0	Hypopharynx: Plattenepithel-Ca	13	f	t	urn_dktk_code_25	1808	Hypopharynx: Plattenepithel-Ca	LIST	\N	\N	1
1756	0	Gibt an, ob der Tumor mittels Hormontherapie behandelt wurde	13	f	t	urn_dktk_dataelement_39	1611	Hormontherapie	LIST	BOOLEAN	t|f|true|false	2
1779	0	Entspricht dem Datum, an welchem dieser Verlauf zum Vitalstatus zuletzt dokumentiert wurde	13	f	t	urn_dktk_dataelement_48	\N	Datum des letztbekannten Vitalstatus	DATE	\N	MM.yyyy	3
1785	0	Gibt die Art der Fixierung des Biomaterials an	14	f	t	urn_dktk_dataelement_90	1629	Fixierungsart	LIST	\N	enumerated	1
1791	0	Neuroblastom	13	f	t	urn_dktk_code_173	1635	Neuroblastom	LIST	\N	\N	1
1797	0	Medulloblastom	13	f	t	urn_dktk_code_174	1641	Medulloblastom	LIST	\N	\N	1
1803	0	Embryonal-Ca	13	f	t	urn_dktk_code_179	1647	Embryonal-Ca	LIST	\N	\N	1
1809	0	Lymphatische Leukämie: Akute lymphatische Leukämie	13	f	t	urn_dktk_code_110	1653	Lymphatische Leukämie: Akute lymphatische Leukämie	LIST	\N	\N	1
1815	0	Non-Hodgkin-Lymphom: Burkitt-Lymphom	13	f	t	urn_dktk_code_134	1659	Non-Hodgkin-Lymphom: Burkitt-Lymphom	LIST	\N	\N	1
1821	0	Chronische myeloproliferative Erkrankung: Polycythaemia vera	13	f	t	urn_dktk_code_119	1665	Chronische myeloproliferative Erkrankung: Polycythaemia vera	LIST	\N	\N	1
1827	0	NK-Zell-Leukämie, aggressiv	13	f	t	urn_dktk_code_125	1671	NK-Zell-Leukämie, aggressiv	LIST	\N	\N	1
1833	0	Non-Hodgkin-Lymphom: Reifzelliges T-Zell-Lymphom	13	f	t	urn_dktk_code_131	1677	Non-Hodgkin-Lymphom: Reifzelliges T-Zell-Lymphom	LIST	\N	\N	1
1839	0	Plattenepithel-Ca (in situ)	13	f	t	urn_dktk_code_105	1683	Plattenepithel-Ca (in situ)	LIST	\N	\N	1
1845	0	Malignes Melanom (in situ)	13	f	t	urn_dktk_code_101	1689	Malignes Melanom (in situ)	LIST	\N	\N	1
1851	0	Perizytisches Weichteilsarkom	13	f	t	urn_dktk_code_154	1695	Perizytisches Weichteilsarkom	LIST	\N	\N	1
1857	0	Gliosarkom	13	f	t	urn_dktk_code_164	1701	Gliosarkom	LIST	\N	\N	1
1863	0	Vaskuläres Weichteilsarkom	13	f	t	urn_dktk_code_158	1707	Vaskuläres Weichteilsarkom	LIST	\N	\N	1
1869	0	Adipoz. Weichteilsarkom - unsicheren Verhaltens	13	f	t	urn_dktk_code_146	1713	Adipoz. Weichteilsarkom - unsicheren Verhaltens	LIST	\N	\N	1
1875	0	Hoden-Ca: Nicht-Seminom	13	f	t	urn_dktk_code_88	1719	Hoden-Ca: Nicht-Seminom	LIST	\N	\N	1
1881	0	Hoden-Ca, anderes	13	f	t	urn_dktk_code_90	1725	Hoden-Ca, anderes	LIST	\N	\N	1
1887	0	Prostata-Ca, anderes	13	f	t	urn_dktk_code_85	1731	Prostata-Ca, anderes	LIST	\N	\N	1
1893	0	Weiterer Ovarialtumor	13	f	t	urn_dktk_code_79	1737	Weiterer Ovarialtumor	LIST	\N	\N	1
1899	0	Vaginaltumor	13	f	t	urn_dktk_code_75	1743	Vaginaltumor	LIST	\N	\N	1
1905	0	Malignes Mesotheliom	13	f	t	urn_dktk_code_47	1749	Malignes Mesotheliom	LIST	\N	\N	1
1911	0	SCLC (ohne neuroendokrines Ca)	13	f	t	urn_dktk_code_43	1755	SCLC (ohne neuroendokrines Ca)	LIST	\N	\N	1
1917	0	Neuroendokriner Tumor (NET) - Grad I	13	f	t	urn_dktk_code_65	1761	Neuroendokriner Tumor (NET) - Grad I	LIST	\N	\N	1
1923	0	Neuroendokriner Tumor (NET) - Grad III-IV	13	f	t	urn_dktk_code_67	1767	Neuroendokriner Tumor (NET) - Grad III-IV	LIST	\N	\N	1
1929	0	Leber: CCC	13	f	t	urn_dktk_code_61	1773	Leber: CCC	LIST	\N	\N	1
1935	0	Ösophagus: Plattenepithel-Ca	13	f	t	urn_dktk_code_50	1779	Ösophagus: Plattenepithel-Ca	LIST	\N	\N	1
1941	0	Gliom - Grad I	13	f	t	urn_dktk_code_3	1785	Gliom - Grad I	LIST	\N	\N	1
1947	0	Neoplasie der Meningen - Grad III	13	f	t	urn_dktk_code_14	1791	Neoplasie der Meningen - Grad III	LIST	\N	\N	1
1953	0	Neoplasie des Plexus chorioideus - Grad III	13	f	t	urn_dktk_code_8	1797	Neoplasie des Plexus chorioideus - Grad III	LIST	\N	\N	1
1959	0	Cancer of unknown primary (CUP): Plattenepithel-Ca	13	f	t	urn_dktk_code_32	1803	Cancer of unknown primary (CUP): Plattenepithel-Ca	LIST	\N	\N	1
1965	0	Allgemein Mundhöhle/Rachen: Plattenepithel-Ca	13	f	t	urn_dktk_code_26	1809	Allgemein Mundhöhle/Rachen: Plattenepithel-Ca	LIST	\N	\N	1
1757	0	Gibt an, ob der Tumor mittels Immuntherapie behandelt wurde	13	f	t	urn_dktk_dataelement_38	1612	Immuntherapie	LIST	BOOLEAN	t|f|true|false	2
1761	0	Gibt an, ob eine Knochenmarktransplantation durchgeführt wurde	13	f	t	urn_dktk_dataelement_40	1616	Knochenmarktransplantation	LIST	BOOLEAN	t|f|true|false	2
1762	0	Gibt an, ob der Tumor mittels Chemotherapie behandelt wurde	13	f	t	urn_dktk_dataelement_36	1617	Chemotherapie	LIST	BOOLEAN	t|f|true|false	2
1763	0	Gibt an, ob der Tumor operiert wurde	13	f	t	urn_dktk_dataelement_33	1618	OP	LIST	BOOLEAN	t|f|true|false	2
1764	0	Gibt an, ob der Tumor bestrahlt wurde	13	f	t	urn_dktk_dataelement_34	1619	Strahlentherapie	LIST	BOOLEAN	t|f|true|false	2
1740	0	Das Alter des Patienten zum Zeitpunkt der Erstdiagnose	13	t	t	urn_dktk_dataelement_28	\N	Alter bei Erstdiagnose	LONG	\N		1
1741	0	Gibt das Datum der Feststellung der Fernmetastase an	13	f	t	urn_dktk_dataelement_21	\N	Datum diagnostische Sicherung	DATE	\N	dd.MM.yyyy	3
1726	0	Die zentral generierte DKTK-ID	13	f	t	urn_dktk_dataelement_54	\N	DKTK-ID	STRING	\N		1
1727	0	Das Geburtsdatum des Patienten, falls der Tag oder Monat unbekannt ist 00 einsetzen	13	f	t	urn_dktk_dataelement_26	\N	Geburtsdatum	DATE	\N	dd.MM.yyyy	4
1728	0	Das Geschlecht des Patienten	13	t	t	urn_dktk_dataelement_1	1595	Geschlecht	LIST	\N	enumerated	3
1729	0	Gibt an, ob die Klassifikation durch einen Arzt oder Pathologen erfolgt ist für M	13	f	t	urn_dktk_dataelement_80	1596	c/p/u-Präfix M	LIST	\N	enumerated	1
1730	0	Gibt an, ob Metastasen vorliegen	13	f	t	urn_dktk_dataelement_99	1597	TNM-M	LIST	\N	enumerated	1
1731	0	Gibt an, ob die Klassifikation durch einen Arzt oder Pathologen erfolgt ist für N	13	f	t	urn_dktk_dataelement_79	1598	c/p/u-Präfix N	LIST	\N	enumerated	1
1732	0	Gibt an, ob Lymphknoten befallen sind	13	f	t	urn_dktk_dataelement_101	1599	TNM-N	LIST	\N	enumerated	1
1733	0	Gibt an, ob die Klassifikation durch einen Arzt oder Pathologen erfolgt ist für T	13	f	t	urn_dktk_dataelement_78	1600	c/p/u-Präfix T	LIST	\N	enumerated	1
1734	0	Gibt die Ausdehnung (Ort und Größe) des Primärtumors an	13	f	t	urn_dktk_dataelement_100	1601	TNM-T	LIST	\N	enumerated	1
1735	0	Es handelt sich sinngemäß um das Datum, an welchem der Datensatz zum TNM angelegt wurde und welches auch als auswertungsrelevant anzusehen ist. Es ist i.d.R. mit dem Diagnosedatum identisch bzw. liegt nah zu diesem Datum.	13	f	t	urn_dktk_dataelement_2	\N	Datum der TNM-Dokumentation/Datum Befund	DATE	\N	dd.MM.yyyy	3
1736	0	Gibt an, ob multiple Primärtumoren in einem Bezirk vorliegen	13	f	t	urn_dktk_dataelement_10	\N	TNM-m-Symbol	STRING	\N	m|(\\d*)	2
1737	0	Gibt an, ob es sich bei dem Tumor um ein beurteiltes Rezidiv handelt	13	f	t	urn_dktk_dataelement_81	1602	TNM-r-Symbol	LIST	\N	enumerated	1
1738	0	Katalogversion des TNM	13	f	t	urn_dktk_dataelement_18	\N	TNM-Version	STRING	\N		2
1739	0	Gibt an, wann im Fall multimodaler Therapien mit vielfältigen Behandlungsansätzen die Klassifikation während oder nach diesen Therapien erfolgte	13	f	t	urn_dktk_dataelement_82	1603	TNM-y-Symbol	LIST	\N	enumerated	1
1742	0	Kodierung der Erkrankung/Diagnose des Patienten anhand der aktuellen ICD-Klassifizierung	13	f	t	urn_dktk_dataelement_29	\N	Diagnose	STRING	\N	[CD]\\d\\d(\\.\\d(\\d)?)?	2
1743	0	Gibt an, ob ein positiver Befund von Fernmetastasen vorliegt	13	f	t	urn_dktk_dataelement_77	1604	Fernmetastasen vorhanden	LIST	\N	enumerated	1
1744	0	Gibt die Gesamtbeurteilung (R-Klassifikation global) des zurückgebliebenen Resttumors einschließlich etwaiger Fernmetastasen an	13	f	t	urn_dktk_dataelement_20	1605	Gesamtbeurteilung Resttumor	LIST	\N	enumerated	3
1745	0	Gibt den Differenzierungsgrad des Tumors an	13	f	t	urn_dktk_dataelement_9	1606	Grading	LIST	\N	enumerated	2
1746	0	Katalogversion der ICD	13	f	t	urn_dktk_dataelement_3	\N	ICD-Katalog (Version)	STRING	\N		2
1747	0	Katalogversion der ICD-O	13	f	t	urn_dktk_dataelement_8	\N	ICD-O Katalog Morphologie (Version)	STRING	\N		2
1748	0	Katalogversion der ICD-O	13	f	t	urn_dktk_dataelement_5	\N	ICD-O Katalog Topographie (Version)	STRING	\N		2
1749	0	Gibt die lokale Beurteilung (R-Klassifikation lokal) des zurückgebliebenen Resttumors nach Resektion meist des Primärtumors aber z.B. auch Lebermetastasen an	13	f	t	urn_dktk_dataelement_19	1607	Lokale Beurteilung Resttumor	LIST	\N	enumerated	2
1750	0	Bezeichnung der Topographie einer Erkrankung basierend auf der aktuellen ICD-O-3 Klassifizierung	13	f	t	urn_dktk_dataelement_4	\N	Lokalisation	STRING	\N	C\\d{2}\\.\\d{1,2}	2
1751	0	Gibt die Lokalisation der Fernmetastase an	13	f	t	urn_dktk_dataelement_98	1608	Lokalisation Fernmetastasen	LIST	\N	enumerated	1
1752	0	Gibt an, welche Histologie der Tumor aufweist, basierend auf der aktuellen ICD-O-3 Klassifizierung	13	f	t	urn_dktk_dataelement_7	\N	Morphologie	STRING	\N	\\d\\d\\d\\d/\\d	2
1753	0	Organspezifische Angabe der betroffenen Seite	13	f	t	urn_dktk_dataelement_6	1609	Seitenlokalisation	LIST	\N	enumerated	2
1754	0	Das Datum an dem die meldepflichtige Diagnose erstmals durch einen Arzt klinisch oder mikroskopisch diagnostiziert wurde	13	f	t	urn_dktk_dataelement_83	\N	Tumor Diagnosedatum	DATE	\N	yyyy	3
1755	0	Gibt das Stadium des Tumors (nach "Union internationale contre le cancer") an	13	f	t	urn_dktk_dataelement_89	1610	UICC Stadium	LIST	\N	enumerated	1
1758	0	Gibt die Intention der Chemotherapie an	13	f	t	urn_dktk_dataelement_69	1613	Intention Chemotherapie	LIST	\N	enumerated	2
1759	0	Gibt die Intention der Operation an	13	f	t	urn_dktk_dataelement_23	1614	Intention OP	LIST	\N	enumerated	3
1760	0	Gibt die Intention der Strahlentherapie an	13	f	t	urn_dktk_dataelement_67	1615	Intention Strahlentherapie	LIST	\N	enumerated	2
1765	0	Gibt an, in welchem Bezug zu einer operativen Therapie die Bestrahlung steht	13	f	t	urn_dktk_dataelement_68	1620	Strahlentherapie Stellung zu operativer Therapie	LIST	\N	enumerated	3
1766	0	Gibt an, in welchem Bezug zu einer operativen Therapie die systemische Therapie steht	13	f	t	urn_dktk_dataelement_70	1621	Systemische Therapie Stellung zu operativer Therapie	LIST	\N	enumerated	3
1768	0	Freitextangaben, wenn andere (außer OP, Strahlentherapie, Chemotherapie, Immuntherapie, Hormontherapie und Knochenmarktransplantation) angewendet wurden	13	f	t	urn_dktk_dataelement_71	\N	Sonstige Therapieart	STRING	\N		2
1769	0	Gibt die Gesamtbeurteilung der Erkrankung unter Berücksichtigung aller Manifestationen an	13	f	t	urn_dktk_dataelement_24	1623	Ansprechen Primärtherapie	LIST	\N	enumerated	3
1770	0	Dieses Feld ist notwendig für die korrekte Selektion ggf. mehrerer vorliegender Therapien durch den Standort	13	f	t	urn_dktk_dataelement_25	\N	Datum des ersten Verlaufs	DATE	\N	dd.MM.yyyy	4
1771	0	Entspricht dem Datum, an welchem dieses Ereignis befundet wurde	13	f	t	urn_dktk_dataelement_46	\N	Datum Fernmetastasen	DATE	\N	dd.MM.yyyy	3
1772	0	Entspricht dem Datum, an welchem dieses Ereignis befundet wurde	13	f	t	urn_dktk_dataelement_43	\N	Datum lokales/regionäres Rezidiv	DATE	\N	dd.MM.yyyy	3
1773	0	Entspricht dem Datum, an welchem dieses Ereignis befundet wurde	13	f	t	urn_dktk_dataelement_45	\N	Datum Lymphknoten-Rezidiv	DATE	\N	dd.MM.yyyy	3
1774	0	Beurteilung der Situation im Bereich der Fernmetastasen	13	f	t	urn_dktk_dataelement_74	1624	Fernmetastasen	LIST	\N	enumerated	2
1780	0	Vitalstatus	13	f	t	urn_dktk_dataelement_53	1628	Vitalstatus	LIST	\N	enumerated	3
1792	0	Chondroblastom	13	f	t	urn_dktk_code_170	1636	Chondroblastom	LIST	\N	\N	1
1798	0	Pineoblastom	13	f	t	urn_dktk_code_175	1642	Pineoblastom	LIST	\N	\N	1
1804	0	Chorion-Ca	13	f	t	urn_dktk_code_177	1648	Chorion-Ca	LIST	\N	\N	1
1810	0	Akute Leukämie - gemischter Phänotyp	13	f	t	urn_dktk_code_111	1654	Akute Leukämie - gemischter Phänotyp	LIST	\N	\N	1
1816	0	Non-Hodgkin-Lymphom: Diffus großzelliges Lymphom	13	f	t	urn_dktk_code_135	1660	Non-Hodgkin-Lymphom: Diffus großzelliges Lymphom	LIST	\N	\N	1
1822	0	Myeloische Leukämie: Chronische myeloische Leukämie	13	f	t	urn_dktk_code_118	1666	Myeloische Leukämie: Chronische myeloische Leukämie	LIST	\N	\N	1
1828	0	Multiples Myelom	13	f	t	urn_dktk_code_124	1672	Multiples Myelom	LIST	\N	\N	1
1834	0	Non-Hodgkin-Lymphom: Haarzell-Leukämie	13	f	t	urn_dktk_code_130	1678	Non-Hodgkin-Lymphom: Haarzell-Leukämie	LIST	\N	\N	1
1840	0	Mukosales Melanom	13	f	t	urn_dktk_code_102	1684	Mukosales Melanom	LIST	\N	\N	1
1846	0	Malignes Melanom	13	f	t	urn_dktk_code_100	1690	Malignes Melanom	LIST	\N	\N	1
1852	0	Glattmuskuläres Weichteilsarkom/Leiomyosarkom	13	f	t	urn_dktk_code_153	1696	Glattmuskuläres Weichteilsarkom/Leiomyosarkom	LIST	\N	\N	1
1858	0	Sonstiges Weichteilsarkom (unklare Differenzierung)	13	f	t	urn_dktk_code_163	1702	Sonstiges Weichteilsarkom (unklare Differenzierung)	LIST	\N	\N	1
1864	0	Ewing-Sarkom	13	f	t	urn_dktk_code_141	1708	Ewing-Sarkom	LIST	\N	\N	1
1870	0	Fibroblastisches Weichteilsarkom	13	f	t	urn_dktk_code_147	1714	Fibroblastisches Weichteilsarkom	LIST	\N	\N	1
1876	0	Hoden-Ca: Seminom	13	f	t	urn_dktk_code_87	1720	Hoden-Ca: Seminom	LIST	\N	\N	1
1882	0	Harnblase: Adeno-Ca	13	f	t	urn_dktk_code_97	1726	Harnblase: Adeno-Ca	LIST	\N	\N	1
1888	0	Prostata: Adeno-Ca	13	f	t	urn_dktk_code_84	1732	Prostata: Adeno-Ca	LIST	\N	\N	1
1894	0	Ovarial-Ca	13	f	t	urn_dktk_code_78	1738	Ovarial-Ca	LIST	\N	\N	1
1900	0	Vulva-Ca	13	f	t	urn_dktk_code_74	1744	Vulva-Ca	LIST	\N	\N	1
1906	0	Thymom	13	f	t	urn_dktk_code_46	1750	Thymom	LIST	\N	\N	1
1912	0	NSCLC, anderes: NOS kombiniert	13	f	t	urn_dktk_code_42	1756	NSCLC, anderes: NOS kombiniert	LIST	\N	\N	1
1918	0	Leber/Galle, anderes	13	f	t	urn_dktk_code_62	1762	Leber/Galle, anderes	LIST	\N	\N	1
1924	0	Dünndarm: Adeno-Ca	13	f	t	urn_dktk_code_56	1768	Dünndarm: Adeno-Ca	LIST	\N	\N	1
1930	0	Anal: Adeno-Ca	13	f	t	urn_dktk_code_58	1774	Anal: Adeno-Ca	LIST	\N	\N	1
1936	0	Magen: Adeno-Ca	13	f	t	urn_dktk_code_53	1780	Magen: Adeno-Ca	LIST	\N	\N	1
1942	0	ZNS-Lymphom (diffuses großzelliges B-Zell-Lymphom)	13	f	t	urn_dktk_code_19	1786	ZNS-Lymphom (diffuses großzelliges B-Zell-Lymphom)	LIST	\N	\N	1
1948	0	Tumor der kranialen und spinalen Nerven - Grade II-IV	13	f	t	urn_dktk_code_13	1792	Tumor der kranialen und spinalen Nerven - Grade II-IV	LIST	\N	\N	1
1954	0	Neoplasie des Plexus chorioideus - Grad II	13	f	t	urn_dktk_code_7	1798	Neoplasie des Plexus chorioideus - Grad II	LIST	\N	\N	1
1960	0	Cancer of unknown primary (CUP)-extranodal: Plattenepithel-Ca	13	f	t	urn_dktk_code_33	1804	Cancer of unknown primary (CUP)-extranodal: Plattenepithel-Ca	LIST	\N	\N	1
1966	0	Nasenhöhle, Nasennebenhöhle und Mittelohr: Plattenepithel-Ca	13	f	t	urn_dktk_code_27	1810	Nasenhöhle, Nasennebenhöhle und Mittelohr: Plattenepithel-Ca	LIST	\N	\N	1
1767	0	Gibt an, ob eine abwartende Strategie verfolgt wurde	13	f	t	urn_dktk_dataelement_41	1622	Weitere Therapien	LIST	BOOLEAN	t|f|true|false	3
1786	0	Es sollen nur Patienten angezeigt werden, für die Biomaterial asserviert worden ist	14	f	t	urn_dktk_dataelement_50	1630	Patienten mit Biomaterial	LIST	BOOLEAN	t|f|true|false	2
\.


--ALTER TABLE public.attribute ENABLE TRIGGER ALL;

--
-- Data for Name: entity_type; Type: TABLE DATA; Schema: public; Owner: dktktest
--

--ALTER TABLE public.entity_type DISABLE TRIGGER ALL;

COPY public.entity_type (id, version, key, name, order_, parent_id) FROM stdin;
12	0	patient	Patient	0	\N
13	0	mds_k	Case	1	12
14	0	mds_b	Biomaterial	2	12
\.


--ALTER TABLE public.entity_type ENABLE TRIGGER ALL;

--
-- Data for Name: group_; Type: TABLE DATA; Schema: public; Owner: dktktest
--

--ALTER TABLE public.group_ DISABLE TRIGGER ALL;

COPY public.group_ (id, version, entity_type_id, name, order_) FROM stdin;
34	0	13	TNM	8
26	0	13	Allgemeine Daten	0
31	0	13	Vitalstatus	5
32	0	14	Biomaterial	0
29	0	13	Ansprechen auf Primärtherapie	4
28	0	13	Therapie des Primärtumors	3
27	0	13	Klassifikation von Primärtumoren	2
33	0	13	Tumorentität	1
\.


--ALTER TABLE public.group_ ENABLE TRIGGER ALL;

--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: dktktest
--

--ALTER TABLE public.group_attribute DISABLE TRIGGER ALL;

COPY public.group_attribute (group_id, attribute_id, version, order_) FROM stdin;
26	1728	0	2
27	1740	0	1
27	1742	0	3
27	1743	0	4
27	1745	0	6
27	1749	0	10
27	1750	0	11
27	1751	0	12
27	1752	0	13
27	1753	0	14
27	1754	0	15
27	1755	0	16
28	1756	0	0
28	1757	0	1
28	1761	0	5
28	1762	0	6
29	1769	0	0
29	1774	0	5
29	1775	0	6
29	1776	0	7
31	1780	0	1
32	1785	0	1
32	1786	0	2
32	1787	0	3
32	1788	0	4
28	1764	0	9
28	1763	0	8
33	1938	0	0
33	1956	0	1
33	1901	0	2
33	1915	0	3
33	1891	0	4
33	1873	0	5
33	1837	0	6
33	1806	0	7
33	1847	0	8
33	1789	0	9
33	1799	0	10
34	1734	0	0
34	1733	0	1
34	1732	0	2
34	1731	0	3
34	1730	0	5
34	1729	0	6
34	1736	0	7
34	1739	0	8
34	1737	0	9
\.


--ALTER TABLE public.group_attribute ENABLE TRIGGER ALL;

--
-- Data for Name: list_item; Type: TABLE DATA; Schema: public; Owner: dktktest
--

--ALTER TABLE public.list_item DISABLE TRIGGER ALL;

COPY public.list_item (id, version, key, list_of_values_id, value, description, order_) FROM stdin;
11799	0	t	1616	Ja		0
11800	0	f	1616	Nein		1
11901	0	8960/3	1637	urn:dktk:dataelement:7:2	8960/3	1
11902	0	C64	1637	urn:dktk:dataelement:29:2	C64	0
12031	0	9827/3	1658	urn:dktk:dataelement:7:2	9827/3	2
12032	0	C91.*	1658	urn:dktk:dataelement:29:2	C91.*	0
12033	0	9820/3	1658	urn:dktk:dataelement:7:2	9820/3	1
12034	0	9831/3	1658	urn:dktk:dataelement:7:2	9831/3	3
12171	0	9673/3	1679	urn:dktk:dataelement:7:2	9673/3	1
12172	0	C83.1	1679	urn:dktk:dataelement:29:2	C83.1	0
12410	0	8811/1	1700	urn:dktk:dataelement:7:2	8811/1	2
12411	0	8830/1	1700	urn:dktk:dataelement:7:2	8830/1	3
12412	0	8836/1	1700	urn:dktk:dataelement:7:2	8836/1	4
12413	0	D*	1700	urn:dktk:dataelement:29:2	D*	0
12414	0	8802/1	1700	urn:dktk:dataelement:7:2	8802/1	1
12532	0	9062/3	1720	urn:dktk:dataelement:7:2	9062/3	2
12533	0	C62.*	1720	urn:dktk:dataelement:29:2	C62.*	0
12534	0	9061/3	1720	urn:dktk:dataelement:7:2	9061/3	1
12535	0	9063/3	1720	urn:dktk:dataelement:7:2	9063/3	3
12656	0	8504/2	1739	urn:dktk:dataelement:7:2	8504/2	4
12657	0	8520/2	1739	urn:dktk:dataelement:7:2	8520/2	6
12658	0	8507/2	1739	urn:dktk:dataelement:7:2	8507/2	5
12659	0	D05.*	1739	urn:dktk:dataelement:29:2	D05.*	0
12660	0	8501/2	1739	urn:dktk:dataelement:7:2	8501/2	2
12661	0	8522/2	1739	urn:dktk:dataelement:7:2	8522/2	7
12662	0	8503/2	1739	urn:dktk:dataelement:7:2	8503/2	3
12663	0	8500/2	1739	urn:dktk:dataelement:7:2	8500/2	1
12827	0	8802/3	1757	urn:dktk:dataelement:7:2	8802/3	3
12828	0	C34.*	1757	urn:dktk:dataelement:29:2	C34.*	0
12829	0	8810/3	1757	urn:dktk:dataelement:7:2	8810/3	4
12830	0	8830/3	1757	urn:dktk:dataelement:7:2	8830/3	5
12831	0	8890/3	1757	urn:dktk:dataelement:7:2	8890/3	6
12832	0	C49.3	1757	urn:dktk:dataelement:29:2	C49.3	1
12833	0	8800/3	1757	urn:dktk:dataelement:7:2	8800/3	2
12948	0	C18.*	1771	urn:dktk:dataelement:29:2	C18.*	2
12949	0	C17.*	1771	urn:dktk:dataelement:29:2	C17.*	1
12950	0	C25.*	1771	urn:dktk:dataelement:29:2	C25.*	9
12951	0	8071/3	1771	urn:dktk:dataelement:7:2	8071/3	13
12952	0	C16.*	1771	urn:dktk:dataelement:29:2	C16.*	0
12953	0	C19	1771	urn:dktk:dataelement:29:2	C19	3
12954	0	8070/3	1771	urn:dktk:dataelement:7:2	8070/3	12
12955	0	C24.*	1771	urn:dktk:dataelement:29:2	C24.*	8
12956	0	C23	1771	urn:dktk:dataelement:29:2	C23	7
12957	0	8052/3	1771	urn:dktk:dataelement:7:2	8052/3	11
12958	0	C22.*	1771	urn:dktk:dataelement:29:2	C22.*	6
12959	0	8050/3	1771	urn:dktk:dataelement:7:2	8050/3	10
12960	0	C20	1771	urn:dktk:dataelement:29:2	C20	4
12961	0	C21.*	1771	urn:dktk:dataelement:29:2	C21.*	5
13092	0	9540/3	1792	urn:dktk:dataelement:7:2	9540/3	1
11594	0	W	1595	weiblich	Spezifiziert das Geschlecht als weiblich	0
11596	0	M	1595	männlich	Spezifiziert das Geschlecht als männlich	1
11593	0	S	1595	Sonstiges / intersexuell	Spezfiziert das Geschlecht als sonstiges / intersexuell	2
11595	0	U	1595	unbekannt	Das Geschlecht ist nicht bekannt	3
11597	0	u	1596	Feststellung mit Ultraschall	Feststellung mit Ultraschall (Unterkategorie von c mit besonderer diagnostischer Relevanz, z.B. beim Rektumkarzinom)	2
11598	0	p	1596	Feststellung der Kategorie erfolgte durch eine pathohistologische Untersuchung	Feststellung der Kategorie erfolgte durch eine pathohistologische Untersuchung, mit der auch der höchste Grad der jeweiligen Kategorie hätte festgestellt werden können	1
11599	0		1596	Kategorie wurde durch klinische Angaben festgestellt	Kategorie wurde durch klinische Angaben festgestellt, bzw. erfüllt die Kriterien für p nicht	3
11600	0	c	1596	Kategorie wurde durch klinische Angaben festgestellt	Kategorie wurde durch klinische Angaben festgestellt, bzw. erfüllt die Kriterien für p nicht	0
11801	0	t	1617	Ja		0
11802	0	f	1617	Nein		1
11903	0	8971/3	1638	urn:dktk:dataelement:7:2	8971/3	1
11904	0	C25.*	1638	urn:dktk:dataelement:29:2	C25.*	0
12035	0	C83.7	1659	urn:dktk:dataelement:29:2	C83.7	0
12036	0	9687/3	1659	urn:dktk:dataelement:7:2	9687/3	1
12173	0	9714/3	1680	urn:dktk:dataelement:7:2	9714/3	2
12174	0	C84.6	1680	urn:dktk:dataelement:29:2	C84.6	0
12175	0	C84.7	1680	urn:dktk:dataelement:29:2	C84.7	1
12415	0	C41.*	1701	urn:dktk:dataelement:29:2	C41.*	1
12416	0	9442/3	1701	urn:dktk:dataelement:7:2	9442/3	5
12417	0	C71.*	1701	urn:dktk:dataelement:29:2	C71.*	3
12418	0	C70.*	1701	urn:dktk:dataelement:29:2	C70.*	2
12419	0	C40.*	1701	urn:dktk:dataelement:29:2	C40.*	0
12420	0	C72.*	1701	urn:dktk:dataelement:29:2	C72.*	4
12536	0	8246/3	1721	urn:dktk:dataelement:7:2	8246/3	1
12537	0	C61	1721	urn:dktk:dataelement:29:2	C61	0
12664	0	C50.*	1740	urn:dktk:dataelement:29:2	C50.*	0
12665	0	8513/3	1740	urn:dktk:dataelement:7:2	8513/3	10
12666	0	8503/3	1740	urn:dktk:dataelement:7:2	8503/3	5
12667	0	8521/3	1740	urn:dktk:dataelement:7:2	8521/3	13
12668	0	8525/3	1740	urn:dktk:dataelement:7:2	8525/3	17
12669	0	8522/3	1740	urn:dktk:dataelement:7:2	8522/3	14
12670	0	8542/3	1740	urn:dktk:dataelement:7:2	8542/3	21
12671	0	8510/3	1740	urn:dktk:dataelement:7:2	8510/3	8
12672	0	8524/3	1740	urn:dktk:dataelement:7:2	8524/3	16
12673	0	8140/3	1740	urn:dktk:dataelement:7:2	8140/3	1
12674	0	8523/3	1740	urn:dktk:dataelement:7:2	8523/3	15
12675	0	8514/3	1740	urn:dktk:dataelement:7:2	8514/3	11
12676	0	8500/3	1740	urn:dktk:dataelement:7:2	8500/3	2
12677	0	8530/3	1740	urn:dktk:dataelement:7:2	8530/3	18
12678	0	8541/3	1740	urn:dktk:dataelement:7:2	8541/3	20
12679	0	8501/3	1740	urn:dktk:dataelement:7:2	8501/3	3
12680	0	8520/3	1740	urn:dktk:dataelement:7:2	8520/3	12
12681	0	8504/3	1740	urn:dktk:dataelement:7:2	8504/3	6
12682	0	8512/3	1740	urn:dktk:dataelement:7:2	8512/3	9
12683	0	8502/3	1740	urn:dktk:dataelement:7:2	8502/3	4
12684	0	8540/3	1740	urn:dktk:dataelement:7:2	8540/3	19
12685	0	8543/3	1740	urn:dktk:dataelement:7:2	8543/3	22
12686	0	8508/3	1740	urn:dktk:dataelement:7:2	8508/3	7
12834	0	8249/3	1758	urn:dktk:dataelement:7:2	8249/3	5
12835	0	8246/3	1758	urn:dktk:dataelement:7:2	8246/3	4
12836	0	C34.*	1758	urn:dktk:dataelement:29:2	C34.*	0
12837	0	8013/3	1758	urn:dktk:dataelement:7:2	8013/3	1
12838	0	8240/3	1758	urn:dktk:dataelement:7:2	8240/3	2
12839	0	8244/3	1758	urn:dktk:dataelement:7:2	8244/3	3
12962	0	8171/3	1772	urn:dktk:dataelement:7:2	8171/3	1
12963	0	C22.0	1772	urn:dktk:dataelement:29:2	C22.0	0
13045	0	9391/3	1783	urn:dktk:dataelement:7:2	9391/3	3
13046	0	C71.*	1783	urn:dktk:dataelement:29:2	C71.*	0
13047	0	9400/3	1783	urn:dktk:dataelement:7:2	9400/3	4
13048	0	9425/3	1783	urn:dktk:dataelement:7:2	9425/3	6
13049	0	C72.*	1783	urn:dktk:dataelement:29:2	C72.*	1
13050	0	9382/3	1783	urn:dktk:dataelement:7:2	9382/3	2
13051	0	9424/3	1783	urn:dktk:dataelement:7:2	9424/3	5
13052	0	9450/3	1783	urn:dktk:dataelement:7:2	9450/3	7
13093	0	C72.*	1793	urn:dktk:dataelement:29:2	C72.*	0
13094	0	9571/3	1793	urn:dktk:dataelement:7:2	9571/3	1
13127	0	8070/3	1801	urn:dktk:dataelement:7:2	8070/3	3
13128	0	8071/3	1801	urn:dktk:dataelement:7:2	8071/3	4
13129	0	8050/3	1801	urn:dktk:dataelement:7:2	8050/3	1
13130	0	8052/3	1801	urn:dktk:dataelement:7:2	8052/3	2
13131	0	C32.2	1801	urn:dktk:dataelement:29:2	C32.2	0
13132	0	8072/3	1801	urn:dktk:dataelement:7:2	8072/3	5
13159	0	8140/3	1805	urn:dktk:dataelement:7:2	8140/3	2
13160	0	8200/3	1805	urn:dktk:dataelement:7:2	8200/3	3
13161	0	C07	1805	urn:dktk:dataelement:29:2	C07	0
13179	0	C13.*	1808	urn:dktk:dataelement:29:2	C13.*	0
13180	0	8072/3	1808	urn:dktk:dataelement:7:2	8072/3	5
13181	0	8050/3	1808	urn:dktk:dataelement:7:2	8050/3	1
13182	0	8070/3	1808	urn:dktk:dataelement:7:2	8070/3	3
13195	0	8070/3	1810	urn:dktk:dataelement:7:2	8070/3	4
11803	0	t	1618	Ja		0
11804	0	f	1618	Nein		1
11905	0	C34.*	1639	urn:dktk:dataelement:29:2	C34.*	0
11906	0	8973/3	1639	urn:dktk:dataelement:7:2	8973/3	2
11907	0	8972/3	1639	urn:dktk:dataelement:7:2	8972/3	1
12037	0	9684/3	1660	urn:dktk:dataelement:7:2	9684/3	6
12038	0	9688/3	1660	urn:dktk:dataelement:7:2	9688/3	7
12039	0	C83.3	1660	urn:dktk:dataelement:29:2	C83.3	0
12040	0	9712/3	1660	urn:dktk:dataelement:7:2	9712/3	9
12041	0	C83.8	1660	urn:dktk:dataelement:29:2	C83.8	1
12042	0	C83.9	1660	urn:dktk:dataelement:29:2	C83.9	2
12043	0	9679/3	1660	urn:dktk:dataelement:7:2	9679/3	4
12044	0	9680/3	1660	urn:dktk:dataelement:7:2	9680/3	5
12045	0	9737/3	1660	urn:dktk:dataelement:7:2	9737/3	8
12046	0	9678/3	1660	urn:dktk:dataelement:7:2	9678/3	3
12421	0	8714/3	1702	urn:dktk:dataelement:7:2	8714/3	1
12422	0	8940/3	1702	urn:dktk:dataelement:7:2	8940/3	5
12423	0	9231/3	1702	urn:dktk:dataelement:7:2	9231/3	11
12424	0	8982/3	1702	urn:dktk:dataelement:7:2	8982/3	7
12425	0	8806/3	1702	urn:dktk:dataelement:7:2	8806/3	3
12426	0	9581/3	1702	urn:dktk:dataelement:7:2	9581/3	13
12427	0	8990/3	1702	urn:dktk:dataelement:7:2	8990/3	8
12428	0	9044/3	1702	urn:dktk:dataelement:7:2	9044/3	9
12429	0	9137/3	1702	urn:dktk:dataelement:7:2	9137/3	10
12430	0	9364/3	1702	urn:dktk:dataelement:7:2	9364/3	12
12431	0	C*	1702	urn:dktk:dataelement:29:2	C*	0
12432	0	8963/3	1702	urn:dktk:dataelement:7:2	8963/3	6
12433	0	8804/3	1702	urn:dktk:dataelement:7:2	8804/3	2
12434	0	8842/3	1702	urn:dktk:dataelement:7:2	8842/3	4
12538	0	C64	1722	urn:dktk:dataelement:29:2	C64	0
12539	0	8270/3	1722	urn:dktk:dataelement:7:2	8270/3	1
12540	0	8317/3	1722	urn:dktk:dataelement:7:2	8317/3	2
12687	0	8382/3     	1741	urn:dktk:dataelement:7:2	8382/3     	5
12688	0	8070/3	1741	urn:dktk:dataelement:7:2	8070/3	1
12689	0	8441/3	1741	urn:dktk:dataelement:7:2	8441/3	8
12690	0	8560/3	1741	urn:dktk:dataelement:7:2	8560/3	10
12691	0	8380/3	1741	urn:dktk:dataelement:7:2	8380/3	4
12692	0	8383/3     	1741	urn:dktk:dataelement:7:2	8383/3     	6
12693	0	8140/3	1741	urn:dktk:dataelement:7:2	8140/3	2
12694	0	C54.*	1741	urn:dktk:dataelement:29:2	C54.*	0
12695	0	8570/3	1741	urn:dktk:dataelement:7:2	8570/3	11
12696	0	8310/3	1741	urn:dktk:dataelement:7:2	8310/3	3
12697	0	8480/3	1741	urn:dktk:dataelement:7:2	8480/3	9
12698	0	8430/3	1741	urn:dktk:dataelement:7:2	8430/3	7
12964	0	8161/3	1773	urn:dktk:dataelement:7:2	8161/3	2
11630	0	2(cy-)	1597	2(cy-)	2(cy-)	21
11605	0	2(cy+)	1597	2(cy+)	2(cy+)	22
11624	0	2(mol-)	1597	2(mol-)	2(mol-)	25
11603	0	2(mol+)	1597	2(mol+)	2(mol+)	26
11606	0	2(i-)	1597	2(i-)	2(i-)	23
11601	0	2(i+)	1597	2(i+)	2(i+)	24
11615	0	1e	1597	1e	1e	19
11611	0	1(cy+)	1597	1(cy+)	1(cy+)	10
11614	0	1(mol-)	1597	1(mol-)	1(mol-)	13
11629	0	1(mol+)	1597	1(mol+)	1(mol+)	14
11607	0	0(mol-)	1597	0(mol-)	0(mol-)	6
11608	0	1(i-)	1597	1(i-)	1(i-)	11
11613	0	1(cy-)	1597	1(cy-)	1(cy-)	9
11612	0	1d	1597	1d	1d	18
11626	0	1(i+)	1597	1(i+)	1(i+)	12
11618	0	0(cy-)	1597	0(cy-)	0(cy-)	2
11621	0	0(cy+)	1597	0(cy+)	0(cy+)	3
11623	0	0(mol+)	1597	0(mol+)	0(mol+)	7
11627	0	0(i-)	1597	0(i-)	0(i-)	4
11620	0	0(i+)	1597	0(i+)	0(i+)	5
11616	0	2c	1597	2c	2c	29
11628	0	2b	1597	2b	2b	28
11609	0	2a	1597	2a	2a	27
11625	0	2	1597	2	2	20
11610	0	1c	1597	1c	1c	17
11602	0	1b	1597	1b	1b	16
11617	0	1a	1597	1a	1a	15
11622	0	1	1597	1	1	8
11619	0	0	1597	0	0	1
11604	0	X	1597	X	X	30
11631	0	u	1598	Feststellung mit Ultraschall	Feststellung mit Ultraschall (Unterkategorie von c mit besonderer diagnostischer Relevanz, z.B. beim Rektumkarzinom)	2
11632	0	p	1598	Feststellung der Kategorie erfolgte durch eine pathohistologische Untersuchung	Feststellung der Kategorie erfolgte durch eine pathohistologische Untersuchung, mit der auch der höchste Grad der jeweiligen Kategorie hätte festgestellt werden können	1
11633	0		1598	Kategorie wurde durch klinische Angaben festgestellt	Kategorie wurde durch klinische Angaben festgestellt, bzw. erfüllt die Kriterien für p nicht	3
11634	0	c	1598	Kategorie wurde durch klinische Angaben festgestellt	Kategorie wurde durch klinische Angaben festgestellt, bzw. erfüllt die Kriterien für p nicht	0
11805	0	f	1619	Nein		1
11806	0	t	1619	Ja		0
11908	0	C22.2	1640	urn:dktk:dataelement:29:2	C22.2	0
11909	0	8970/3	1640	urn:dktk:dataelement:7:2	8970/3	1
12047	0	C83.5	1661	urn:dktk:dataelement:29:2	C83.5	0
12048	0	9728/3 	1661	urn:dktk:dataelement:7:2	9728/3 	2
12049	0	9729/3	1661	urn:dktk:dataelement:7:2	9729/3	3
12050	0	9727/3	1661	urn:dktk:dataelement:7:2	9727/3	1
12185	0	C44.*	1682	urn:dktk:dataelement:29:2	C44.*	0
12186	0	8051/3	1682	urn:dktk:dataelement:7:2	8051/3	2
12187	0	8073/3	1682	urn:dktk:dataelement:7:2	8073/3	8
12188	0	8071/3	1682	urn:dktk:dataelement:7:2	8071/3	6
12189	0	8082/3	1682	urn:dktk:dataelement:7:2	8082/3	13
12190	0	8083/3	1682	urn:dktk:dataelement:7:2	8083/3	14
12191	0	8052/3	1682	urn:dktk:dataelement:7:2	8052/3	3
12192	0	8076/3	1682	urn:dktk:dataelement:7:2	8076/3	11
12193	0	8075/3	1682	urn:dktk:dataelement:7:2	8075/3	10
12194	0	8078/3	1682	urn:dktk:dataelement:7:2	8078/3	12
12195	0	8050/3	1682	urn:dktk:dataelement:7:2	8050/3	1
12196	0	8072/3	1682	urn:dktk:dataelement:7:2	8072/3	7
12197	0	8084/3	1682	urn:dktk:dataelement:7:2	8084/3	15
12198	0	8070/6	1682	urn:dktk:dataelement:7:2	8070/6	5
12199	0	8070/3	1682	urn:dktk:dataelement:7:2	8070/3	4
12200	0	8074/3	1682	urn:dktk:dataelement:7:2	8074/3	9
12435	0	8805/3	1703	urn:dktk:dataelement:7:2	8805/3	5
12436	0	C*	1703	urn:dktk:dataelement:29:2	C*	0
12437	0	8803/3	1703	urn:dktk:dataelement:7:2	8803/3	3
12438	0	8801/3	1703	urn:dktk:dataelement:7:2	8801/3	1
12439	0	8802/3	1703	urn:dktk:dataelement:7:2	8802/3	2
12440	0	8804/3	1703	urn:dktk:dataelement:7:2	8804/3	4
12541	0	8260/3	1723	urn:dktk:dataelement:7:2	8260/3	1
12542	0	C64	1723	urn:dktk:dataelement:29:2	C64	0
12699	0	8070/3	1742	urn:dktk:dataelement:7:2	8070/3	3
12700	0	8380/3	1742	urn:dktk:dataelement:7:2	8380/3	10
12701	0	8200/3	1742	urn:dktk:dataelement:7:2	8200/3	8
12702	0	8384/3	1742	urn:dktk:dataelement:7:2	8384/3	11
12703	0	8098/3	1742	urn:dktk:dataelement:7:2	8098/3	6
12704	0	8052/3   	1742	urn:dktk:dataelement:7:2	8052/3   	2
12705	0	8051/3    	1742	urn:dktk:dataelement:7:2	8051/3    	1
12706	0	9110/3       	1742	urn:dktk:dataelement:7:2	9110/3       	18
12707	0	8082/3  	1742	urn:dktk:dataelement:7:2	8082/3  	5
12708	0	8140/3	1742	urn:dktk:dataelement:7:2	8140/3	7
12709	0	8310/3	1742	urn:dktk:dataelement:7:2	8310/3	9
12710	0	8570/3	1742	urn:dktk:dataelement:7:2	8570/3	17
12711	0	8076/3     	1742	urn:dktk:dataelement:7:2	8076/3     	4
12712	0	8441/3	1742	urn:dktk:dataelement:7:2	8441/3	13
12713	0	8560/3	1742	urn:dktk:dataelement:7:2	8560/3	16
12714	0	8480/3	1742	urn:dktk:dataelement:7:2	8480/3	14
12715	0	8430/3	1742	urn:dktk:dataelement:7:2	8430/3	12
12716	0	8490/3   	1742	urn:dktk:dataelement:7:2	8490/3   	15
12717	0	C53.*	1742	urn:dktk:dataelement:29:2	C53.*	0
11807	0	I	1620	intraoperativ	intraoperativ	3
11808	0	A	1620	adjuvant	adjuvant	1
11809	0	N	1620	neoadjuvant	neoadjuvant	2
11810	0	O	1620	ohne Bezug zu einer operativen Therapie	ohne Bezug zu einer operativen Therapie	0
11811	0	S	1620	sonstiges	sonstiges	4
11910	0	C71.6	1641	urn:dktk:dataelement:29:2	C71.6	0
11911	0	9470/3	1641	urn:dktk:dataelement:7:2	9470/3	1
12051	0	9741/3	1662	urn:dktk:dataelement:7:2	9741/3	6
12052	0	C96.2	1662	urn:dktk:dataelement:29:2	C96.2	1
12053	0	D47.0	1662	urn:dktk:dataelement:29:2	D47.0	0
12054	0	9742/3	1662	urn:dktk:dataelement:7:2	9742/3	7
12055	0	9741/1	1662	urn:dktk:dataelement:7:2	9741/1	5
12056	0	C94.3	1662	urn:dktk:dataelement:29:2	C94.3	2
12057	0	9740/1	1662	urn:dktk:dataelement:7:2	9740/1	3
12058	0	9740/3	1662	urn:dktk:dataelement:7:2	9740/3	4
12201	0	8050/2	1683	urn:dktk:dataelement:7:2	8050/2	1
12202	0	8080/2	1683	urn:dktk:dataelement:7:2	8080/2	6
12203	0	8077/2	1683	urn:dktk:dataelement:7:2	8077/2	5
12204	0	8052/2	1683	urn:dktk:dataelement:7:2	8052/2	2
12205	0	8081/2	1683	urn:dktk:dataelement:7:2	8081/2	7
12206	0	D04.*	1683	urn:dktk:dataelement:29:2	D04.*	0
12207	0	8070/2	1683	urn:dktk:dataelement:7:2	8070/2	3
12208	0	8076/2	1683	urn:dktk:dataelement:7:2	8076/2	4
12441	0	D*	1704	urn:dktk:dataelement:29:2	D*	0
12442	0	9560/1	1704	urn:dktk:dataelement:7:2	9560/1	1
12543	0	C64	1724	urn:dktk:dataelement:29:2	C64	0
12544	0	8964/3	1724	urn:dktk:dataelement:7:2	8964/3	2
12545	0	8310/3	1724	urn:dktk:dataelement:7:2	8310/3	1
12718	0	8072/3	1743	urn:dktk:dataelement:7:2	8072/3	3
12719	0	8073/3	1743	urn:dktk:dataelement:7:2	8073/3	4
12720	0	8070/3	1743	urn:dktk:dataelement:7:2	8070/3	1
12721	0	9071/3	1743	urn:dktk:dataelement:7:2	9071/3	13
12722	0	8384/3  	1743	urn:dktk:dataelement:7:2	8384/3  	11
12723	0	8075/3	1743	urn:dktk:dataelement:7:2	8075/3	6
12724	0	8380/3  	1743	urn:dktk:dataelement:7:2	8380/3  	10
12725	0	8310/3  	1743	urn:dktk:dataelement:7:2	8310/3  	9
12726	0	8076/3	1743	urn:dktk:dataelement:7:2	8076/3	7
12727	0	8140/3	1743	urn:dktk:dataelement:7:2	8140/3	8
12728	0	8950/3	1743	urn:dktk:dataelement:7:2	8950/3	12
12729	0	C52	1743	urn:dktk:dataelement:29:2	C52	0
12730	0	8074/3	1743	urn:dktk:dataelement:7:2	8074/3	5
12731	0	8071/3	1743	urn:dktk:dataelement:7:2	8071/3	2
12965	0	8162/3	1773	urn:dktk:dataelement:7:2	8162/3	3
12966	0	C22.1	1773	urn:dktk:dataelement:29:2	C22.1	0
12967	0	8160/3	1773	urn:dktk:dataelement:7:2	8160/3	1
13053	0	9401/3	1784	urn:dktk:dataelement:7:2	9401/3	4
13054	0	9381/3	1784	urn:dktk:dataelement:7:2	9381/3	2
13055	0	9451/3	1784	urn:dktk:dataelement:7:2	9451/3	5
13056	0	9382/3	1784	urn:dktk:dataelement:7:2	9382/3	3
13057	0	C71.*	1784	urn:dktk:dataelement:29:2	C71.*	0
13058	0	C72.*	1784	urn:dktk:dataelement:29:2	C72.*	1
13095	0	C72.*	1794	urn:dktk:dataelement:29:2	C72.*	1
11656	0	2b	1599	2b	2b	12
11643	0	X(sn)	1599	X(sn)	X(sn)	19
11636	0	0	1599	0	0	1
11660	0	2c	1599	2c	2c	13
11658	0	3	1599	3	3	14
11659	0	1	1599	1	1	4
11645	0	3a	1599	3a	3a	15
11647	0	3b	1599	3b	3b	16
11657	0	1a	1599	1a	1a	7
11648	0	1b	1599	1b	1b	8
11644	0	3c	1599	3c	3c	17
11655	0	1c	1599	1c	1c	9
11640	0	1(sn)	1599	1(sn)	1(sn)	6
11637	0	1mi	1599	1mi	1mi	5
11653	0	0(i+)	1599	0(i+)	0(i+)	2
11641	0	0(sn)	1599	0(sn)	0(sn)	3
11661	0	X	1599	X	X	18
11649	0	2	1599	2	2	10
11646	0	2a	1599	2a	2a	11
11662	0	c	1600	Kategorie wurde durch klinische Angaben festgestellt	Kategorie wurde durch klinische Angaben festgestellt, bzw. erfüllt die Kriterien für p nicht	0
11663	0	p	1600	Feststellung der Kategorie erfolgte durch eine pathohistologische Untersuchung	Feststellung der Kategorie erfolgte durch eine pathohistologische Untersuchung, mit der auch der höchste Grad der jewei ligen Kategorie hätte festgestellt werden können	1
11664	0	u	1600	Feststellung mit Ultraschall	Feststellung mit Ultraschall (Unterkategorie von c mit besonderer diagnostischer Relevanz, z.B. beim Rektumkarzinom)	2
11665	0		1600	Kategorie wurde durch klinische Angaben festgestellt	Kategorie wurde durch klinische Angaben festgestellt, bzw. erfüllt die Kriterien für p nicht	3
11812	0	S	1621	sonstiges	sonstiges	4
11813	0	O	1621	ohne Bezug zu einer operativen Therapie	ohne Bezug zu einer operativen Therapie	0
11814	0	N	1621	neoadjuvant	neoadjuvant	2
11815	0	A	1621	adjuvant	adjuvant	1
11816	0	I	1621	intraoperativ	intraoperativ	3
11912	0	9362/3	1642	urn:dktk:dataelement:7:2	9362/3	1
11913	0	C75.3	1642	urn:dktk:dataelement:29:2	C75.3	0
12059	0	C96.4	1663	urn:dktk:dataelement:29:2	C96.4	1
12060	0	C96.5	1663	urn:dktk:dataelement:29:2	C96.5	2
12061	0	C96.8	1663	urn:dktk:dataelement:29:2	C96.8	5
12062	0	C96.0	1663	urn:dktk:dataelement:29:2	C96.0	0
12063	0	9759/3	1663	urn:dktk:dataelement:7:2	9759/3	13
12064	0	9756/3	1663	urn:dktk:dataelement:7:2	9756/3	10
12065	0	C96.7	1663	urn:dktk:dataelement:29:2	C96.7	4
12066	0	9751/3	1663	urn:dktk:dataelement:7:2	9751/3	8
12067	0	9755/3	1663	urn:dktk:dataelement:7:2	9755/3	9
12068	0	C96.9	1663	urn:dktk:dataelement:29:2	C96.9	6
12069	0	9758/3	1663	urn:dktk:dataelement:7:2	9758/3	12
12070	0	9757/3	1663	urn:dktk:dataelement:7:2	9757/3	11
12071	0	C96.6	1663	urn:dktk:dataelement:29:2	C96.6	3
12072	0	9750/3	1663	urn:dktk:dataelement:7:2	9750/3	7
12209	0	C00.*	1684	urn:dktk:dataelement:29:2	C00.*	0
12210	0	C01	1684	urn:dktk:dataelement:29:2	C01	1
12211	0	C63.2	1684	urn:dktk:dataelement:29:2	C63.2	17
12212	0	C52	1684	urn:dktk:dataelement:29:2	C52	14
12213	0	8746/3	1684	urn:dktk:dataelement:7:2	8746/3	20
12214	0	C30.*	1684	urn:dktk:dataelement:29:2	C30.*	10
12215	0	C05.*	1684	urn:dktk:dataelement:29:2	C05.*	5
12216	0	C03.*	1684	urn:dktk:dataelement:29:2	C03.*	3
12217	0	C69.*	1684	urn:dktk:dataelement:29:2	C69.*	18
12218	0	8720/3	1684	urn:dktk:dataelement:7:2	8720/3	19
12219	0	C60.*	1684	urn:dktk:dataelement:29:2	C60.*	16
12220	0	C02.*	1684	urn:dktk:dataelement:29:2	C02.*	2
12221	0	C04.*	1684	urn:dktk:dataelement:29:2	C04.*	4
12222	0	C11.*	1684	urn:dktk:dataelement:29:2	C11.*	8
12223	0	C57.*	1684	urn:dktk:dataelement:29:2	C57.*	15
12224	0	C10.*	1684	urn:dktk:dataelement:29:2	C10.*	7
12225	0	C31.*	1684	urn:dktk:dataelement:29:2	C31.*	11
12226	0	C43.*	1684	urn:dktk:dataelement:29:2	C43.*	12
12227	0	C14.*	1684	urn:dktk:dataelement:29:2	C14.*	9
12228	0	C06.*	1684	urn:dktk:dataelement:29:2	C06.*	6
12229	0	C51.*	1684	urn:dktk:dataelement:29:2	C51.*	13
12443	0	9571/3	1705	urn:dktk:dataelement:7:2	9571/3	7
12444	0	8921/3	1705	urn:dktk:dataelement:7:2	8921/3	2
12445	0	C47.*	1705	urn:dktk:dataelement:29:2	C47.*	0
12446	0	C49.*	1705	urn:dktk:dataelement:29:2	C49.*	1
12447	0	9580/3	1705	urn:dktk:dataelement:7:2	9580/3	6
12448	0	9542/3	1705	urn:dktk:dataelement:7:2	9542/3	4
12449	0	9561/3	1705	urn:dktk:dataelement:7:2	9561/3	5
12450	0	9540/3	1705	urn:dktk:dataelement:7:2	9540/3	3
12546	0	9064/3	1725	urn:dktk:dataelement:7:2	9064/3	1
12547	0	C62.*	1725	urn:dktk:dataelement:29:2	C62.*	0
12548	0	9085/3	1725	urn:dktk:dataelement:7:2	9085/3	2
12732	0	8070/3	1744	urn:dktk:dataelement:7:2	8070/3	1
12733	0	8083/3	1744	urn:dktk:dataelement:7:2	8083/3	8
12734	0	8073/3	1744	urn:dktk:dataelement:7:2	8073/3	4
12735	0	C51.*	1744	urn:dktk:dataelement:29:2	C51.*	0
12736	0	8074/3	1744	urn:dktk:dataelement:7:2	8074/3	5
12737	0	8071/3	1744	urn:dktk:dataelement:7:2	8071/3	2
12738	0	8075/3	1744	urn:dktk:dataelement:7:2	8075/3	6
12739	0	8072/3	1744	urn:dktk:dataelement:7:2	8072/3	3
12740	0	8076/3	1744	urn:dktk:dataelement:7:2	8076/3	7
12862	0	8156/3	1760	urn:dktk:dataelement:7:2	8156/3	8
12863	0	8243/3	1760	urn:dktk:dataelement:7:2	8243/3	11
12864	0	8441/3	1760	urn:dktk:dataelement:7:2	8441/3	12
12865	0	8241/3	1760	urn:dktk:dataelement:7:2	8241/3	10
12866	0	8140/3	1760	urn:dktk:dataelement:7:2	8140/3	1
12867	0	8152/3	1760	urn:dktk:dataelement:7:2	8152/3	4
12868	0	8151/3	1760	urn:dktk:dataelement:7:2	8151/3	3
12869	0	8155/3	1760	urn:dktk:dataelement:7:2	8155/3	7
12870	0	8153/3	1760	urn:dktk:dataelement:7:2	8153/3	5
11692	0	2	1601	2	2	17
11817	0	t	1622	Ja		0
11818	0	f	1622	Nein		1
12073	0	D47.2	1664	urn:dktk:dataelement:29:2	D47.2	1
12074	0	9760/3	1664	urn:dktk:dataelement:7:2	9760/3	2
12075	0	9761/3	1664	urn:dktk:dataelement:7:2	9761/3	3
12076	0	9764/3	1664	urn:dktk:dataelement:7:2	9764/3	5
12077	0	9766/1	1664	urn:dktk:dataelement:7:2	9766/1	7
12078	0	9768/1	1664	urn:dktk:dataelement:7:2	9768/1	9
12079	0	C88.*	1664	urn:dktk:dataelement:29:2	C88.*	0
12080	0	9767/1	1664	urn:dktk:dataelement:7:2	9767/1	8
12081	0	9765/1	1664	urn:dktk:dataelement:7:2	9765/1	6
12082	0	9769/1	1664	urn:dktk:dataelement:7:2	9769/1	10
12083	0	9762/2	1664	urn:dktk:dataelement:7:2	9762/2	4
12230	0	8091/3	1685	urn:dktk:dataelement:7:2	8091/3	2
12231	0	8094/3	1685	urn:dktk:dataelement:7:2	8094/3	5
12232	0	8092/3	1685	urn:dktk:dataelement:7:2	8092/3	3
12233	0	8093/3	1685	urn:dktk:dataelement:7:2	8093/3	4
12234	0	8095/3	1685	urn:dktk:dataelement:7:2	8095/3	6
12235	0	8097/3	1685	urn:dktk:dataelement:7:2	8097/3	7
12236	0	C44.*	1685	urn:dktk:dataelement:29:2	C44.*	0
12237	0	8090/3	1685	urn:dktk:dataelement:7:2	8090/3	1
12238	0	8098/3	1685	urn:dktk:dataelement:7:2	8098/3	8
12451	0	9130/1	1706	urn:dktk:dataelement:7:2	9130/1	1
12452	0	9136/1	1706	urn:dktk:dataelement:7:2	9136/1	3
12453	0	D*	1706	urn:dktk:dataelement:29:2	D*	0
12454	0	9135/1	1706	urn:dktk:dataelement:7:2	9135/1	2
12549	0	8140/3	1726	urn:dktk:dataelement:7:2	8140/3	1
12550	0	C67.*	1726	urn:dktk:dataelement:29:2	C67.*	0
12551	0	8480/3	1726	urn:dktk:dataelement:7:2	8480/3	3
12552	0	8147/3	1726	urn:dktk:dataelement:7:2	8147/3	2
11666	0	4e	1601	4e	4e	34
11703	0	4d	1601	4d	4d	33
11674	0	4c	1601	4c	4c	32
11690	0	4a	1601	4a	4a	31
11678	0	4b	1601	4b	4b	30
11681	0	4	1601	4	4	29
11682	0	3d	1601	3d	3d	28
11670	0	3c	1601	3c	3c	27
11694	0	3b	1601	3b	3b	26
11696	0	3a	1601	3a	3a	25
11667	0	3	1601	3	3	24
11672	0	2d	1601	2d	2d	23
11683	0	2c	1601	2c	2c	22
11689	0	2b	1601	2b	2b	21
11698	0	2a2	1601	2a2	2a2	20
11668	0	2a1	1601	2a1	2a1	19
11702	0	2a	1601	2a	2a	18
11687	0	1d	1601	1d	1d	16
11673	0	1c	1601	1c	1c	15
11695	0	1b2	1601	1b2	1b2	14
11669	0	1b1	1601	1b1	1b1	13
11699	0	1b	1601	1b	1b	12
11691	0	1a2	1601	1a2	1a2	11
11685	0	1a1	1601	1a1	1a1	10
11675	0	1a	1601	1a	1a	9
11693	0	1	1601	1	1	8
11701	0	0	1601	0	0	1
11679	0	is	1601	is	is	2
11686	0	X	1601	X	X	35
11700	0	is(DCIS)	1601	is(DCIS)	is(DCIS)	3
11684	0	is(LCIS)	1601	is(LCIS)	is(LCIS)	4
11688	0	is(Paget)	1601	Tis(Paget)	Tis(Paget)	5
11697	0	is(pu)	1601	is(pu)	is(pu)	7
11680	0	is(pd)	1601	is(pd)	is(pd)	6
11704	0	r	1602	Klassifikation erfolgte zur Beurteilung eines Rezidivs	Klassifikation erfolgte zur Beurteilung eines Rezidivs	0
11705	0		1602	native Klassifikation vor Eintreten eines Rezidivs	native Klassifikation vor Eintreten eines Rezidivs	1
11819	0	T	1623	Teilremission / mindestens 50% Rückgang des Tumors (partial remission, PR)	Teilremission / mindestens 50% Rückgang des Tumors (partial remission, PR)	1
11820	0	R	1623	Vollremission mit residualen Auffälligkeiten (CRr)	Vollremission mit residualen Auffälligkeiten (CRr)	6
11821	0	B	1623	Klinische Besserung des Zustandes, Kriterien für Teilremission jedoch nicht erfüllt (minimal response, MR)	Klinische Besserung des Zustandes, Kriterien für Teilremission jedoch nicht erfüllt (minimal response, MR)	5
11822	0	V	1623	Vollremission (complete remission, CR)	Vollremission (complete remission, CR)	0
11823	0	D	1623	Divergentes Geschehen	Divergentes Geschehen	4
11824	0	U	1623	Beurteilung unmöglich	Beurteilung unmöglich	7
11825	0	K	1623	Keine Änderung (no change, NC), stable disease	Keine Änderung (no change, NC), stable disease	2
11826	0	P	1623	Progression	Progression	3
11827	0	X	1623	Fehlende Angabe	Fehlende Angabe	8
11920	0	9060/3	1644	urn:dktk:dataelement:7:2	9060/3	1
11921	0	9061/3	1644	urn:dktk:dataelement:7:2	9061/3	2
11922	0	9063/3	1644	urn:dktk:dataelement:7:2	9063/3	4
11923	0	9062/3	1644	urn:dktk:dataelement:7:2	9062/3	3
11924	0	C*	1644	urn:dktk:dataelement:29:2	C*	0
11925	0	9064/3	1644	urn:dktk:dataelement:7:2	9064/3	5
11926	0	9065/3	1644	urn:dktk:dataelement:7:2	9065/3	6
12084	0	9950/3	1665	urn:dktk:dataelement:7:2	9950/3	1
12085	0	D45	1665	urn:dktk:dataelement:29:2	D45	0
12239	0	9699/3	1686	urn:dktk:dataelement:7:2	9699/3	9
12240	0	C86.3	1686	urn:dktk:dataelement:29:2	C86.3	4
12241	0	C83.3	1686	urn:dktk:dataelement:29:2	C83.3	1
12242	0	9709/3	1686	urn:dktk:dataelement:7:2	9709/3	12
12243	0	C82.6	1686	urn:dktk:dataelement:29:2	C82.6	0
12244	0	C86.6	1686	urn:dktk:dataelement:29:2	C86.6	5
12245	0	C88.4	1686	urn:dktk:dataelement:29:2	C88.4	6
12246	0	C84.8	1686	urn:dktk:dataelement:29:2	C84.8	3
12247	0	9708/3	1686	urn:dktk:dataelement:7:2	9708/3	11
12248	0	9597/3	1686	urn:dktk:dataelement:7:2	9597/3	7
12249	0	9680/3	1686	urn:dktk:dataelement:7:2	9680/3	8
12250	0	9700/3	1686	urn:dktk:dataelement:7:2	9700/3	10
12251	0	C84.0	1686	urn:dktk:dataelement:29:2	C84.0	2
12252	0	9718/3	1686	urn:dktk:dataelement:7:2	9718/3	13
12455	0	C*	1707	urn:dktk:dataelement:29:2	C*	0
12456	0	9120/3	1707	urn:dktk:dataelement:7:2	9120/3	1
12457	0	9133/3	1707	urn:dktk:dataelement:7:2	9133/3	2
12553	0	C67.*	1727	urn:dktk:dataelement:29:2	C67.*	0
12554	0	8071/3	1727	urn:dktk:dataelement:7:2	8071/3	3
12555	0	8083/3	1727	urn:dktk:dataelement:7:2	8083/3	9
12556	0	8074/3	1727	urn:dktk:dataelement:7:2	8074/3	6
12557	0	8070/3	1727	urn:dktk:dataelement:7:2	8070/3	2
12558	0	8072/3	1727	urn:dktk:dataelement:7:2	8072/3	4
12559	0	8084/3	1727	urn:dktk:dataelement:7:2	8084/3	10
12560	0	8073/3	1727	urn:dktk:dataelement:7:2	8073/3	5
12561	0	8052/3	1727	urn:dktk:dataelement:7:2	8052/3	1
12562	0	8076/3	1727	urn:dktk:dataelement:7:2	8076/3	7
12563	0	8078/3	1727	urn:dktk:dataelement:7:2	8078/3	8
12871	0	8551/3	1760	urn:dktk:dataelement:7:2	8551/3	16
12872	0	8971/3	1760	urn:dktk:dataelement:7:2	8971/3	17
12873	0	C25.*	1760	urn:dktk:dataelement:29:2	C25.*	0
12874	0	8150/3	1760	urn:dktk:dataelement:7:2	8150/3	2
12875	0	8452/3	1760	urn:dktk:dataelement:7:2	8452/3	13
12876	0	8500/3	1760	urn:dktk:dataelement:7:2	8500/3	14
12877	0	8550/3	1760	urn:dktk:dataelement:7:2	8550/3	15
12878	0	8163/3	1760	urn:dktk:dataelement:7:2	8163/3	9
12879	0	8154/3	1760	urn:dktk:dataelement:7:2	8154/3	6
12968	0	8260/3	1774	urn:dktk:dataelement:7:2	8260/3	4
12969	0	8480/3	1774	urn:dktk:dataelement:7:2	8480/3	5
12970	0	8211/3	1774	urn:dktk:dataelement:7:2	8211/3	3
12971	0	C21.*	1774	urn:dktk:dataelement:29:2	C21.*	0
12972	0	8140/3	1774	urn:dktk:dataelement:7:2	8140/3	1
12973	0	8145/3	1774	urn:dktk:dataelement:7:2	8145/3	2
13059	0	9384/1	1785	urn:dktk:dataelement:7:2	9384/1	2
13060	0	D43.*	1785	urn:dktk:dataelement:29:2	D43.*	0
13061	0	9394/1	1785	urn:dktk:dataelement:7:2	9394/1	3
13062	0	9421/1	1785	urn:dktk:dataelement:7:2	9421/1	4
13063	0	9383/1	1785	urn:dktk:dataelement:7:2	9383/1	1
13096	0	9505/3	1794	urn:dktk:dataelement:7:2	9505/3	2
13097	0	C71.*	1794	urn:dktk:dataelement:29:2	C71.*	0
13133	0	8071/3	1802	urn:dktk:dataelement:7:2	8071/3	6
13134	0	8070/3	1802	urn:dktk:dataelement:7:2	8070/3	5
13135	0	C32.9	1802	urn:dktk:dataelement:29:2	C32.9	2
11706	0		1603	native Klassifikation	native Klassifikation	1
11707	0	y	1603	Klassifikation erfolgte während oder nach initialer multimodaler Therapie	Klassifikation erfolgte während oder nach initialer multimodaler Therapie	0
11828	0	R	1624	Neu aufgetretene Fernmetastase(n) bzw. Metastasenrezidiv	Neu aufgetretene Fernmetastase(n) bzw. Metastasenrezidiv	2
11829	0	N	1624	Fernmetastasen No Change	Fernmetastasen No Change	5
11830	0	M	1624	Verbliebene Fernmetastase(n)	Verbliebene Fernmetastase(n)	1
11831	0	T	1624	Fernmetastasenl Residuen	Fernmetastasenl Residuen	3
11832	0	U	1624	Unbekannt	Unbekannt	7
11833	0	K	1624	Keine Fernmetastasen nachweisbar	Keine Fernmetastasen nachweisbar	0
11834	0	X	1624	Fehlende Angabe	Fehlende Angabe	8
11835	0	P	1624	Fernmetastasen Progress	Fernmetastasen Progress	4
11836	0	F	1624	Fraglicher Befund	Fraglicher Befund	6
11927	0	9081/3	1645	urn:dktk:dataelement:7:2	9081/3	2
11928	0	C*	1645	urn:dktk:dataelement:29:2	C*	0
11929	0	9080/3	1645	urn:dktk:dataelement:7:2	9080/3	1
11930	0	9082/3	1645	urn:dktk:dataelement:7:2	9082/3	3
11931	0	9083/3	1645	urn:dktk:dataelement:7:2	9083/3	4
11932	0	9084/3	1645	urn:dktk:dataelement:7:2	9084/3	5
11933	0	9090/3	1645	urn:dktk:dataelement:7:2	9090/3	6
12086	0	9875/3	1666	urn:dktk:dataelement:7:2	9875/3	3
12087	0	9876/3	1666	urn:dktk:dataelement:7:2	9876/3	4
12088	0	9863/3	1666	urn:dktk:dataelement:7:2	9863/3	2
12089	0	C92.1	1666	urn:dktk:dataelement:29:2	C92.1	0
12090	0	C92.2	1666	urn:dktk:dataelement:29:2	C92.2	1
12253	0	8400/3	1687	urn:dktk:dataelement:7:2	8400/3	12
12254	0	8110/3	1687	urn:dktk:dataelement:7:2	8110/3	5
12255	0	8140/3	1687	urn:dktk:dataelement:7:2	8140/3	2
12256	0	8240/3	1687	urn:dktk:dataelement:7:2	8240/3	6
12257	0	8413/3	1687	urn:dktk:dataelement:7:2	8413/3	20
12258	0	8420/3	1687	urn:dktk:dataelement:7:2	8420/3	21
12259	0	8247/3	1687	urn:dktk:dataelement:7:2	8247/3	9
12260	0	8407/3	1687	urn:dktk:dataelement:7:2	8407/3	16
12261	0	8246/3	1687	urn:dktk:dataelement:7:2	8246/3	8
12262	0	8408/3	1687	urn:dktk:dataelement:7:2	8408/3	17
12263	0	8402/3	1687	urn:dktk:dataelement:7:2	8402/3	14
12264	0	8013/3	1687	urn:dktk:dataelement:7:2	8013/3	1
12265	0	8409/3	1687	urn:dktk:dataelement:7:2	8409/3	18
12266	0	8401/3	1687	urn:dktk:dataelement:7:2	8401/3	13
12267	0	8244/3	1687	urn:dktk:dataelement:7:2	8244/3	7
12268	0	8249/3	1687	urn:dktk:dataelement:7:2	8249/3	10
12269	0	8390/3	1687	urn:dktk:dataelement:7:2	8390/3	11
12270	0	8041/3	1687	urn:dktk:dataelement:7:2	8041/3	3
12271	0	C44.*	1687	urn:dktk:dataelement:29:2	C44.*	0
12272	0	8403/3	1687	urn:dktk:dataelement:7:2	8403/3	15
12273	0	8102/3	1687	urn:dktk:dataelement:7:2	8102/3	4
12274	0	8410/3	1687	urn:dktk:dataelement:7:2	8410/3	19
12275	0	8430/3	1687	urn:dktk:dataelement:7:2	8430/3	22
12276	0	8574/3	1687	urn:dktk:dataelement:7:2	8574/3	23
12458	0	C41.*	1708	urn:dktk:dataelement:29:2	C41.*	1
12459	0	C40.*	1708	urn:dktk:dataelement:29:2	C40.*	0
12460	0	9260/3	1708	urn:dktk:dataelement:7:2	9260/3	2
12564	0	C66	1728	urn:dktk:dataelement:29:2	C66	1
12565	0	8120/3	1728	urn:dktk:dataelement:7:2	8120/3	4
12566	0	8130/3	1728	urn:dktk:dataelement:7:2	8130/3	5
12567	0	8131/3	1728	urn:dktk:dataelement:7:2	8131/3	6
12568	0	C68.*	1728	urn:dktk:dataelement:29:2	C68.*	3
12569	0	C67.*	1728	urn:dktk:dataelement:29:2	C67.*	2
12570	0	C65	1728	urn:dktk:dataelement:29:2	C65	0
12754	0	8333/3	1746	urn:dktk:dataelement:7:2	8333/3	12
12755	0	8147/3	1746	urn:dktk:dataelement:7:2	8147/3	4
12756	0	8260/3	1746	urn:dktk:dataelement:7:2	8260/3	10
12757	0	8490/3	1746	urn:dktk:dataelement:7:2	8490/3	15
12758	0	8480/3	1746	urn:dktk:dataelement:7:2	8480/3	14
12759	0	8550/3	1746	urn:dktk:dataelement:7:2	8550/3	16
12760	0	8052/3	1746	urn:dktk:dataelement:7:2	8052/3	17
12761	0	C34.*	1746	urn:dktk:dataelement:29:2	C34.*	0
12762	0	8310/3	1746	urn:dktk:dataelement:7:2	8310/3	11
12763	0	8141/3	1746	urn:dktk:dataelement:7:2	8141/3	2
12764	0	8470/3	1746	urn:dktk:dataelement:7:2	8470/3	13
12765	0	8255/3	1746	urn:dktk:dataelement:7:2	8255/3	9
12766	0	8252/3	1746	urn:dktk:dataelement:7:2	8252/3	7
12767	0	8143/3	1746	urn:dktk:dataelement:7:2	8143/3	3
12768	0	8250/3	1746	urn:dktk:dataelement:7:2	8250/3	5
12769	0	8251/3	1746	urn:dktk:dataelement:7:2	8251/3	6
12770	0	8253/3	1746	urn:dktk:dataelement:7:2	8253/3	8
12771	0	8140/3	1746	urn:dktk:dataelement:7:2	8140/3	1
12880	0	8240/3	1761	urn:dktk:dataelement:7:2	8240/3	1
12881	0	C*	1761	urn:dktk:dataelement:29:2	C*	0
12974	0	8180/3	1775	urn:dktk:dataelement:7:2	8180/3	6
11708	0	nicht erfasst	1604	nicht erfasst	nicht erfasst	0
11709	0	ja	1604	ja	ja	1
11837	0	R	1625	Lokalrezidiv	Lokalrezidiv	4
11838	0	F	1625	Fraglicher Befund	Fraglicher Befund	5
11839	0	T	1625	Tumorreste (Residualtumor)	Tumorreste (Residualtumor)	1
11840	0	P	1625	Tumorreste Residualtumor Progress	Tumorreste Residualtumor Progress	2
11841	0	N	1625	Tumorreste Residualtumor No Change	Tumorreste Residualtumor No Change	3
11842	0	K	1625	Kein Tumor nachweisbar	Kein Tumor nachweisbar	0
11843	0	U	1625	Unbekannt	Unbekannt	6
11844	0	X	1625	Fehlende Angabe	Fehlende Angabe	7
11934	0	C*	1646	urn:dktk:dataelement:29:2	C*	0
11935	0	9071/3	1646	urn:dktk:dataelement:7:2	9071/3	1
12091	0	D47.3	1667	urn:dktk:dataelement:29:2	D47.3	0
12092	0	9962/3	1667	urn:dktk:dataelement:7:2	9962/3	1
12277	0	C46	1688	urn:dktk:dataelement:29:2	C46	1
12278	0	8853/3	1688	urn:dktk:dataelement:7:2	8853/3	14
12279	0	8852/3	1688	urn:dktk:dataelement:7:2	8852/3	13
12280	0	8896/3	1688	urn:dktk:dataelement:7:2	8896/3	23
12281	0	9130/3	1688	urn:dktk:dataelement:7:2	9130/3	25
12282	0	9170/3	1688	urn:dktk:dataelement:7:2	9170/3	26
12283	0	9140/3	1688	urn:dktk:dataelement:7:2	9140/3	27
12284	0	C44.*	1688	urn:dktk:dataelement:29:2	C44.*	0
12285	0	9571/3	1688	urn:dktk:dataelement:7:2	9571/3	31
12286	0	8895/3	1688	urn:dktk:dataelement:7:2	8895/3	22
12287	0	8857/3	1688	urn:dktk:dataelement:7:2	8857/3	17
12288	0	8890/3	1688	urn:dktk:dataelement:7:2	8890/3	19
12289	0	8832/3	1688	urn:dktk:dataelement:7:2	8832/3	9
12290	0	8811/3	1688	urn:dktk:dataelement:7:2	8811/3	7
12291	0	9120/3	1688	urn:dktk:dataelement:7:2	9120/3	24
12292	0	8854/3	1688	urn:dktk:dataelement:7:2	8854/3	15
12293	0	C60.*	1688	urn:dktk:dataelement:29:2	C60.*	3
12294	0	8810/3	1688	urn:dktk:dataelement:7:2	8810/3	6
12295	0	8833/3	1688	urn:dktk:dataelement:7:2	8833/3	10
12296	0	9560/3	1688	urn:dktk:dataelement:7:2	9560/3	29
12297	0	8855/3	1688	urn:dktk:dataelement:7:2	8855/3	16
12298	0	8830/3	1688	urn:dktk:dataelement:7:2	8830/3	8
12299	0	8711/3	1688	urn:dktk:dataelement:7:2	8711/3	5
12300	0	9540/3	1688	urn:dktk:dataelement:7:2	9540/3	28
12301	0	9561/3	1688	urn:dktk:dataelement:7:2	9561/3	30
12302	0	8894/3	1688	urn:dktk:dataelement:7:2	8894/3	21
12303	0	C63.2	1688	urn:dktk:dataelement:29:2	C63.2	4
12304	0	8858/3	1688	urn:dktk:dataelement:7:2	8858/3	18
12305	0	8851/3	1688	urn:dktk:dataelement:7:2	8851/3	12
12306	0	C51.*	1688	urn:dktk:dataelement:29:2	C51.*	2
12307	0	8850/3	1688	urn:dktk:dataelement:7:2	8850/3	11
12308	0	8891/3	1688	urn:dktk:dataelement:7:2	8891/3	20
12461	0	C30.*	1709	urn:dktk:dataelement:29:2	C30.*	1
12462	0	C31.*	1709	urn:dktk:dataelement:29:2	C31.*	2
12463	0	9260/3	1709	urn:dktk:dataelement:7:2	9260/3	8
12464	0	C52	1709	urn:dktk:dataelement:29:2	C52	5
12465	0	C25.*	1709	urn:dktk:dataelement:29:2	C25.*	0
12466	0	C72.*	1709	urn:dktk:dataelement:29:2	C72.*	7
12467	0	C49.*	1709	urn:dktk:dataelement:29:2	C49.*	3
12468	0	C71.*	1709	urn:dktk:dataelement:29:2	C71.*	6
12469	0	9473/3	1709	urn:dktk:dataelement:7:2	9473/3	9
12470	0	C51.*	1709	urn:dktk:dataelement:29:2	C51.*	4
12571	0	8318/3	1729	urn:dktk:dataelement:7:2	8318/3	5
12572	0	8290/3	1729	urn:dktk:dataelement:7:2	8290/3	2
12573	0	8255/3	1729	urn:dktk:dataelement:7:2	8255/3	1
12574	0	8319/3	1729	urn:dktk:dataelement:7:2	8319/3	6
12575	0	8312/3	1729	urn:dktk:dataelement:7:2	8312/3	3
12576	0	8316/3	1729	urn:dktk:dataelement:7:2	8316/3	4
12577	0	8320/3	1729	urn:dktk:dataelement:7:2	8320/3	7
12578	0	C64	1729	urn:dktk:dataelement:29:2	C64	0
12772	0	8071/3	1747	urn:dktk:dataelement:7:2	8071/3	2
12773	0	C34.*	1747	urn:dktk:dataelement:29:2	C34.*	0
12774	0	8070/3	1747	urn:dktk:dataelement:7:2	8070/3	1
12775	0	8072/3	1747	urn:dktk:dataelement:7:2	8072/3	3
12776	0	8073/3	1747	urn:dktk:dataelement:7:2	8073/3	4
12777	0	8083/3	1747	urn:dktk:dataelement:7:2	8083/3	5
12882	0	8490/3	1762	urn:dktk:dataelement:7:2	8490/3	7
12883	0	8453/3	1762	urn:dktk:dataelement:7:2	8453/3	4
12884	0	8480/3	1762	urn:dktk:dataelement:7:2	8480/3	6
12885	0	C24.*	1762	urn:dktk:dataelement:29:2	C24.*	2
12886	0	C22.*	1762	urn:dktk:dataelement:29:2	C22.*	0
12887	0	8140/3	1762	urn:dktk:dataelement:7:2	8140/3	3
12888	0	8470/3	1762	urn:dktk:dataelement:7:2	8470/3	5
12889	0	C23	1762	urn:dktk:dataelement:29:2	C23	1
12975	0	8175/3	1775	urn:dktk:dataelement:7:2	8175/3	5
12976	0	8172/3	1775	urn:dktk:dataelement:7:2	8172/3	2
12977	0	8173/3	1775	urn:dktk:dataelement:7:2	8173/3	3
11710	0	R1(cy+)	1605	Cytologischer Rest	Cytologischer Rest	4
11711	0	R1	1605	Mikroskopischer Residualtumor	Mikroskopischer Residualtumor	1
11712	0	R2	1605	Makroskopischer Residualtumor	Makroskopischer Residualtumor	2
11713	0	R0	1605	kein Residualtumor	kein Residualtumor	0
11714	0	RX	1605	Vorhandensein von Residualtumor kann nicht beurteilt werden	Vorhandensein von Residualtumor kann nicht beurteilt werden	5
11715	0	R1(is)	1605	In-Situ-Rest	In-Situ-Rest	3
11845	0	T	1626	bekannter Lymphknotenbefall Residuen	bekannter Lymphknotenbefall Residuen	2
11846	0	F	1626	Fraglicher Befund	Fraglicher Befund	5
11847	0	R	1626	Neu aufgetretenes Lymphknotenrezidiv	Neu aufgetretenes Lymphknotenrezidiv	1
11848	0	P	1626	bekannter Lymphknotenbefall Progress	bekannter Lymphknotenbefall Progress	3
11849	0	X	1626	Fehlende Angabe	Fehlende Angabe	7
11850	0	U	1626	Unbekannt	Unbekannt	6
11851	0	K	1626	Kein Lymphknotenbefall nachweisbar	Kein Lymphknotenbefall nachweisbar	0
11852	0	N	1626	bekannter Lymphknotenbefall No Change	bekannter Lymphknotenbefall No Change	4
11936	0	9072/3	1647	urn:dktk:dataelement:7:2	9072/3	2
11937	0	C*	1647	urn:dktk:dataelement:29:2	C*	0
11938	0	9070/3	1647	urn:dktk:dataelement:7:2	9070/3	1
12093	0	D47.4	1668	urn:dktk:dataelement:29:2	D47.4	0
12094	0	9961/3	1668	urn:dktk:dataelement:7:2	9961/3	1
12309	0	D03.*	1689	urn:dktk:dataelement:29:2	D03.*	0
12310	0	C69.*	1689	urn:dktk:dataelement:29:2	C69.*	1
12311	0	8741/2	1689	urn:dktk:dataelement:7:2	8741/2	3
12312	0	8742/2	1689	urn:dktk:dataelement:7:2	8742/2	4
12313	0	8720/2 	1689	urn:dktk:dataelement:7:2	8720/2 	2
12471	0	9180/3	1710	urn:dktk:dataelement:7:2	9180/3	2
12472	0	C40.*	1710	urn:dktk:dataelement:29:2	C40.*	0
12473	0	C41.*	1710	urn:dktk:dataelement:29:2	C41.*	1
12474	0	9240/3	1710	urn:dktk:dataelement:7:2	9240/3	3
12579	0	8050/3	1730	urn:dktk:dataelement:7:2	8050/3	2
12580	0	8560/3	1730	urn:dktk:dataelement:7:2	8560/3	8
12581	0	C67.*	1730	urn:dktk:dataelement:29:2	C67.*	0
12582	0	8075/3	1730	urn:dktk:dataelement:7:2	8075/3	4
12583	0	8310/3	1730	urn:dktk:dataelement:7:2	8310/3	7
12584	0	8051/3	1730	urn:dktk:dataelement:7:2	8051/3	3
12585	0	8082/3	1730	urn:dktk:dataelement:7:2	8082/3	5
12586	0	8090/3	1730	urn:dktk:dataelement:7:2	8090/3	6
12587	0	8041/3	1730	urn:dktk:dataelement:7:2	8041/3	1
12778	0	C34.*	1748	urn:dktk:dataelement:29:2	C34.*	0
12779	0	8560/3	1748	urn:dktk:dataelement:7:2	8560/3	1
12890	0	8453/3	1763	urn:dktk:dataelement:7:2	8453/3	1
12891	0	C25.*	1763	urn:dktk:dataelement:29:2	C25.*	0
12892	0	8470/3	1763	urn:dktk:dataelement:7:2	8470/3	2
12893	0	8490/3	1763	urn:dktk:dataelement:7:2	8490/3	4
12894	0	8480/3	1763	urn:dktk:dataelement:7:2	8480/3	3
12978	0	C22.0	1775	urn:dktk:dataelement:29:2	C22.0	0
12979	0	8170/3	1775	urn:dktk:dataelement:7:2	8170/3	1
12980	0	8174/3	1775	urn:dktk:dataelement:7:2	8174/3	4
13064	0	C83.3	1786	urn:dktk:dataelement:29:2	C83.3	0
13065	0	9680/3	1786	urn:dktk:dataelement:7:2	9680/3	1
13098	0	D43.*	1795	urn:dktk:dataelement:29:2	D43.*	0
13099	0	9506/1	1795	urn:dktk:dataelement:7:2	9506/1	1
13136	0	8072/3	1802	urn:dktk:dataelement:7:2	8072/3	7
13137	0	C32.3	1802	urn:dktk:dataelement:29:2	C32.3	0
13138	0	C32.8	1802	urn:dktk:dataelement:29:2	C32.8	1
13139	0	8050/3	1802	urn:dktk:dataelement:7:2	8050/3	3
13140	0	8052/3	1802	urn:dktk:dataelement:7:2	8052/3	4
13162	0	8072/3	1806	urn:dktk:dataelement:7:2	8072/3	7
13163	0	8070/3	1806	urn:dktk:dataelement:7:2	8070/3	5
13164	0	8071/3	1806	urn:dktk:dataelement:7:2	8071/3	6
13165	0	8050/3	1806	urn:dktk:dataelement:7:2	8050/3	3
13166	0	C10.*	1806	urn:dktk:dataelement:29:2	C10.*	1
13167	0	8052/3	1806	urn:dktk:dataelement:7:2	8052/3	4
13168	0	C09.*	1806	urn:dktk:dataelement:29:2	C09.*	0
13169	0	C12.*	1806	urn:dktk:dataelement:29:2	C12.*	2
13183	0	8050/3	1809	urn:dktk:dataelement:7:2	8050/3	1
13184	0	8070/3	1809	urn:dktk:dataelement:7:2	8070/3	3
13185	0	8072/3	1809	urn:dktk:dataelement:7:2	8072/3	5
13186	0	8052/3	1809	urn:dktk:dataelement:7:2	8052/3	2
13187	0	C14.*	1809	urn:dktk:dataelement:29:2	C14.*	0
13188	0	8071/3	1809	urn:dktk:dataelement:7:2	8071/3	4
13196	0	8070/3	1811	urn:dktk:dataelement:7:2	8070/3	3
13197	0	C32.0	1811	urn:dktk:dataelement:29:2	C32.0	0
13198	0	8071/3	1811	urn:dktk:dataelement:7:2	8071/3	4
13199	0	8050/3	1811	urn:dktk:dataelement:7:2	8050/3	1
13200	0	8052/3	1811	urn:dktk:dataelement:7:2	8052/3	2
13201	0	8072/3	1811	urn:dktk:dataelement:7:2	8072/3	5
13202	0	C32.1	1812	urn:dktk:dataelement:29:2	C32.1	0
13203	0	8052/3	1812	urn:dktk:dataelement:7:2	8052/3	2
11853	0	D	1627	Divergentes Geschehen	Divergentes Geschehen	4
11854	0	R	1627	Vollremission mit residualen Auffälligkeiten (CRr)	Vollremission mit residualen Auffälligkeiten (CRr)	2
11855	0	B	1627	Klinische Besserung des Zustandes, Kriterien für Teilremission jedoch nicht erfüllt (minimal response, MR)	Klinische Besserung des Zustandes, Kriterien für Teilremission jedoch nicht erfüllt (minimal response, MR)	3
11856	0	V	1627	Vollremission (complete remission, CR)	Vollremission (complete remission, CR)	8
11857	0	U	1627	Beurteilung unmöglich	Beurteilung unmöglich	1
11858	0	P	1627	Progression	Progression	5
11859	0	K	1627	Keine Änderung (no change, NC), stable disease	Keine Änderung (no change, NC), stable disease	6
11860	0	T	1627	Teilremission / mindestens 50% Rückgang des Tumors (partial remission, PR)	Teilremission / mindestens 50% Rückgang des Tumors (partial remission, PR)	7
11861	0	X	1627	Fehlende Angabe	Fehlende Angabe	0
11939	0	C*	1648	urn:dktk:dataelement:29:2	C*	0
11940	0	9100/3	1648	urn:dktk:dataelement:7:2	9100/3	1
12095	0	9985/3 	1669	urn:dktk:dataelement:7:2	9985/3 	8
12096	0	C93.3	1669	urn:dktk:dataelement:29:2	C93.3	3
12097	0	9991/3 	1669	urn:dktk:dataelement:7:2	9991/3 	12
12098	0	9987/3	1669	urn:dktk:dataelement:7:2	9987/3	10
12099	0	9989/3 	1669	urn:dktk:dataelement:7:2	9989/3 	11
12100	0	C92.0	1669	urn:dktk:dataelement:29:2	C92.0	1
12101	0	9983/3	1669	urn:dktk:dataelement:7:2	9983/3	6
12102	0	9946/3	1669	urn:dktk:dataelement:7:2	9946/3	15
12103	0	D46.*	1669	urn:dktk:dataelement:29:2	D46.*	0
12104	0	C93.1	1669	urn:dktk:dataelement:29:2	C93.1	2
12105	0	9945/3	1669	urn:dktk:dataelement:7:2	9945/3	14
12106	0	9984/3	1669	urn:dktk:dataelement:7:2	9984/3	7
12107	0	9980/3	1669	urn:dktk:dataelement:7:2	9980/3	4
12108	0	9992/3	1669	urn:dktk:dataelement:7:2	9992/3	13
12109	0	9986/3 	1669	urn:dktk:dataelement:7:2	9986/3 	9
12110	0	9982/3 	1669	urn:dktk:dataelement:7:2	9982/3 	5
12314	0	C63.2	1690	urn:dktk:dataelement:29:2	C63.2	17
12315	0	C52	1690	urn:dktk:dataelement:29:2	C52	14
12316	0	C60.*	1690	urn:dktk:dataelement:29:2	C60.*	16
12317	0	8740/3	1690	urn:dktk:dataelement:7:2	8740/3	23
12318	0	8723/3	1690	urn:dktk:dataelement:7:2	8723/3	21
12319	0	8771/3	1690	urn:dktk:dataelement:7:2	8771/3	31
12320	0	8720/3	1690	urn:dktk:dataelement:7:2	8720/3	18
12321	0	C02.*	1690	urn:dktk:dataelement:29:2	C02.*	2
12322	0	8721/3	1690	urn:dktk:dataelement:7:2	8721/3	19
12323	0	C51.*	1690	urn:dktk:dataelement:29:2	C51.*	13
12324	0	C43.*	1690	urn:dktk:dataelement:29:2	C43.*	12
12325	0	C04.*	1690	urn:dktk:dataelement:29:2	C04.*	4
12326	0	8772/3 	1690	urn:dktk:dataelement:7:2	8772/3 	32
12327	0	C10.*	1690	urn:dktk:dataelement:29:2	C10.*	7
12328	0	8741/3	1690	urn:dktk:dataelement:7:2	8741/3	24
12329	0	8745/3	1690	urn:dktk:dataelement:7:2	8745/3	28
12330	0	C31.*	1690	urn:dktk:dataelement:29:2	C31.*	11
12331	0	C03.*	1690	urn:dktk:dataelement:29:2	C03.*	3
12332	0	8730/3	1690	urn:dktk:dataelement:7:2	8730/3	22
12333	0	8744/3	1690	urn:dktk:dataelement:7:2	8744/3	27
12334	0	8773/3	1690	urn:dktk:dataelement:7:2	8773/3	33
12335	0	8743/3	1690	urn:dktk:dataelement:7:2	8743/3	26
12336	0	8722/3	1690	urn:dktk:dataelement:7:2	8722/3	20
12337	0	8770/3	1690	urn:dktk:dataelement:7:2	8770/3	30
12338	0	C05.*	1690	urn:dktk:dataelement:29:2	C05.*	5
12339	0	8774/3	1690	urn:dktk:dataelement:7:2	8774/3	34
12340	0	C57.*	1690	urn:dktk:dataelement:29:2	C57.*	15
12341	0	8742/3	1690	urn:dktk:dataelement:7:2	8742/3	25
12342	0	C14.*	1690	urn:dktk:dataelement:29:2	C14.*	9
12343	0	C00.*	1690	urn:dktk:dataelement:29:2	C00.*	0
12344	0	C11.*	1690	urn:dktk:dataelement:29:2	C11.*	8
12345	0	8761/3	1690	urn:dktk:dataelement:7:2	8761/3	29
12346	0	C01	1690	urn:dktk:dataelement:29:2	C01	1
12347	0	C30.*	1690	urn:dktk:dataelement:29:2	C30.*	10
12348	0	C06.*	1690	urn:dktk:dataelement:29:2	C06.*	6
12475	0	9140/3	1711	urn:dktk:dataelement:7:2	9140/3	2
11721	0	1	1606	gut differenziert	gut differenziert	1
11725	0	2	1606	mäßig differenziert	mäßig differenziert	2
11723	0	3	1606	schlecht differenziert	schlecht differenziert	3
11717	0	4	1606	undifferenziert	undifferenziert	4
11716	0	X	1606	nicht bestimmbar	nicht bestimmbar	5
11720	0	L	1606	low grade (G1 oder G2)	low grade (G1 oder G2)	6
11718	0	M	1606	intermediate (G2 oder G3)	intermediate (G2 oder G3)	7
11722	0	H	1606	high grade (G3 oder G4)	high grade (G3 oder G4)	8
11724	0	B	1606	Borderline	Borderline	9
11727	0	T	1606	trifft nicht zu	trifft nicht zu	10
11719	0	U	1606	unbekannt	unbekannt	11
11728	0	R1	1607	Mikroskopischer Residualtumor	Mikroskopischer Residualtumor	1
11729	0	R1(cy+)	1607	Cytologischer Rest	Cytologischer Rest	4
11730	0	RX	1607	Vorhandensein von Residualtumor kann nicht beurteilt werden	Vorhandensein von Residualtumor kann nicht beurteilt werden	5
11731	0	R1(is)	1607	In-Situ-Rest	In-Situ-Rest	3
11732	0	R0	1607	kein Residualtumor	kein Residualtumor	0
11733	0	R2	1607	Makroskopischer Residualtumor	Makroskopischer Residualtumor	2
11862	0	lebend	1628	lebend	lebend	0
11863	0	verstorben	1628	verstorben	verstorben	1
11941	0	9101/3	1649	urn:dktk:dataelement:7:2	9101/3	2
11942	0	9105/3	1649	urn:dktk:dataelement:7:2	9105/3	4
11943	0	9085/3	1649	urn:dktk:dataelement:7:2	9085/3	1
11944	0	9102/3	1649	urn:dktk:dataelement:7:2	9102/3	3
11945	0	C*	1649	urn:dktk:dataelement:29:2	C*	0
12111	0	9965/3	1670	urn:dktk:dataelement:7:2	9965/3	5
12112	0	9964/3	1670	urn:dktk:dataelement:7:2	9964/3	4
12113	0	9960/3	1670	urn:dktk:dataelement:7:2	9960/3	2
12114	0	9966/3	1670	urn:dktk:dataelement:7:2	9966/3	6
12115	0	9967/3	1670	urn:dktk:dataelement:7:2	9967/3	7
12116	0	9963/3	1670	urn:dktk:dataelement:7:2	9963/3	3
12117	0	D47.1	1670	urn:dktk:dataelement:29:2	D47.1	0
12118	0	D47.5	1670	urn:dktk:dataelement:29:2	D47.5	1
12476	0	C44.*	1711	urn:dktk:dataelement:29:2	C44.*	0
12477	0	C46.*	1711	urn:dktk:dataelement:29:2	C46.*	1
12588	0	8041/3	1731	urn:dktk:dataelement:7:2	8041/3	2
12589	0	8070/3	1731	urn:dktk:dataelement:7:2	8070/3	3
12590	0	C61	1731	urn:dktk:dataelement:29:2	C61	0
12591	0	8020/3	1731	urn:dktk:dataelement:7:2	8020/3	1
12780	0	9050/3	1749	urn:dktk:dataelement:7:2	9050/3	1
12781	0	C45.0	1749	urn:dktk:dataelement:29:2	C45.0	0
12782	0	9051/3	1749	urn:dktk:dataelement:7:2	9051/3	2
12783	0	9053/3 	1749	urn:dktk:dataelement:7:2	9053/3 	4
12784	0	9052/3	1749	urn:dktk:dataelement:7:2	9052/3	3
12895	0	8244/3	1764	urn:dktk:dataelement:7:2	8244/3	0
12981	0	9699/3	1776	urn:dktk:dataelement:7:2	9699/3	1
12982	0	C88.4	1776	urn:dktk:dataelement:29:2	C88.4	0
13066	0	C40.*	1787	urn:dktk:dataelement:29:2	C40.*	0
13067	0	C41.*	1787	urn:dktk:dataelement:29:2	C41.*	1
13068	0	9442/3	1787	urn:dktk:dataelement:7:2	9442/3	5
13069	0	C70.*	1787	urn:dktk:dataelement:29:2	C70.*	2
13070	0	C71.*	1787	urn:dktk:dataelement:29:2	C71.*	3
11734	0	OTH	1608	Andere Organe	Andere Organe	2
11735	0	PER	1608	Peritoneum	Peritoneum	5
11736	0	GEN	1608	Generalisierte Metastasierung	Generalisierte Metastasierung	1
11737	0	MAR	1608	Knochenmark	Knochenmark	7
11738	0	LYM	1608	Lymphknoten	Lymphknoten	8
11739	0	PLE	1608	Pleura	Pleura	6
11740	0	SPL	1608	Milz	Milz	0
11741	0	OSS	1608	Knochen	Knochen	11
11742	0	BRA	1608	Hirn	Hirn	9
11743	0	HEP	1608	Leber	Leber	10
11744	0	PUL	1608	Lunge	Lunge	12
11745	0	SKI	1608	Haut	Haut	3
11746	0	ADR	1608	Nebennieren	Nebennieren	4
11864	0	Kryo/Frisch (FF)	1629	Kryo/Frisch (FF)	Kryo/Frisch (FF)	1
11865	0	Paraffin (FFPE)	1629	Paraffin (FFPE)	Paraffin (FFPE)	0
12119	0	9948/3	1671	urn:dktk:dataelement:7:2	9948/3	1
12120	0	C94.7	1671	urn:dktk:dataelement:29:2	C94.7	0
12374	0	9043/3	1692	urn:dktk:dataelement:7:2	9043/3	3
12375	0	C*	1692	urn:dktk:dataelement:29:2	C*	0
12376	0	9041/3	1692	urn:dktk:dataelement:7:2	9041/3	2
12377	0	9040/3	1692	urn:dktk:dataelement:7:2	9040/3	1
12478	0	8854/3	1712	urn:dktk:dataelement:7:2	8854/3	3
12479	0	8850/3	1712	urn:dktk:dataelement:7:2	8850/3	1
12480	0	8858/3	1712	urn:dktk:dataelement:7:2	8858/3	4
12481	0	C*	1712	urn:dktk:dataelement:29:2	C*	0
12482	0	8852/3	1712	urn:dktk:dataelement:7:2	8852/3	2
12592	0	C61	1732	urn:dktk:dataelement:29:2	C61	0
12593	0	8140/3	1732	urn:dktk:dataelement:7:2	8140/3	1
12594	0	8147/3	1732	urn:dktk:dataelement:7:2	8147/3	2
12595	0	8480/3	1732	urn:dktk:dataelement:7:2	8480/3	3
11867	0	t	1630	Ja		0
11976	0	9823/3	1651	urn:dktk:dataelement:7:2	9823/3	1
11977	0	C91.1	1651	urn:dktk:dataelement:29:2	C91.1	0
12121	0	9732/3	1672	urn:dktk:dataelement:7:2	9732/3	2
12122	0	9734/3	1672	urn:dktk:dataelement:7:2	9734/3	4
12123	0	C90.*	1672	urn:dktk:dataelement:29:2	C90.*	0
12124	0	9735/3	1672	urn:dktk:dataelement:7:2	9735/3	5
12125	0	9731/3	1672	urn:dktk:dataelement:7:2	9731/3	1
12126	0	9733/3	1672	urn:dktk:dataelement:7:2	9733/3	3
12378	0	8902/3	1693	urn:dktk:dataelement:7:2	8902/3	3
12379	0	8900/3	1693	urn:dktk:dataelement:7:2	8900/3	1
12380	0	8910/3	1693	urn:dktk:dataelement:7:2	8910/3	4
12381	0	C*	1693	urn:dktk:dataelement:29:2	C*	0
12382	0	8920/3	1693	urn:dktk:dataelement:7:2	8920/3	6
12383	0	8912/3	1693	urn:dktk:dataelement:7:2	8912/3	5
12384	0	8901/3	1693	urn:dktk:dataelement:7:2	8901/3	2
12483	0	8850/1	1713	urn:dktk:dataelement:7:2	8850/1	1
12484	0	D*	1713	urn:dktk:dataelement:29:2	D*	0
12596	0	8500/3	1732	urn:dktk:dataelement:7:2	8500/3	4
12785	0	8582/3	1750	urn:dktk:dataelement:7:2	8582/3	3
12786	0	C37	1750	urn:dktk:dataelement:29:2	C37	0
12787	0	8580/3	1750	urn:dktk:dataelement:7:2	8580/3	1
12788	0	8584/3	1750	urn:dktk:dataelement:7:2	8584/3	5
12789	0	8586/3	1750	urn:dktk:dataelement:7:2	8586/3	7
12790	0	8581/3	1750	urn:dktk:dataelement:7:2	8581/3	2
12791	0	8583/3	1750	urn:dktk:dataelement:7:2	8583/3	4
12792	0	8585/3	1750	urn:dktk:dataelement:7:2	8585/3	6
12896	0	C20	1765	urn:dktk:dataelement:29:2	C20	5
12897	0	C21.*	1765	urn:dktk:dataelement:29:2	C21.*	6
12898	0	C22.*	1765	urn:dktk:dataelement:29:2	C22.*	7
12899	0	C15.*	1765	urn:dktk:dataelement:29:2	C15.*	0
12900	0	8935/3	1765	urn:dktk:dataelement:7:2	8935/3	11
12901	0	C17.*	1765	urn:dktk:dataelement:29:2	C17.*	2
12902	0	8936/3	1765	urn:dktk:dataelement:7:2	8936/3	12
12903	0	C18.*	1765	urn:dktk:dataelement:29:2	C18.*	3
12904	0	C24.*	1765	urn:dktk:dataelement:29:2	C24.*	9
12905	0	C19	1765	urn:dktk:dataelement:29:2	C19	4
12906	0	C25.*	1765	urn:dktk:dataelement:29:2	C25.*	10
12907	0	C16.*	1765	urn:dktk:dataelement:29:2	C16.*	1
12908	0	C23	1765	urn:dktk:dataelement:29:2	C23	8
12983	0	C15.*	1777	urn:dktk:dataelement:29:2	C15.*	0
12984	0	8140/3	1777	urn:dktk:dataelement:7:2	8140/3	1
12985	0	8260/3	1777	urn:dktk:dataelement:7:2	8260/3	4
12986	0	8430/3	1777	urn:dktk:dataelement:7:2	8430/3	5
12987	0	8480/3	1777	urn:dktk:dataelement:7:2	8480/3	6
12988	0	8211/3	1777	urn:dktk:dataelement:7:2	8211/3	3
12989	0	8200/3	1777	urn:dktk:dataelement:7:2	8200/3	2
12990	0	8560/3	1777	urn:dktk:dataelement:7:2	8560/3	7
13071	0	C72.*	1787	urn:dktk:dataelement:29:2	C72.*	4
13100	0	8680/1	1796	urn:dktk:dataelement:7:2	8680/1	1
13101	0	9509/1	1796	urn:dktk:dataelement:7:2	9509/1	4
13102	0	9505/1	1796	urn:dktk:dataelement:7:2	9505/1	3
13103	0	9412/1	1796	urn:dktk:dataelement:7:2	9412/1	2
13104	0	D43.*	1796	urn:dktk:dataelement:29:2	D43.*	0
13141	0	C77.9	1803	urn:dktk:dataelement:29:2	C77.9	1
13142	0	8052/3	1803	urn:dktk:dataelement:7:2	8052/3	3
13143	0	8071/3	1803	urn:dktk:dataelement:7:2	8071/3	5
13144	0	8050/3	1803	urn:dktk:dataelement:7:2	8050/3	2
13145	0	8072/3	1803	urn:dktk:dataelement:7:2	8072/3	6
13146	0	8070/3	1803	urn:dktk:dataelement:7:2	8070/3	4
13147	0	C77.0	1803	urn:dktk:dataelement:29:2	C77.0	0
13170	0	8071/3	1807	urn:dktk:dataelement:7:2	8071/3	4
13171	0	8072/3	1807	urn:dktk:dataelement:7:2	8072/3	5
13172	0	8052/3	1807	urn:dktk:dataelement:7:2	8052/3	2
13173	0	8050/3	1807	urn:dktk:dataelement:7:2	8050/3	1
13174	0	8082/3	1807	urn:dktk:dataelement:7:2	8082/3	6
13175	0	8070/3	1807	urn:dktk:dataelement:7:2	8070/3	3
13176	0	C11.*	1807	urn:dktk:dataelement:29:2	C11.*	0
13189	0	8050/3	1810	urn:dktk:dataelement:7:2	8050/3	2
13190	0	C30.*	1810	urn:dktk:dataelement:29:2	C30.*	0
13191	0	8052/3	1810	urn:dktk:dataelement:7:2	8052/3	3
13192	0	C31.*	1810	urn:dktk:dataelement:29:2	C31.*	1
13193	0	8071/3	1810	urn:dktk:dataelement:7:2	8071/3	5
13194	0	8072/3	1810	urn:dktk:dataelement:7:2	8072/3	6
11752	0	R	1609	Rechts	Rechts	1
11751	0	M	1609	Mittellinie / Mittig	Mittellinie / Mittig	3
11748	0	T	1609	Trifft nicht zu	Trifft nicht zu, Seitenangabe nicht sinnvoll, einschließlich Systemerkrankungen)	4
11750	0	U	1609	Unbekannt	Unbekannt	5
11868	0	Serum	1631	Serum	Serum	3
11869	0	Urin	1631	Urin	Urin	5
11870	0	Vollblut	1631	Vollblut	Vollblut	2
11871	0	Liquor	1631	Liquor	Liquor	6
11872	0	Protein	1631	Protein	Protein	10
11873	0	Plasma	1631	Plasma	Plasma	4
11874	0	RNA	1631	RNA	RNA	9
11875	0	Normalgewebe	1631	Normalgewebe	Normalgewebe	1
11876	0	Knochenmark	1631	Knochenmark	Knochenmark	7
11877	0	DNA	1631	DNA	DNA	8
11878	0	Tumorgewebe	1631	Tumorgewebe	Tumorgewebe	0
11978	0	9826/3 	1652	urn:dktk:dataelement:7:2	9826/3 	1
11979	0	C91.8	1652	urn:dktk:dataelement:29:2	C91.8	0
12127	0	9698/3	1673	urn:dktk:dataelement:7:2	9698/3	4
12128	0	C82.*	1673	urn:dktk:dataelement:29:2	C82.*	0
12129	0	9690/3	1673	urn:dktk:dataelement:7:2	9690/3	1
12130	0	9695/3	1673	urn:dktk:dataelement:7:2	9695/3	3
12131	0	9691/3	1673	urn:dktk:dataelement:7:2	9691/3	2
12385	0	8711/1	1694	urn:dktk:dataelement:7:2	8711/1	1
12386	0	8824/1	1694	urn:dktk:dataelement:7:2	8824/1	2
12387	0	D*	1694	urn:dktk:dataelement:29:2	D*	0
12485	0	C*	1714	urn:dktk:dataelement:29:2	C*	0
12486	0	8810/3	1714	urn:dktk:dataelement:7:2	8810/3	1
12487	0	8815/3	1714	urn:dktk:dataelement:7:2	8815/3	4
12488	0	8840/3	1714	urn:dktk:dataelement:7:2	8840/3	7
12489	0	8814/3	1714	urn:dktk:dataelement:7:2	8814/3	3
12490	0	8811/3	1714	urn:dktk:dataelement:7:2	8811/3	2
12491	0	8832/3	1714	urn:dktk:dataelement:7:2	8832/3	6
12492	0	8825/3	1714	urn:dktk:dataelement:7:2	8825/3	5
12597	0	8410/3	1733	urn:dktk:dataelement:7:2	8410/3	9
12598	0	8560/3	1733	urn:dktk:dataelement:7:2	8560/3	11
12599	0	8051/3	1733	urn:dktk:dataelement:7:2	8051/3	3
12600	0	8082/3	1733	urn:dktk:dataelement:7:2	8082/3	5
12601	0	8041/3	1733	urn:dktk:dataelement:7:2	8041/3	1
12602	0	8542/3	1733	urn:dktk:dataelement:7:2	8542/3	10
12603	0	8090/3	1733	urn:dktk:dataelement:7:2	8090/3	6
12604	0	8310/3	1733	urn:dktk:dataelement:7:2	8310/3	8
12605	0	8050/3	1733	urn:dktk:dataelement:7:2	8050/3	2
12606	0	8247/3	1733	urn:dktk:dataelement:7:2	8247/3	7
12607	0	8075/3	1733	urn:dktk:dataelement:7:2	8075/3	4
12608	0	C60.*	1733	urn:dktk:dataelement:29:2	C60.*	0
12793	0	8031/3	1751	urn:dktk:dataelement:7:2	8031/3	3
12794	0	8032/3	1751	urn:dktk:dataelement:7:2	8032/3	4
12795	0	8972/3	1751	urn:dktk:dataelement:7:2	8972/3	5
12796	0	8030/3	1751	urn:dktk:dataelement:7:2	8030/3	2
12797	0	8980/3	1751	urn:dktk:dataelement:7:2	8980/3	7
12798	0	8973/3	1751	urn:dktk:dataelement:7:2	8973/3	6
12799	0	C34.*	1751	urn:dktk:dataelement:29:2	C34.*	0
12800	0	8022/3	1751	urn:dktk:dataelement:7:2	8022/3	1
12909	0	8249/3	1766	urn:dktk:dataelement:7:2	8249/3	0
12991	0	C15.5	1778	urn:dktk:dataelement:29:2	C15.5	0
12992	0	8140/3	1778	urn:dktk:dataelement:7:2	8140/3	1
12993	0	8480/3	1778	urn:dktk:dataelement:7:2	8480/3	6
12994	0	8145/3	1778	urn:dktk:dataelement:7:2	8145/3	3
12995	0	8260/3	1778	urn:dktk:dataelement:7:2	8260/3	5
12996	0	8211/3	1778	urn:dktk:dataelement:7:2	8211/3	4
12997	0	8144/3	1778	urn:dktk:dataelement:7:2	8144/3	2
13072	0	C72.*	1788	urn:dktk:dataelement:29:2	C72.*	1
13073	0	9508/3	1788	urn:dktk:dataelement:7:2	9508/3	2
13074	0	C71.*	1788	urn:dktk:dataelement:29:2	C71.*	0
13105	0	9390/3	1797	urn:dktk:dataelement:7:2	9390/3	1
13106	0	C71.*	1797	urn:dktk:dataelement:29:2	C71.*	0
11774	0	0	1610	0	0	1
11760	0	IA	1610	IA	IA	5
11763	0	IA2	1610	IA2	IA2	7
11775	0	0is	1610	0is	0is	3
11773	0	I	1610	I	I	4
11771	0	IA1	1610	IA1	IA1	6
11765	0	IB	1610	IB	IB	8
11767	0	IB1	1610	IB1	IB1	9
11764	0	IB2	1610	IB2	IB2	10
11769	0	IC	1610	IC	IC	11
11753	0	II	1610	II	II	12
11761	0	IIA	1610	IIA	IIA	13
11754	0	IIA1	1610	IIA1	IIA1	14
11779	0	IIA2	1610	IIA2	IIA2	15
11759	0	IIB	1610	IIB	IIB	16
11762	0	IIC	1610	IIC	IIC	17
11770	0	III	1610	III	III	18
11777	0	IIIA	1610	IIIA	IIIA	19
11776	0	IIIB	1610	IIIB	IIIB	20
11772	0	IIIC	1610	IIIC	IIIC	21
11758	0	IIIC2	1610	IIIC2	IIIC2	23
11756	0	IV	1610	IV	IV	24
11768	0	IVA	1610	IVA	IVA	25
11780	0	IVB	1610	IVB	IVB	26
11755	0	IVC	1610	IVC	IVC	27
11781	0	f	1611	Nein		1
11782	0	t	1611	Ja		0
11879	0	Gewebeprobe	1632	Gewebeprobe	Gewebeprobe	1
11880	0	Flüssigprobe	1632	Flüssigprobe	Flüssigprobe	0
11980	0	9812/3	1653	urn:dktk:dataelement:7:2	9812/3	2
11981	0	9814/3 	1653	urn:dktk:dataelement:7:2	9814/3 	4
11982	0	9817/3 	1653	urn:dktk:dataelement:7:2	9817/3 	7
11983	0	9811/3	1653	urn:dktk:dataelement:7:2	9811/3	1
11984	0	9816/3 	1653	urn:dktk:dataelement:7:2	9816/3 	6
11985	0	9815/3 	1653	urn:dktk:dataelement:7:2	9815/3 	5
11986	0	9818/3	1653	urn:dktk:dataelement:7:2	9818/3	8
11987	0	9836/3 	1653	urn:dktk:dataelement:7:2	9836/3 	10
11988	0	9813/3	1653	urn:dktk:dataelement:7:2	9813/3	3
11989	0	9837/3 	1653	urn:dktk:dataelement:7:2	9837/3 	11
11990	0	C91.0	1653	urn:dktk:dataelement:29:2	C91.0	0
11991	0	9835/3	1653	urn:dktk:dataelement:7:2	9835/3	9
12132	0	9663/3	1674	urn:dktk:dataelement:7:2	9663/3	10
12133	0	9662/3	1674	urn:dktk:dataelement:7:2	9662/3	9
12134	0	9664/3	1674	urn:dktk:dataelement:7:2	9664/3	11
12135	0	9665/3	1674	urn:dktk:dataelement:7:2	9665/3	12
12136	0	C81.*	1674	urn:dktk:dataelement:29:2	C81.*	0
12137	0	9651/3	1674	urn:dktk:dataelement:7:2	9651/3	2
12138	0	9655/3	1674	urn:dktk:dataelement:7:2	9655/3	6
12139	0	9654/3	1674	urn:dktk:dataelement:7:2	9654/3	5
12140	0	9653/3	1674	urn:dktk:dataelement:7:2	9653/3	4
12141	0	9659/3	1674	urn:dktk:dataelement:7:2	9659/3	7
12142	0	9667/3	1674	urn:dktk:dataelement:7:2	9667/3	13
12143	0	9650/3	1674	urn:dktk:dataelement:7:2	9650/3	1
12144	0	9661/3	1674	urn:dktk:dataelement:7:2	9661/3	8
12145	0	9652/3	1674	urn:dktk:dataelement:7:2	9652/3	3
12388	0	C*	1695	urn:dktk:dataelement:29:2	C*	0
12389	0	8711/3	1695	urn:dktk:dataelement:7:2	8711/3	1
12493	0	D*	1715	urn:dktk:dataelement:29:2	D*	0
12494	0	8813/1	1715	urn:dktk:dataelement:7:2	8813/1	1
12495	0	8851/1	1715	urn:dktk:dataelement:7:2	8851/1	9
12496	0	8822/1	1715	urn:dktk:dataelement:7:2	8822/1	4
12497	0	8825/1	1715	urn:dktk:dataelement:7:2	8825/1	5
12498	0	8834/1	1715	urn:dktk:dataelement:7:2	8834/1	8
12499	0	8821/1	1715	urn:dktk:dataelement:7:2	8821/1	3
12500	0	8815/1	1715	urn:dktk:dataelement:7:2	8815/1	2
12501	0	8832/1	1715	urn:dktk:dataelement:7:2	8832/1	6
12502	0	8833/1	1715	urn:dktk:dataelement:7:2	8833/1	7
12609	0	8072/3	1734	urn:dktk:dataelement:7:2	8072/3	4
12610	0	8083/3	1734	urn:dktk:dataelement:7:2	8083/3	9
12611	0	8076/3	1734	urn:dktk:dataelement:7:2	8076/3	7
12612	0	8071/3	1734	urn:dktk:dataelement:7:2	8071/3	3
12613	0	8084/3	1734	urn:dktk:dataelement:7:2	8084/3	10
12614	0	8052/3	1734	urn:dktk:dataelement:7:2	8052/3	1
12615	0	8078/3	1734	urn:dktk:dataelement:7:2	8078/3	8
12616	0	8073/3	1734	urn:dktk:dataelement:7:2	8073/3	5
12617	0	C60.*	1734	urn:dktk:dataelement:29:2	C60.*	0
12618	0	8070/3	1734	urn:dktk:dataelement:7:2	8070/3	2
12619	0	8074/3	1734	urn:dktk:dataelement:7:2	8074/3	6
12801	0	8012/3	1752	urn:dktk:dataelement:7:2	8012/3	1
12802	0	8014/3	1752	urn:dktk:dataelement:7:2	8014/3	2
12803	0	C34.*	1752	urn:dktk:dataelement:29:2	C34.*	0
12804	0	8046/3	1752	urn:dktk:dataelement:7:2	8046/3	3
12910	0	8013/3	1767	urn:dktk:dataelement:7:2	8013/3	0
12911	0	8041/3	1767	urn:dktk:dataelement:7:2	8041/3	1
12912	0	8246/3	1767	urn:dktk:dataelement:7:2	8246/3	2
12998	0	8052/3	1779	urn:dktk:dataelement:7:2	8052/3	2
12999	0	8050/3	1779	urn:dktk:dataelement:7:2	8050/3	1
13000	0	8071/3	1779	urn:dktk:dataelement:7:2	8071/3	4
13001	0	C15.*	1779	urn:dktk:dataelement:29:2	C15.*	0
13002	0	8070/3	1779	urn:dktk:dataelement:7:2	8070/3	3
13075	0	C71.*	1789	urn:dktk:dataelement:29:2	C71.*	0
13076	0	9490/3	1789	urn:dktk:dataelement:7:2	9490/3	4
13077	0	9500/3	1789	urn:dktk:dataelement:7:2	9500/3	5
13078	0	9392/3	1789	urn:dktk:dataelement:7:2	9392/3	2
13079	0	9473/3	1789	urn:dktk:dataelement:7:2	9473/3	3
13080	0	C72.*	1789	urn:dktk:dataelement:29:2	C72.*	1
13081	0	9501/3	1789	urn:dktk:dataelement:7:2	9501/3	6
13107	0	9390/1	1798	urn:dktk:dataelement:7:2	9390/1	1
13108	0	D43.*	1798	urn:dktk:dataelement:29:2	D43.*	0
13148	0	8070/3	1804	urn:dktk:dataelement:7:2	8070/3	3
13149	0	8050/3	1804	urn:dktk:dataelement:7:2	8050/3	1
13150	0	8071/3	1804	urn:dktk:dataelement:7:2	8071/3	4
13151	0	8052/3	1804	urn:dktk:dataelement:7:2	8052/3	2
13152	0	8072/3	1804	urn:dktk:dataelement:7:2	8072/3	5
13153	0	C80.9	1804	urn:dktk:dataelement:29:2	C80.9	0
13177	0	8052/3	1808	urn:dktk:dataelement:7:2	8052/3	2
13178	0	8071/3	1808	urn:dktk:dataelement:7:2	8071/3	4
11783	0	t	1612	Ja		0
11784	0	f	1612	Nein		1
11992	0	9807/3	1654	urn:dktk:dataelement:7:2	9807/3	3
11993	0	C95.0	1654	urn:dktk:dataelement:29:2	C95.0	0
11994	0	9805/3	1654	urn:dktk:dataelement:7:2	9805/3	1
11995	0	9808/3	1654	urn:dktk:dataelement:7:2	9808/3	4
11996	0	9809/3 	1654	urn:dktk:dataelement:7:2	9809/3 	5
11997	0	9806/3	1654	urn:dktk:dataelement:7:2	9806/3	2
12146	0	9689/3	1675	urn:dktk:dataelement:7:2	9689/3	1
12147	0	C83.0	1675	urn:dktk:dataelement:29:2	C83.0	0
12148	0	9699/3	1675	urn:dktk:dataelement:7:2	9699/3	2
12390	0	8890/3	1696	urn:dktk:dataelement:7:2	8890/3	1
12391	0	C*	1696	urn:dktk:dataelement:29:2	C*	0
12503	0	C*	1716	urn:dktk:dataelement:29:2	C*	0
12504	0	9252/3	1716	urn:dktk:dataelement:7:2	9252/3	1
12805	0	8230/3	1753	urn:dktk:dataelement:7:2	8230/3	4
12806	0	C34.*	1753	urn:dktk:dataelement:29:2	C34.*	0
12807	0	8082/3	1753	urn:dktk:dataelement:7:2	8082/3	2
12808	0	8123/3	1753	urn:dktk:dataelement:7:2	8123/3	3
12809	0	8310/3	1753	urn:dktk:dataelement:7:2	8310/3	5
12810	0	8010/3	1753	urn:dktk:dataelement:7:2	8010/3	1
12913	0	8221/3	1768	urn:dktk:dataelement:7:2	8221/3	4
12914	0	8245/3	1768	urn:dktk:dataelement:7:2	8245/3	5
12915	0	8262/3	1768	urn:dktk:dataelement:7:2	8262/3	8
12916	0	8261/3	1768	urn:dktk:dataelement:7:2	8261/3	7
12917	0	8263/3	1768	urn:dktk:dataelement:7:2	8263/3	9
12918	0	C17.*	1768	urn:dktk:dataelement:29:2	C17.*	0
12919	0	8211/3	1768	urn:dktk:dataelement:7:2	8211/3	2
12920	0	8480/3	1768	urn:dktk:dataelement:7:2	8480/3	10
12921	0	8215/3	1768	urn:dktk:dataelement:7:2	8215/3	3
12922	0	8490/3	1768	urn:dktk:dataelement:7:2	8490/3	11
12923	0	8260/3	1768	urn:dktk:dataelement:7:2	8260/3	6
12924	0	8140/3	1768	urn:dktk:dataelement:7:2	8140/3	1
13003	0	8140/3	1780	urn:dktk:dataelement:7:2	8140/3	8
13004	0	8144/3	1780	urn:dktk:dataelement:7:2	8144/3	9
13005	0	8145/3	1780	urn:dktk:dataelement:7:2	8145/3	10
13006	0	C16.9	1780	urn:dktk:dataelement:29:2	C16.9	7
13007	0	8211/3	1780	urn:dktk:dataelement:7:2	8211/3	11
13008	0	C16.4	1780	urn:dktk:dataelement:29:2	C16.4	3
13009	0	C16.5	1780	urn:dktk:dataelement:29:2	C16.5	4
13010	0	8260/3	1780	urn:dktk:dataelement:7:2	8260/3	12
13011	0	8480/3	1780	urn:dktk:dataelement:7:2	8480/3	13
13012	0	C16.1	1780	urn:dktk:dataelement:29:2	C16.1	0
13013	0	C16.6	1780	urn:dktk:dataelement:29:2	C16.6	5
13014	0	C16.2	1780	urn:dktk:dataelement:29:2	C16.2	1
13015	0	C16.8	1780	urn:dktk:dataelement:29:2	C16.8	6
13016	0	8490/3	1780	urn:dktk:dataelement:7:2	8490/3	14
13017	0	C16.3	1780	urn:dktk:dataelement:29:2	C16.3	2
13082	0	9474/3	1790	urn:dktk:dataelement:7:2	9474/3	4
13083	0	C72.*	1790	urn:dktk:dataelement:29:2	C72.*	1
13084	0	9471/3	1790	urn:dktk:dataelement:7:2	9471/3	3
13085	0	9470/3	1790	urn:dktk:dataelement:7:2	9470/3	2
13086	0	C71.*	1790	urn:dktk:dataelement:29:2	C71.*	0
13109	0	9440/3	1799	urn:dktk:dataelement:7:2	9440/3	2
13110	0	C71.*	1799	urn:dktk:dataelement:29:2	C71.*	0
13111	0	9442/3	1799	urn:dktk:dataelement:7:2	9442/3	4
13112	0	9441/3	1799	urn:dktk:dataelement:7:2	9441/3	3
13113	0	C72.*	1799	urn:dktk:dataelement:29:2	C72.*	1
13154	0	8260/3	1805	urn:dktk:dataelement:7:2	8260/3	4
13155	0	8330/3	1805	urn:dktk:dataelement:7:2	8330/3	6
13156	0	8340/3	1805	urn:dktk:dataelement:7:2	8340/3	7
13157	0	8290/3	1805	urn:dktk:dataelement:7:2	8290/3	5
11785	0	P	1613	palliativ	palliativ	1
11786	0	X	1613	Keine Angabe	Keine Angabe	3
11787	0	S	1613	sonstiges	sonstiges	2
11788	0	K	1613	kurativ	kurativ	0
11890	0	9513/3	1634	urn:dktk:dataelement:7:2	9513/3	4
11891	0	9511/3	1634	urn:dktk:dataelement:7:2	9511/3	2
11892	0	C69.2	1634	urn:dktk:dataelement:29:2	C69.2	0
11893	0	9512/3	1634	urn:dktk:dataelement:7:2	9512/3	3
11894	0	9510/3	1634	urn:dktk:dataelement:7:2	9510/3	1
11998	0	C93.0	1655	urn:dktk:dataelement:29:2	C93.0	5
11999	0	C94.7	1655	urn:dktk:dataelement:29:2	C94.7	8
12000	0	9895/3 	1655	urn:dktk:dataelement:7:2	9895/3 	20
12001	0	9861/3	1655	urn:dktk:dataelement:7:2	9861/3	10
12002	0	C92.9	1655	urn:dktk:dataelement:29:2	C92.9	4
12003	0	C94.0	1655	urn:dktk:dataelement:29:2	C94.0	6
12004	0	9874/3 	1655	urn:dktk:dataelement:7:2	9874/3 	18
12005	0	9869/3 	1655	urn:dktk:dataelement:7:2	9869/3 	13
12006	0	9870/3 	1655	urn:dktk:dataelement:7:2	9870/3 	14
12007	0	9910/3 	1655	urn:dktk:dataelement:7:2	9910/3 	23
12008	0	C92.8	1655	urn:dktk:dataelement:29:2	C92.8	3
12009	0	9865/3 	1655	urn:dktk:dataelement:7:2	9865/3 	11
12010	0	9872/3	1655	urn:dktk:dataelement:7:2	9872/3	16
12011	0	9897/3 	1655	urn:dktk:dataelement:7:2	9897/3 	22
12012	0	C92.5	1655	urn:dktk:dataelement:29:2	C92.5	1
12013	0	9867/3 	1655	urn:dktk:dataelement:7:2	9867/3 	12
12014	0	9920/3 	1655	urn:dktk:dataelement:7:2	9920/3 	25
12015	0	9911/3 	1655	urn:dktk:dataelement:7:2	9911/3 	24
12016	0	9840/3	1655	urn:dktk:dataelement:7:2	9840/3	9
12017	0	9873/3 	1655	urn:dktk:dataelement:7:2	9873/3 	17
12018	0	9871/3 	1655	urn:dktk:dataelement:7:2	9871/3 	15
12019	0	9891/3 	1655	urn:dktk:dataelement:7:2	9891/3 	19
12020	0	9896/3 	1655	urn:dktk:dataelement:7:2	9896/3 	21
12021	0	C92.0	1655	urn:dktk:dataelement:29:2	C92.0	0
12022	0	C92.6	1655	urn:dktk:dataelement:29:2	C92.6	2
12023	0	C94.2	1655	urn:dktk:dataelement:29:2	C94.2	7
12149	0	9670/3	1676	urn:dktk:dataelement:7:2	9670/3	1
12150	0	9671/3	1676	urn:dktk:dataelement:7:2	9671/3	2
12151	0	C83.0	1676	urn:dktk:dataelement:29:2	C83.0	0
12392	0	8936/1	1697	urn:dktk:dataelement:7:2	8936/1	3
12393	0	D13.*	1697	urn:dktk:dataelement:29:2	D13.*	1
12394	0	D12.*	1697	urn:dktk:dataelement:29:2	D12.*	0
12395	0	D21.*	1697	urn:dktk:dataelement:29:2	D21.*	2
12629	0	8931/3  	1736	urn:dktk:dataelement:7:2	8931/3  	5
12630	0	C54.*	1736	urn:dktk:dataelement:29:2	C54.*	0
12631	0	8933/3	1736	urn:dktk:dataelement:7:2	8933/3	6
12632	0	8950/3	1736	urn:dktk:dataelement:7:2	8950/3	8
12633	0	8805/3 	1736	urn:dktk:dataelement:7:2	8805/3 	2
12634	0	8980/3	1736	urn:dktk:dataelement:7:2	8980/3	9
12635	0	8890/3   	1736	urn:dktk:dataelement:7:2	8890/3   	3
12636	0	8930/3	1736	urn:dktk:dataelement:7:2	8930/3	4
12637	0	8934/3 	1736	urn:dktk:dataelement:7:2	8934/3 	7
12638	0	C55	1736	urn:dktk:dataelement:29:2	C55	1
12811	0	8200/3	1754	urn:dktk:dataelement:7:2	8200/3	1
12812	0	8940/3	1754	urn:dktk:dataelement:7:2	8940/3	5
12813	0	8562/3	1754	urn:dktk:dataelement:7:2	8562/3	4
12814	0	8550/3	1754	urn:dktk:dataelement:7:2	8550/3	3
12815	0	8430/3	1754	urn:dktk:dataelement:7:2	8430/3	2
12816	0	C34.*	1754	urn:dktk:dataelement:29:2	C34.*	0
12925	0	8490/3	1769	urn:dktk:dataelement:7:2	8490/3	13
12926	0	C18.*	1769	urn:dktk:dataelement:29:2	C18.*	0
11789	0	P	1614	palliativ	palliativ	1
11790	0	D	1614	diagnostisch	diagnostisch	2
11791	0	R	1614	Revision/Komplikation	Revision/Komplikation	3
11792	0	S	1614	sonstiges	sonstiges	4
11793	0	X	1614	Fehlende Angabe	Fehlende Angabe	5
11794	0	K	1614	kurativ	kurativ	0
11895	0	9500/3	1635	urn:dktk:dataelement:7:2	9500/3	2
11896	0	C71.*	1635	urn:dktk:dataelement:29:2	C71.*	0
11897	0	C72.*	1635	urn:dktk:dataelement:29:2	C72.*	1
12024	0	9866/3 	1656	urn:dktk:dataelement:7:2	9866/3 	1
12025	0	C92.4	1656	urn:dktk:dataelement:29:2	C92.4	0
12152	0	C84.*	1677	urn:dktk:dataelement:29:2	C84.*	0
12153	0	9719/3	1677	urn:dktk:dataelement:7:2	9719/3	16
12154	0	9718/3	1677	urn:dktk:dataelement:7:2	9718/3	15
12155	0	9701/3	1677	urn:dktk:dataelement:7:2	9701/3	8
12156	0	C86.0	1677	urn:dktk:dataelement:29:2	C86.0	1
12157	0	C86.5	1677	urn:dktk:dataelement:29:2	C86.5	5
12158	0	9700/3	1677	urn:dktk:dataelement:7:2	9700/3	7
12159	0	9705/3	1677	urn:dktk:dataelement:7:2	9705/3	10
12160	0	9708/3	1677	urn:dktk:dataelement:7:2	9708/3	11
12161	0	9716/3	1677	urn:dktk:dataelement:7:2	9716/3	13
12162	0	9717/3	1677	urn:dktk:dataelement:7:2	9717/3	14
12163	0	C86.2	1677	urn:dktk:dataelement:29:2	C86.2	3
12164	0	9709/3	1677	urn:dktk:dataelement:7:2	9709/3	12
12165	0	9702/3	1677	urn:dktk:dataelement:7:2	9702/3	9
12166	0	C86.1	1677	urn:dktk:dataelement:29:2	C86.1	2
12167	0	C86.3	1677	urn:dktk:dataelement:29:2	C86.3	4
12168	0	C86.6	1677	urn:dktk:dataelement:29:2	C86.6	6
12396	0	C22.*	1698	urn:dktk:dataelement:29:2	C22.*	6
12397	0	C25.*	1698	urn:dktk:dataelement:29:2	C25.*	7
12398	0	C20	1698	urn:dktk:dataelement:29:2	C20	5
12399	0	C16.*	1698	urn:dktk:dataelement:29:2	C16.*	1
12400	0	C49.*	1698	urn:dktk:dataelement:29:2	C49.*	8
12401	0	8936/3	1698	urn:dktk:dataelement:7:2	8936/3	9
12402	0	C15.*	1698	urn:dktk:dataelement:29:2	C15.*	0
12403	0	C17.*	1698	urn:dktk:dataelement:29:2	C17.*	2
12404	0	C19	1698	urn:dktk:dataelement:29:2	C19	4
12405	0	C18.*	1698	urn:dktk:dataelement:29:2	C18.*	3
12522	0	8650/3	1718	urn:dktk:dataelement:7:2	8650/3	2
12523	0	8640/3	1718	urn:dktk:dataelement:7:2	8640/3	1
12524	0	C62.*	1718	urn:dktk:dataelement:29:2	C62.*	0
12639	0	8950/3	1737	urn:dktk:dataelement:7:2	8950/3	4
12640	0	8471/3	1737	urn:dktk:dataelement:7:2	8471/3	1
12641	0	8600/3	1737	urn:dktk:dataelement:7:2	8600/3	2
12642	0	C56	1737	urn:dktk:dataelement:29:2	C56	0
12643	0	9090/3	1737	urn:dktk:dataelement:7:2	9090/3	7
12644	0	8620/3	1737	urn:dktk:dataelement:7:2	8620/3	3
12645	0	8951/3	1737	urn:dktk:dataelement:7:2	8951/3	5
12646	0	9000/3	1737	urn:dktk:dataelement:7:2	9000/3	6
12817	0	8041/3	1755	urn:dktk:dataelement:7:2	8041/3	1
12818	0	8045/3	1755	urn:dktk:dataelement:7:2	8045/3	4
12819	0	8043/3	1755	urn:dktk:dataelement:7:2	8043/3	2
12820	0	8073/3	1755	urn:dktk:dataelement:7:2	8073/3	5
12821	0	C34.*	1755	urn:dktk:dataelement:29:2	C34.*	0
12822	0	8044/3	1755	urn:dktk:dataelement:7:2	8044/3	3
12927	0	8215/3	1769	urn:dktk:dataelement:7:2	8215/3	5
12928	0	8263/3	1769	urn:dktk:dataelement:7:2	8263/3	11
12929	0	C20	1769	urn:dktk:dataelement:29:2	C20	2
12930	0	8260/3	1769	urn:dktk:dataelement:7:2	8260/3	8
12931	0	8261/3	1769	urn:dktk:dataelement:7:2	8261/3	9
12932	0	8221/3	1769	urn:dktk:dataelement:7:2	8221/3	6
12933	0	8211/3	1769	urn:dktk:dataelement:7:2	8211/3	4
12934	0	8140/3	1769	urn:dktk:dataelement:7:2	8140/3	3
12935	0	C19	1769	urn:dktk:dataelement:29:2	C19	1
12936	0	8245/3	1769	urn:dktk:dataelement:7:2	8245/3	7
12937	0	8262/3	1769	urn:dktk:dataelement:7:2	8262/3	10
12938	0	8480/3	1769	urn:dktk:dataelement:7:2	8480/3	12
13018	0	8211/3	1781	urn:dktk:dataelement:7:2	8211/3	5
13019	0	8480/3	1781	urn:dktk:dataelement:7:2	8480/3	8
13020	0	8145/3	1781	urn:dktk:dataelement:7:2	8145/3	3
13021	0	8430/3	1781	urn:dktk:dataelement:7:2	8430/3	7
13022	0	C16.0 	1781	urn:dktk:dataelement:29:2	C16.0 	0
13023	0	8560/3	1781	urn:dktk:dataelement:7:2	8560/3	9
13024	0	8200/3	1781	urn:dktk:dataelement:7:2	8200/3	4
13025	0	8144/3	1781	urn:dktk:dataelement:7:2	8144/3	2
13026	0	8140/3	1781	urn:dktk:dataelement:7:2	8140/3	1
13027	0	8260/3	1781	urn:dktk:dataelement:7:2	8260/3	6
13087	0	9530/3	1791	urn:dktk:dataelement:7:2	9530/3	2
13088	0	C70.*	1791	urn:dktk:dataelement:29:2	C70.*	0
13089	0	9538/3	1791	urn:dktk:dataelement:7:2	9538/3	3
13090	0	9150/3	1791	urn:dktk:dataelement:7:2	9150/3	1
13158	0	C08.*	1805	urn:dktk:dataelement:29:2	C08.*	1
11795	0	X	1615	Keine Angabe	Keine Angabe	3
11796	0	P	1615	palliativ	palliativ	1
11797	0	S	1615	Sonstiges	Sonstiges	2
11798	0	K	1615	kurativ	kurativ	0
11898	0	C41.*	1636	urn:dktk:dataelement:29:2	C41.*	1
11899	0	C40.*	1636	urn:dktk:dataelement:29:2	C40.*	0
11900	0	9230/3	1636	urn:dktk:dataelement:7:2	9230/3	2
12026	0	9833/3	1657	urn:dktk:dataelement:7:2	9833/3	3
12027	0	9834/3	1657	urn:dktk:dataelement:7:2	9834/3	4
12028	0	C91.3	1657	urn:dktk:dataelement:29:2	C91.3	0
12029	0	C91.6	1657	urn:dktk:dataelement:29:2	C91.6	1
12030	0	9832/3	1657	urn:dktk:dataelement:7:2	9832/3	2
12169	0	9940/3	1678	urn:dktk:dataelement:7:2	9940/3	1
12170	0	C91.4	1678	urn:dktk:dataelement:29:2	C91.4	0
12406	0	9251/1	1699	urn:dktk:dataelement:7:2	9251/1	2
12407	0	9252/1	1699	urn:dktk:dataelement:7:2	9252/1	3
12408	0	D*	1699	urn:dktk:dataelement:29:2	D*	0
12409	0	8835/1	1699	urn:dktk:dataelement:7:2	8835/1	1
12525	0	9071/3	1719	urn:dktk:dataelement:7:2	9071/3	3
12526	0	9080/3	1719	urn:dktk:dataelement:7:2	9080/3	4
12527	0	C62.*	1719	urn:dktk:dataelement:29:2	C62.*	0
12528	0	9065/3	1719	urn:dktk:dataelement:7:2	9065/3	1
12529	0	9070/3	1719	urn:dktk:dataelement:7:2	9070/3	2
12530	0	9083/3	1719	urn:dktk:dataelement:7:2	9083/3	5
12531	0	9100/3	1719	urn:dktk:dataelement:7:2	9100/3	6
12647	0	8310/3	1738	urn:dktk:dataelement:7:2	8310/3	2
12648	0	8450/3	1738	urn:dktk:dataelement:7:2	8450/3	5
12649	0	8380/3	1738	urn:dktk:dataelement:7:2	8380/3	3
12650	0	C56	1738	urn:dktk:dataelement:29:2	C56	0
12651	0	8460/3	1738	urn:dktk:dataelement:7:2	8460/3	6
12652	0	8441/3	1738	urn:dktk:dataelement:7:2	8441/3	4
12653	0	8120/3	1738	urn:dktk:dataelement:7:2	8120/3	1
12654	0	8461/3	1738	urn:dktk:dataelement:7:2	8461/3	7
12655	0	8470/3	1738	urn:dktk:dataelement:7:2	8470/3	8
12823	0	C34.*	1756	urn:dktk:dataelement:29:2	C34.*	0
12824	0	8254/3	1756	urn:dktk:dataelement:7:2	8254/3	2
12825	0	8244/3	1756	urn:dktk:dataelement:7:2	8244/3	1
12826	0	8323/3	1756	urn:dktk:dataelement:7:2	8323/3	3
12939	0	C16.1	1770	urn:dktk:dataelement:29:2	C16.1	0
12940	0	8142/3	1770	urn:dktk:dataelement:7:2	8142/3	8
12941	0	C16.5	1770	urn:dktk:dataelement:29:2	C16.5	4
12942	0	C16.9	1770	urn:dktk:dataelement:29:2	C16.9	7
12943	0	C16.4	1770	urn:dktk:dataelement:29:2	C16.4	3
12944	0	C16.6	1770	urn:dktk:dataelement:29:2	C16.6	5
12945	0	C16.8	1770	urn:dktk:dataelement:29:2	C16.8	6
12946	0	C16.2	1770	urn:dktk:dataelement:29:2	C16.2	1
12947	0	C16.3	1770	urn:dktk:dataelement:29:2	C16.3	2
13091	0	C72.*	1792	urn:dktk:dataelement:29:2	C72.*	0
13035	0	urn:dktk:code:3:1	1782	Gliom - Grad I	Gliom - Grad I	0
13033	0	urn:dktk:code:4:1	1782	Gliom - Grad II	Gliom - Grad II	1
13034	0	urn:dktk:code:5:1	1782	Gliom - Grad III	Gliom - Grad III	2
13038	0	urn:dktk:code:6:1	1782	Gliom - Grad IV	Gliom - Grad IV	3
13029	0	urn:dktk:code:8:1	1782	Neoplasie des Plexus chorioideus - Grad III	Neoplasie des Plexus chorioideus - Grad III	5
13032	0	urn:dktk:code:9:1	1782	Neuroepitheliomatöse Neoplasie - Grad I	Neuroepitheliomatöse Neoplasie - Grad I	6
13030	0	urn:dktk:code:11:1	1782	Neuroepitheliomatöse Neoplasie - Grad III	Neuroepitheliomatöse Neoplasie - Grad III	8
13040	0	urn:dktk:code:12:1	1782	Tumor der kranialen und spinalen Nerven - Grad III	Tumor der kranialen und spinalen Nerven - Grad III	9
13037	0	urn:dktk:code:13:1	1782	Tumor der kranialen und spinalen Nerven - Grade II-IV	Tumor der kranialen und spinalen Nerven - Grade II-IV	10
13204	0	8071/3	1812	urn:dktk:dataelement:7:2	8071/3	4
13205	0	8050/3	1812	urn:dktk:dataelement:7:2	8050/3	1
13206	0	8072/3	1812	urn:dktk:dataelement:7:2	8072/3	5
13207	0	8070/3	1812	urn:dktk:dataelement:7:2	8070/3	3
13208	0	C00.*	1813	urn:dktk:dataelement:29:2	C00.*	0
13209	0	8050/3	1813	urn:dktk:dataelement:7:2	8050/3	9
13210	0	8052/3	1813	urn:dktk:dataelement:7:2	8052/3	10
13211	0	C01	1813	urn:dktk:dataelement:29:2	C01	1
13212	0	8071/3	1813	urn:dktk:dataelement:7:2	8071/3	12
13213	0	C07	1813	urn:dktk:dataelement:29:2	C07	7
13214	0	8070/3	1813	urn:dktk:dataelement:7:2	8070/3	11
13215	0	8072/3	1813	urn:dktk:dataelement:7:2	8072/3	13
13216	0	C02.*	1813	urn:dktk:dataelement:29:2	C02.*	2
13217	0	C05.*	1813	urn:dktk:dataelement:29:2	C05.*	5
13218	0	C04.*	1813	urn:dktk:dataelement:29:2	C04.*	4
13219	0	C03.*	1813	urn:dktk:dataelement:29:2	C03.*	3
13220	0	C06.*	1813	urn:dktk:dataelement:29:2	C06.*	6
13221	0	C08.*	1813	urn:dktk:dataelement:29:2	C08.*	8
12182	0	urn:dktk:code:100:1	1681	Malignes Melanom	Malignes Melanom	0
12179	0	urn:dktk:code:101:1	1681	Malignes Melanom (in situ)	Malignes Melanom (in situ)	1
12177	0	urn:dktk:code:102:1	1681	Mukosales Melanom	Mukosales Melanom	2
12184	0	urn:dktk:code:103:1	1681	Basalzell-Ca	Basalzell-Ca	3
12176	0	urn:dktk:code:104:1	1681	Plattenepithel-Ca	Plattenepithel-Ca	4
12183	0	urn:dktk:code:105:1	1681	Plattenepithel-Ca (in situ)	Plattenepithel-Ca (in situ)	5
12181	0	urn:dktk:code:106:1	1681	Sonstiger Hauttumor	Sonstiger Hauttumor	6
12178	0	urn:dktk:code:107:1	1681	Kutanes Sarkom	Kutanes Sarkom	7
12180	0	urn:dktk:code:108:1	1681	Kutanes Lymphom	Kutanes Lymphom	8
11952	0	urn:dktk:code:110:1	1650	Lymphatische Leukämie: Akute lymphatische Leukämie	Lymphatische Leukämie: Akute lymphatische Leukämie	0
11950	0	urn:dktk:code:111:1	1650	Akute Leukämie - gemischter Phänotyp	Akute Leukämie - gemischter Phänotyp	1
11970	0	urn:dktk:code:112:1	1650	Lymphatische Leukämie: Chronische lymphatische Leukämie	Lymphatische Leukämie: Chronische lymphatische Leukämie	2
11962	0	urn:dktk:code:113:1	1650	Lymphatische Leukämie: Burkitt-Leukämie	Lymphatische Leukämie: Burkitt-Leukämie	3
11947	0	urn:dktk:code:114:1	1650	Lymphatische Leukämie: Prolymphozytenleukämie	Lymphatische Leukämie: Prolymphozytenleukämie	4
11949	0	urn:dktk:code:115:1	1650	Lymphatische Leukämie: Sonstige	Lymphatische Leukämie: Sonstige	5
11955	0	urn:dktk:code:116:1	1650	Myeloische Leukämie: Akute myeloische Leukämie	Myeloische Leukämie: Akute myeloische Leukämie	6
11966	0	urn:dktk:code:117:1	1650	Myeloische Leukämie: Akute Promyelozytenleukämie	Myeloische Leukämie: Akute Promyelozytenleukämie	7
11956	0	urn:dktk:code:118:1	1650	Myeloische Leukämie: Chronische myeloische Leukämie	Myeloische Leukämie: Chronische myeloische Leukämie	8
11961	0	urn:dktk:code:119:1	1650	Chronische myeloproliferative Erkrankung: Polycythaemia vera	Chronische myeloproliferative Erkrankung: Polycythaemia vera	9
11975	0	urn:dktk:code:120:1	1650	Chronische myeloproliferative Erkrankung: Primäre Myelofibrose	Chronische myeloproliferative Erkrankung: Primäre Myelofibrose	10
11972	0	urn:dktk:code:121:1	1650	Chronische myeloproliferative Erkrankung: Essentielle Thrombozytämie	Chronische myeloproliferative Erkrankung: Essentielle Thrombozytämie	11
11973	0	urn:dktk:code:122:1	1650	Chronische myeloproliferative Erkrankung, andere	Chronische myeloproliferative Erkrankung, andere	12
11946	0	urn:dktk:code:123:1	1650	Myelodysplastisches Syndrom	Myelodysplastisches Syndrom	13
11968	0	urn:dktk:code:124:1	1650	Multiples Myelom	Multiples Myelom	14
11967	0	urn:dktk:code:125:1	1650	NK-Zell-Leukämie, aggressiv	NK-Zell-Leukämie, aggressiv	15
11957	0	urn:dktk:code:126:1	1650	Hodgkin-Lymphom	Hodgkin-Lymphom	16
11974	0	urn:dktk:code:127:1	1650	Non-Hodgkin-Lymphom: Follikuläres Lymphom	Non-Hodgkin-Lymphom: Follikuläres Lymphom	17
11948	0	urn:dktk:code:128:1	1650	Non-Hodgkin-Lymphom: Anderes kleinzelliges Lymphom	Non-Hodgkin-Lymphom: Anderes kleinzelliges Lymphom	18
11965	0	urn:dktk:code:129:1	1650	Non-Hodgkin-Lymphom: Marginalzonen-B-Zell-Lymphom	Non-Hodgkin-Lymphom: Marginalzonen-B-Zell-Lymphom	19
11953	0	urn:dktk:code:130:1	1650	Non-Hodgkin-Lymphom: Haarzell-Leukämie	Non-Hodgkin-Lymphom: Haarzell-Leukämie	20
11969	0	urn:dktk:code:131:1	1650	Non-Hodgkin-Lymphom: Reifzelliges T-Zell-Lymphom	Non-Hodgkin-Lymphom: Reifzelliges T-Zell-Lymphom	21
11960	0	urn:dktk:code:132:1	1650	Non-Hodgkin-Lymphom: Großzelliges anaplastisches Lymphom	Non-Hodgkin-Lymphom: Großzelliges anaplastisches Lymphom	22
11958	0	urn:dktk:code:133:1	1650	Non-Hodgkin-Lymphom: Mantelzell-Lymphom	Non-Hodgkin-Lymphom: Mantelzell-Lymphom	23
11959	0	urn:dktk:code:134:1	1650	Non-Hodgkin-Lymphom: Burkitt-Lymphom	Non-Hodgkin-Lymphom: Burkitt-Lymphom	24
11971	0	urn:dktk:code:135:1	1650	Non-Hodgkin-Lymphom: Diffus großzelliges Lymphom	Non-Hodgkin-Lymphom: Diffus großzelliges Lymphom	25
11963	0	urn:dktk:code:136:1	1650	Non-Hodgkin-Lymphom: Lymphoblastisches Lymphom	Non-Hodgkin-Lymphom: Lymphoblastisches Lymphom	26
11951	0	urn:dktk:code:137:1	1650	Mastzelllymphom	Mastzelllymphom	27
11964	0	urn:dktk:code:138:1	1650	Neoplasie der Histiozyten und akzessorischer lymphoider Zellen	Neoplasie der Histiozyten und akzessorischer lymphoider Zellen	28
11954	0	urn:dktk:code:139:1	1650	Immunoproliferative Krankheit	Immunoproliferative Krankheit	29
12367	0	urn:dktk:code:141:1	1691	Ewing-Sarkom	Ewing-Sarkom	0
12359	0	urn:dktk:code:142:1	1691	Ewing-Sarkom: Soft Tissue Ewing Sarkom	Ewing-Sarkom: Soft Tissue Ewing Sarkom	1
12354	0	urn:dktk:code:143:1	1691	Osteosarkom/Chondrosarkom	Osteosarkom/Chondrosarkom	2
12372	0	urn:dktk:code:144:1	1691	Kaposi-Sarkom	Kaposi-Sarkom	3
12361	0	urn:dktk:code:145:1	1691	Adipozytäres Weichteilsarkom	Adipozytäres Weichteilsarkom	4
12364	0	urn:dktk:code:146:1	1691	Adipoz. Weichteilsarkom - unsicheren Verhaltens	Adipoz. Weichteilsarkom - unsicheren Verhaltens	5
12352	0	urn:dktk:code:147:1	1691	Fibroblastisches Weichteilsarkom	Fibroblastisches Weichteilsarkom	6
12360	0	urn:dktk:code:148:1	1691	Fibrobl. Weichteilsarkom - unsicheren Verhaltens	Fibrobl. Weichteilsarkom - unsicheren Verhaltens	7
12371	0	urn:dktk:code:149:1	1691	Fibrohistiozytäres Weichteilsarkom	Fibrohistiozytäres Weichteilsarkom	8
12349	0	urn:dktk:code:150:1	1691	Fibrohistioz. Weichteilsarkom - unsicheren Verhaltens	Fibrohistioz. Weichteilsarkom - unsicheren Verhaltens	9
12373	0	urn:dktk:code:151:1	1691	Gastrointestinales Stromasarkom	Gastrointestinales Stromasarkom	10
12351	0	urn:dktk:code:152:1	1691	Gastrointest. Stromatumor - unsicheren Verhaltens	Gastrointest. Stromatumor - unsicheren Verhaltens	11
12355	0	urn:dktk:code:153:1	1691	Glattmuskuläres Weichteilsarkom/Leiomyosarkom	Glattmuskuläres Weichteilsarkom/Leiomyosarkom	12
12357	0	urn:dktk:code:154:1	1691	Perizytisches Weichteilsarkom	Perizytisches Weichteilsarkom	13
12370	0	urn:dktk:code:155:1	1691	Perizyt. Weichteilsarkom - unsicheren Verhaltens	Perizyt. Weichteilsarkom - unsicheren Verhaltens	14
12368	0	urn:dktk:code:156:1	1691	Skelettmuskuläres Weichteilsarkom/Rhabdomyosarkom	Skelettmuskuläres Weichteilsarkom/Rhabdomyosarkom	15
12353	0	urn:dktk:code:157:1	1691	Synovialsarkom	Synovialsarkom	16
12366	0	urn:dktk:code:158:1	1691	Vaskuläres Weichteilsarkom	Vaskuläres Weichteilsarkom	17
12356	0	urn:dktk:code:159:1	1691	Vask. Weichteilsarkom - unsicheren Verhaltens	Vask. Weichteilsarkom - unsicheren Verhaltens	18
12363	0	urn:dktk:code:160:1	1691	Weichteilsarkom der Nervenscheiden	Weichteilsarkom der Nervenscheiden	19
12350	0	urn:dktk:code:161:1	1691	Weichteilsark. d. Nervenscheiden - unsicheren Verhaltens	Weichteilsark. d. Nervenscheiden - unsicheren Verhaltens	20
12369	0	urn:dktk:code:162:1	1691	Undifferenzierter/unklassifizierter Tumor	Undifferenzierter/unklassifizierter Tumor	21
12365	0	urn:dktk:code:163:1	1691	Sonstiges Weichteilsarkom (unklare Differenzierung)	Sonstiges Weichteilsarkom (unklare Differenzierung)	22
12358	0	urn:dktk:code:164:1	1691	Gliosarkom	Gliosarkom	23
12362	0	urn:dktk:code:165:1	1691	Sonstiges Weichteilsark. (unklare Diff.) - unsicheren Verhaltens	Sonstiges Weichteilsark. (unklare Diff.) - unsicheren Verhaltens	24
12861	0	urn:dktk:code:49:1	1759	Ösophagus: Adeno-Ca	Ösophagus: Adeno-Ca	0
12851	0	urn:dktk:code:50:1	1759	Ösophagus: Plattenepithel-Ca	Ösophagus: Plattenepithel-Ca	1
12858	0	urn:dktk:code:51:1	1759	Ösophagus: Barrett-Ca	Ösophagus: Barrett-Ca	2
12852	0	urn:dktk:code:52:1	1759	Magenübergang: Adeno-Ca	Magenübergang: Adeno-Ca	3
12848	0	urn:dktk:code:53:1	1759	Magen: Adeno-Ca	Magen: Adeno-Ca	4
12849	0	urn:dktk:code:54:1	1759	Magen: Linitis plastica	Magen: Linitis plastica	5
12844	0	urn:dktk:code:55:1	1759	Gastrointestinal: Plattenepithel-Ca	Gastrointestinal: Plattenepithel-Ca	6
12859	0	urn:dktk:code:56:1	1759	Dünndarm: Adeno-Ca	Dünndarm: Adeno-Ca	7
12860	0	urn:dktk:code:57:1	1759	Kolorektal: Adeno-Ca	Kolorektal: Adeno-Ca	8
12855	0	urn:dktk:code:58:1	1759	Anal: Adeno-Ca	Anal: Adeno-Ca	9
12853	0	urn:dktk:code:59:1	1759	Leber: HCC	Leber: HCC	10
12850	0	urn:dktk:code:60:1	1759	Leber: fibrolamelläres Ca	Leber: fibrolamelläres Ca	11
12840	0	urn:dktk:code:61:1	1759	Leber: CCC	Leber: CCC	12
12845	0	urn:dktk:code:62:1	1759	Leber/Galle, anderes	Leber/Galle, anderes	13
12846	0	urn:dktk:code:63:1	1759	Pankreas: muzinöses Adeno-Ca	Pankreas: muzinöses Adeno-Ca	14
12841	0	urn:dktk:code:64:1	1759	Pankreas, anderes	Pankreas, anderes	15
12843	0	urn:dktk:code:65:1	1759	Neuroendokriner Tumor (NET) - Grad I	Neuroendokriner Tumor (NET) - Grad I	16
12847	0	urn:dktk:code:66:1	1759	Neuroendokriner Tumor (NET) - Grad II	Neuroendokriner Tumor (NET) - Grad II	17
12857	0	urn:dktk:code:67:1	1759	Neuroendokriner Tumor (NET) - Grad III-IV	Neuroendokriner Tumor (NET) - Grad III-IV	18
12842	0	urn:dktk:code:68:1	1759	Neuroendokriner Tumor (NET): Gemischtes adeno-neuroendokrines Karzinom	Neuroendokriner Tumor (NET): Gemischtes adeno-neuroendokrines Karzinom	19
12854	0	urn:dktk:code:69:1	1759	Gastrointestinales Stromasarkom (GIST)	Gastrointestinales Stromasarkom (GIST)	20
12856	0	urn:dktk:code:70:1	1759	MALT-Lymphom	MALT-Lymphom	21
12747	0	urn:dktk:code:35:1	1745	NSCLC: Adeno-Ca	NSCLC: Adeno-Ca	0
12752	0	urn:dktk:code:36:1	1745	NSCLC: Plattenepithel-Ca	NSCLC: Plattenepithel-Ca	1
12748	0	urn:dktk:code:37:1	1745	NSCLC, anderes: adenosquamöses Ca	NSCLC, anderes: adenosquamöses Ca	2
12742	0	urn:dktk:code:38:1	1745	NSCLC, anderes: großzelliges Ca	NSCLC, anderes: großzelliges Ca	3
12749	0	urn:dktk:code:39:1	1745	NSCLC, anderes: sarkomatoides Ca	NSCLC, anderes: sarkomatoides Ca	4
12753	0	urn:dktk:code:40:1	1745	NSCLC, anderes: Speicheldrüsen-ähnliches Ca	NSCLC, anderes: Speicheldrüsen-ähnliches Ca	5
12745	0	urn:dktk:code:41:1	1745	NSCLC, anderes: NOS	NSCLC, anderes: NOS	6
12741	0	urn:dktk:code:42:1	1745	NSCLC, anderes: NOS kombiniert	NSCLC, anderes: NOS kombiniert	7
12750	0	urn:dktk:code:43:1	1745	SCLC (ohne neuroendokrines Ca)	SCLC (ohne neuroendokrines Ca)	8
12751	0	urn:dktk:code:44:1	1745	Neuroendocrines Ca (ohne SCLC)	Neuroendocrines Ca (ohne SCLC)	9
12746	0	urn:dktk:code:45:1	1745	Lungensarkom	Lungensarkom	10
12743	0	urn:dktk:code:46:1	1745	Thymom	Thymom	11
12744	0	urn:dktk:code:47:1	1745	Malignes Mesotheliom	Malignes Mesotheliom	12
12511	0	urn:dktk:code:82:1	1717	Penis: Plattenepithel-Ca	Penis: Plattenepithel-Ca	0
12508	0	urn:dktk:code:83:1	1717	Penis-Ca, anderes	Penis-Ca, anderes	1
12513	0	urn:dktk:code:84:1	1717	Prostata: Adeno-Ca	Prostata: Adeno-Ca	2
12507	0	urn:dktk:code:85:1	1717	Prostata-Ca, anderes	Prostata-Ca, anderes	3
12516	0	urn:dktk:code:86:1	1717	Neuroendokriner Tumor	Neuroendokriner Tumor	4
12512	0	urn:dktk:code:87:1	1717	Hoden-Ca: Seminom	Hoden-Ca: Seminom	5
12518	0	urn:dktk:code:88:1	1717	Hoden-Ca: Nicht-Seminom	Hoden-Ca: Nicht-Seminom	6
12505	0	urn:dktk:code:89:1	1717	Hoden-Ca: Nicht-germinaler Hodentumor	Hoden-Ca: Nicht-germinaler Hodentumor	7
12509	0	urn:dktk:code:90:1	1717	Hoden-Ca, anderes	Hoden-Ca, anderes	8
12520	0	urn:dktk:code:91:1	1717	Nierenzell-Ca: klarzellig	Nierenzell-Ca: klarzellig	9
12519	0	urn:dktk:code:92:1	1717	Nierenzell-Ca: papillär	Nierenzell-Ca: papillär	10
12506	0	urn:dktk:code:93:1	1717	Nierenzell-Ca: chromophob	Nierenzell-Ca: chromophob	11
12514	0	urn:dktk:code:94:1	1717	Nierenzell-Ca, anderes	Nierenzell-Ca, anderes	12
12515	0	urn:dktk:code:95:1	1717	Urothel-Ca	Urothel-Ca	13
12510	0	urn:dktk:code:96:1	1717	Harnblase: Plattenepithel-Ca	Harnblase: Plattenepithel-Ca	14
12517	0	urn:dktk:code:97:1	1717	Harnblase: Adeno-Ca	Harnblase: Adeno-Ca	15
12521	0	urn:dktk:code:98:1	1717	Harnblasen-Ca, anderes	Harnblasen-Ca, anderes	16
12628	0	urn:dktk:code:72:1	1735	Mamma-Ca	Mamma-Ca	0
12625	0	urn:dktk:code:73:1	1735	Mamma-Ca (in situ)	Mamma-Ca (in situ)	1
12623	0	urn:dktk:code:74:1	1735	Vulva-Ca	Vulva-Ca	2
12622	0	urn:dktk:code:75:1	1735	Vaginaltumor	Vaginaltumor	3
12624	0	urn:dktk:code:76:1	1735	Zervix-Ca	Zervix-Ca	4
12621	0	urn:dktk:code:77:1	1735	Endometrium-Ca	Endometrium-Ca	5
12626	0	urn:dktk:code:78:1	1735	Ovarial-Ca	Ovarial-Ca	6
12627	0	urn:dktk:code:79:1	1735	Weiterer Ovarialtumor	Weiterer Ovarialtumor	7
12620	0	urn:dktk:code:80:1	1735	Uterussarkom	Uterussarkom	8
13042	0	urn:dktk:code:7:1	1782	Neoplasie des Plexus chorioideus - Grad II	Neoplasie des Plexus chorioideus - Grad II	4
13041	0	urn:dktk:code:10:1	1782	Neuroepitheliomatöse Neoplasie - Grad II	Neuroepitheliomatöse Neoplasie - Grad II	7
13031	0	urn:dktk:code:14:1	1782	Neoplasie der Meningen - Grad III	Neoplasie der Meningen - Grad III	11
13039	0	urn:dktk:code:15:1	1782	Medulloblastom - Grad IV	Medulloblastom - Grad IV	12
13036	0	urn:dktk:code:16:1	1782	Neuroektodermaler Tumor - Grad IV	Neuroektodermaler Tumor - Grad IV	13
13044	0	urn:dktk:code:17:1	1782	Atypischer teratoider/rhabdoider Tumor - Grad IV	Atypischer teratoider/rhabdoider Tumor - Grad IV	14
13043	0	urn:dktk:code:18:1	1782	Gliosarkom	Gliosarkom	15
13028	0	urn:dktk:code:19:1	1782	ZNS-Lymphom (diffuses großzelliges B-Zell-Lymphom)	ZNS-Lymphom (diffuses großzelliges B-Zell-Lymphom)	16
13117	0	urn:dktk:code:21:1	1800	Mundhöhle: Plattenepithel-Ca	Mundhöhle: Plattenepithel-Ca	0
13118	0	urn:dktk:code:22:1	1800	Speicheldrüse: Adeno-Ca	Speicheldrüse: Adeno-Ca	1
13115	0	urn:dktk:code:23:1	1800	Oropharynx: Plattenepithel-Ca	Oropharynx: Plattenepithel-Ca	2
13116	0	urn:dktk:code:24:1	1800	Nasopharynx: Plattenepithel-Ca	Nasopharynx: Plattenepithel-Ca	3
13123	0	urn:dktk:code:25:1	1800	Hypopharynx: Plattenepithel-Ca	Hypopharynx: Plattenepithel-Ca	4
13122	0	urn:dktk:code:26:1	1800	Allgemein Mundhöhle/Rachen: Plattenepithel-Ca	Allgemein Mundhöhle/Rachen: Plattenepithel-Ca	5
13114	0	urn:dktk:code:27:1	1800	Nasenhöhle, Nasennebenhöhle und Mittelohr: Plattenepithel-Ca	Nasenhöhle, Nasennebenhöhle und Mittelohr: Plattenepithel-Ca	6
13120	0	urn:dktk:code:28:1	1800	Larynx - Glottis: Plattenepithel-Ca	Larynx - Glottis: Plattenepithel-Ca	7
13124	0	urn:dktk:code:29:1	1800	Larynx - Supraglottis: Plattenepithel-Ca	Larynx - Supraglottis: Plattenepithel-Ca	8
13119	0	urn:dktk:code:30:1	1800	Larynx - Subglottis: Plattenepithel-Ca	Larynx - Subglottis: Plattenepithel-Ca	9
13126	0	urn:dktk:code:31:1	1800	Larynx - Andere: Plattenepithel-Ca	Larynx - Andere: Plattenepithel-Ca	10
13121	0	urn:dktk:code:32:1	1800	Cancer of unknown primary (CUP): Plattenepithel-Ca	Cancer of unknown primary (CUP): Plattenepithel-Ca	11
13125	0	urn:dktk:code:33:1	1800	Cancer of unknown primary (CUP)-extranodal: Plattenepithel-Ca	Cancer of unknown primary (CUP)-extranodal: Plattenepithel-Ca	12
11919	0	urn:dktk:code:177:1	1643	Chorion-Ca	Chorion-Ca	0
11918	0	urn:dktk:code:178:1	1643	Dottersack-Ca	Dottersack-Ca	1
11914	0	urn:dktk:code:179:1	1643	Embryonal-Ca	Embryonal-Ca	2
11915	0	urn:dktk:code:180:1	1643	Germinom	Germinom	3
11916	0	urn:dktk:code:181:1	1643	Teratom	Teratom	4
11917	0	urn:dktk:code:182:1	1643	Weiterer Keimzelltumor	Weiterer Keimzelltumor	5
11888	0	urn:dktk:code:167:1	1633	Hepatoblastom	Hepatoblastom	0
11886	0	urn:dktk:code:168:1	1633	Pankreatoblastom	Pankreatoblastom	1
11884	0	urn:dktk:code:169:1	1633	Pleuro-pulmonales Blastom	Pleuro-pulmonales Blastom	2
11885	0	urn:dktk:code:170:1	1633	Chondroblastom	Chondroblastom	3
11887	0	urn:dktk:code:171:1	1633	Nephroblastom	Nephroblastom	4
11881	0	urn:dktk:code:172:1	1633	Retinoblastom	Retinoblastom	5
11882	0	urn:dktk:code:173:1	1633	Neuroblastom	Neuroblastom	6
11889	0	urn:dktk:code:174:1	1633	Medulloblastom	Medulloblastom	7
11883	0	urn:dktk:code:175:1	1633	Pineoblastom	Pineoblastom	8
11747	0	L	1609	Links	Links	0
11749	0	B	1609	Beidseitig	Beidseitig (Sollte bei bestimmten Tumoren 2 Meldungen ergeben)	2
11726	0	0	1606	malignes Melanom der Konjunktiva	malignes Melanom der Konjunktiva	0
11766	0	IS	1610	IS	IS	0
11757	0	0a	1610	0a	0a	2
11778	0	IIIC1	1610	IIIC1	IIIC1	22
13223	0	f	1630	Nein		1
\.


--ALTER TABLE public.list_item ENABLE TRIGGER ALL;

--
-- Data for Name: list_of_values; Type: TABLE DATA; Schema: public; Owner: dktktest
--

--ALTER TABLE public.list_of_values DISABLE TRIGGER ALL;

COPY public.list_of_values (id, version, name) FROM stdin;
1626	1	Lymphknoten-Rezidiv
1628	1	Vitalstatus
1630	1	Patienten mit Biomaterial
1632	1	Probentyp
1634	1	urn_dktk_code_172
1636	1	urn_dktk_code_170
1638	1	urn_dktk_code_168
1640	1	urn_dktk_code_167
1642	1	urn_dktk_code_175
1644	1	urn_dktk_code_180
1646	1	urn_dktk_code_178
1648	1	urn_dktk_code_177
1650	1	urn_dktk_code_109
1652	1	urn_dktk_code_113
1654	1	urn_dktk_code_111
1656	1	urn_dktk_code_117
1658	1	urn_dktk_code_115
1660	1	urn_dktk_code_135
1662	1	urn_dktk_code_137
1664	1	urn_dktk_code_139
1666	1	urn_dktk_code_118
1668	1	urn_dktk_code_120
1670	1	urn_dktk_code_122
1672	1	urn_dktk_code_124
1674	1	urn_dktk_code_126
1676	1	urn_dktk_code_128
1678	1	urn_dktk_code_130
1680	1	urn_dktk_code_132
1682	1	urn_dktk_code_104
1684	1	urn_dktk_code_102
1686	1	urn_dktk_code_108
1688	1	urn_dktk_code_107
1690	1	urn_dktk_code_100
1692	1	urn_dktk_code_157
1694	1	urn_dktk_code_155
1696	1	urn_dktk_code_153
1698	1	urn_dktk_code_151
1700	1	urn_dktk_code_165
1702	1	urn_dktk_code_163
1704	1	urn_dktk_code_161
1706	1	urn_dktk_code_159
1708	1	urn_dktk_code_141
1710	1	urn_dktk_code_143
1712	1	urn_dktk_code_145
1714	1	urn_dktk_code_147
1716	1	urn_dktk_code_149
1718	1	urn_dktk_code_89
1720	1	urn_dktk_code_87
1722	1	urn_dktk_code_93
1724	1	urn_dktk_code_91
1726	1	urn_dktk_code_97
1728	1	urn_dktk_code_95
1730	1	urn_dktk_code_98
1732	1	urn_dktk_code_84
1734	1	urn_dktk_code_82
1736	1	urn_dktk_code_80
1738	1	urn_dktk_code_78
1740	1	urn_dktk_code_72
1742	1	urn_dktk_code_76
1744	1	urn_dktk_code_74
1746	1	urn_dktk_code_35
1748	1	urn_dktk_code_37
1750	1	urn_dktk_code_46
1752	1	urn_dktk_code_38
1754	1	urn_dktk_code_40
1756	1	urn_dktk_code_42
1758	1	urn_dktk_code_44
1760	1	urn_dktk_code_64
1762	1	urn_dktk_code_62
1764	1	urn_dktk_code_68
1766	1	urn_dktk_code_66
1768	1	urn_dktk_code_56
1770	1	urn_dktk_code_54
1772	1	urn_dktk_code_60
1774	1	urn_dktk_code_58
1776	1	urn_dktk_code_70
1778	1	urn_dktk_code_51
1780	1	urn_dktk_code_53
1782	1	urn_dktk_code_2
1784	1	urn_dktk_code_5
1786	1	urn_dktk_code_19
1788	1	urn_dktk_code_17
1790	1	urn_dktk_code_15
1791	1	urn_dktk_code_14
1792	1	urn_dktk_code_13
1793	1	urn_dktk_code_12
1794	1	urn_dktk_code_11
1795	1	urn_dktk_code_10
1796	1	urn_dktk_code_9
1797	1	urn_dktk_code_8
1798	1	urn_dktk_code_7
1799	1	urn_dktk_code_6
1800	1	urn_dktk_code_20
1801	1	urn_dktk_code_30
1802	1	urn_dktk_code_31
1803	1	urn_dktk_code_32
1804	1	urn_dktk_code_33
1805	1	urn_dktk_code_22
1806	1	urn_dktk_code_23
1807	1	urn_dktk_code_24
1808	1	urn_dktk_code_25
1809	1	urn_dktk_code_26
1810	1	urn_dktk_code_27
1811	1	urn_dktk_code_28
1812	1	urn_dktk_code_29
1813	1	urn_dktk_code_21
1627	1	Ansprechen innerhalb der letzten 3 Monate
1595	1	Geschlecht
1629	1	Fixierungsart
1596	1	c/p/u-Präfix M
1631	1	Probenart
1597	1	TNM-M
1633	1	urn_dktk_code_166
1598	1	c/p/u-Präfix N
1635	1	urn_dktk_code_173
1599	1	TNM-N
1637	1	urn_dktk_code_171
1600	1	c/p/u-Präfix T
1639	1	urn_dktk_code_169
1601	1	TNM-T
1641	1	urn_dktk_code_174
1602	1	TNM-r-Symbol
1643	1	urn_dktk_code_176
1603	1	TNM-y-Symbol
1645	1	urn_dktk_code_181
1604	1	Fernmetastasen vorhanden
1647	1	urn_dktk_code_179
1605	1	Gesamtbeurteilung Resttumor
1649	1	urn_dktk_code_182
1606	1	Grading
1651	1	urn_dktk_code_112
1607	1	Lokale Beurteilung Resttumor
1653	1	urn_dktk_code_110
1608	1	Lokalisation Fernmetastasen
1655	1	urn_dktk_code_116
1609	1	Seitenlokalisation
1657	1	urn_dktk_code_114
1610	1	UICC Stadium
1659	1	urn_dktk_code_134
1611	1	Hormontherapie
1661	1	urn_dktk_code_136
1612	1	Immuntherapie
1663	1	urn_dktk_code_138
1613	1	Intention Chemotherapie
1665	1	urn_dktk_code_119
1614	1	Intention OP
1667	1	urn_dktk_code_121
1615	1	Intention Strahlentherapie
1669	1	urn_dktk_code_123
1616	1	Knochenmarktransplantation
1671	1	urn_dktk_code_125
1617	1	Chemotherapie
1673	1	urn_dktk_code_127
1618	1	OP
1675	1	urn_dktk_code_129
1619	1	Strahlentherapie
1677	1	urn_dktk_code_131
1620	1	Strahlentherapie Stellung zu operativer Therapie
1679	1	urn_dktk_code_133
1621	1	Systemische Therapie Stellung zu operativer Therapie
1681	1	urn_dktk_code_99
1622	1	Weitere Therapien
1683	1	urn_dktk_code_105
1623	1	Ansprechen Primärtherapie
1685	1	urn_dktk_code_103
1624	1	Fernmetastasen
1687	1	urn_dktk_code_106
1625	1	Lokales/regionäres Rezidiv
1689	1	urn_dktk_code_101
1691	1	urn_dktk_code_140
1693	1	urn_dktk_code_156
1695	1	urn_dktk_code_154
1697	1	urn_dktk_code_152
1699	1	urn_dktk_code_150
1701	1	urn_dktk_code_164
1703	1	urn_dktk_code_162
1705	1	urn_dktk_code_160
1707	1	urn_dktk_code_158
1709	1	urn_dktk_code_142
1711	1	urn_dktk_code_144
1713	1	urn_dktk_code_146
1715	1	urn_dktk_code_148
1717	1	urn_dktk_code_81
1719	1	urn_dktk_code_88
1721	1	urn_dktk_code_86
1723	1	urn_dktk_code_92
1725	1	urn_dktk_code_90
1727	1	urn_dktk_code_96
1729	1	urn_dktk_code_94
1731	1	urn_dktk_code_85
1733	1	urn_dktk_code_83
1735	1	urn_dktk_code_71
1737	1	urn_dktk_code_79
1739	1	urn_dktk_code_73
1741	1	urn_dktk_code_77
1743	1	urn_dktk_code_75
1745	1	urn_dktk_code_34
1747	1	urn_dktk_code_36
1749	1	urn_dktk_code_47
1751	1	urn_dktk_code_39
1753	1	urn_dktk_code_41
1755	1	urn_dktk_code_43
1757	1	urn_dktk_code_45
1759	1	urn_dktk_code_48
1761	1	urn_dktk_code_65
1763	1	urn_dktk_code_63
1765	1	urn_dktk_code_69
1767	1	urn_dktk_code_67
1769	1	urn_dktk_code_57
1771	1	urn_dktk_code_55
1773	1	urn_dktk_code_61
1775	1	urn_dktk_code_59
1777	1	urn_dktk_code_49
1779	1	urn_dktk_code_50
1781	1	urn_dktk_code_52
1783	1	urn_dktk_code_4
1785	1	urn_dktk_code_3
1787	1	urn_dktk_code_18
1789	1	urn_dktk_code_16
\.


--ALTER TABLE public.list_of_values ENABLE TRIGGER ALL;

--
-- Name: attribute_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dktktest
--

SELECT pg_catalog.setval('public.attribute_id_seq', 1969, true);


--
-- Name: entity_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dktktest
--

SELECT pg_catalog.setval('public.entity_type_id_seq', 14, true);


--
-- Name: group__id_seq; Type: SEQUENCE SET; Schema: public; Owner: dktktest
--

SELECT pg_catalog.setval('public.group__id_seq', 34, true);


--
-- Name: list_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dktktest
--

SELECT pg_catalog.setval('public.list_item_id_seq', 13223, true);


--
-- Name: list_of_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dktktest
--

SELECT pg_catalog.setval('public.list_of_values_id_seq', 1813, true);


--
-- PostgreSQL database dump complete
--

