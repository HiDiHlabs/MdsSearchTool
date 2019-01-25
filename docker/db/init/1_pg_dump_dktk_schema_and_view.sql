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

DROP DATABASE IF EXISTS dktktest;
CREATE ROLE dktktest;
CREATE ROLE postgres;
--
-- Name: dktktest; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE dktktest WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';


-- ALTER DATABASE dktktest OWNER TO postgres;

\connect dktktest

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: attribute; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.attribute (
    id bigint NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    description character varying(255) NOT NULL,
    entity_type_id bigint NOT NULL,
    groupable boolean NOT NULL,
    nullable boolean NOT NULL,
    key character varying(255) NOT NULL,
    list_of_values_id bigint,
    name character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    unit character varying(255),
    format character varying(255),
    version_ character varying(255)
);


ALTER TABLE public.attribute OWNER TO dktktest;

--
-- Name: attribute_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.attribute_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.attribute_id_seq OWNER TO dktktest;

--
-- Name: attribute_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.attribute_id_seq OWNED BY public.attribute.id;


--
-- Name: entity_type; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.entity_type (
    id bigint NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    key character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    order_ integer NOT NULL,
    parent_id bigint
);


ALTER TABLE public.entity_type OWNER TO dktktest;

--
-- Name: entity_type_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.entity_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entity_type_id_seq OWNER TO dktktest;

--
-- Name: entity_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.entity_type_id_seq OWNED BY public.entity_type.id;


--
-- Name: group_; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.group_ (
    id bigint NOT NULL,
    version bigint NOT NULL,
    entity_type_id bigint,
    name character varying(255) NOT NULL,
    order_ integer NOT NULL
);


ALTER TABLE public.group_ OWNER TO dktktest;

--
-- Name: group__id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.group__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group__id_seq OWNER TO dktktest;

--
-- Name: group__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.group__id_seq OWNED BY public.group_.id;


--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.group_attribute (
    group_id bigint NOT NULL,
    attribute_id bigint NOT NULL,
    version bigint NOT NULL,
    order_ integer NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO dktktest;

--
-- Name: list_item; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.list_item (
    id bigint NOT NULL,
    version bigint NOT NULL,
    key character varying(255) NOT NULL,
    list_of_values_id bigint NOT NULL,
    value character varying(255) NOT NULL,
    description character varying(255) NOT NULL,
    order_ integer NOT NULL
);


ALTER TABLE public.list_item OWNER TO dktktest;

--
-- Name: list_item_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.list_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_item_id_seq OWNER TO dktktest;

--
-- Name: list_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.list_item_id_seq OWNED BY public.list_item.id;


--
-- Name: list_of_values; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.list_of_values (
    id bigint NOT NULL,
    version bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.list_of_values OWNER TO dktktest;

--
-- Name: list_of_values_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.list_of_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.list_of_values_id_seq OWNER TO dktktest;

--
-- Name: list_of_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.list_of_values_id_seq OWNED BY public.list_of_values.id;


--
-- Name: mds_b; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.mds_b (
    id integer NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    parent_id bigint NOT NULL,
    mds_b_site_id character varying(255) NOT NULL,
    mds_b_teiler_id character varying(255) NOT NULL,
    mds_b_id character varying(255) NOT NULL,
    urn_dktk_dataelement_49 timestamp without time zone,
    urn_dktk_dataelement_49_version integer,
    urn_dktk_dataelement_90 character varying(255),
    urn_dktk_dataelement_90_version integer,
    urn_dktk_dataelement_50 character varying(255),
    urn_dktk_dataelement_50_version integer,
    urn_dktk_dataelement_97 character varying(255),
    urn_dktk_dataelement_97_version integer,
    urn_dktk_dataelement_95 character varying(255),
    urn_dktk_dataelement_95_version integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.mds_b OWNER TO dktktest;

--
-- Name: mds_b_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.mds_b_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mds_b_id_seq OWNER TO dktktest;

--
-- Name: mds_b_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.mds_b_id_seq OWNED BY public.mds_b.id;


--
-- Name: mds_k; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.mds_k (
    id integer NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    parent_id bigint NOT NULL,
    mds_k_site_id character varying(255) NOT NULL,
    mds_k_teiler_id character varying(255) NOT NULL,
    mds_k_id character varying(255) NOT NULL,
    urn_dktk_dataelement_54 character varying(255),
    urn_dktk_dataelement_54_version integer,
    urn_dktk_dataelement_26 timestamp without time zone,
    urn_dktk_dataelement_26_version integer,
    urn_dktk_dataelement_1 character varying(255),
    urn_dktk_dataelement_1_version integer,
    urn_dktk_dataelement_80 character varying(255),
    urn_dktk_dataelement_80_version integer,
    urn_dktk_dataelement_87 character varying(255),
    urn_dktk_dataelement_87_version integer,
    urn_dktk_dataelement_79 character varying(255),
    urn_dktk_dataelement_79_version integer,
    urn_dktk_dataelement_86 character varying(255),
    urn_dktk_dataelement_86_version integer,
    urn_dktk_dataelement_78 character varying(255),
    urn_dktk_dataelement_78_version integer,
    urn_dktk_dataelement_85 character varying(255),
    urn_dktk_dataelement_85_version integer,
    urn_dktk_dataelement_2 timestamp without time zone,
    urn_dktk_dataelement_2_version integer,
    urn_dktk_dataelement_10 character varying(255),
    urn_dktk_dataelement_10_version integer,
    urn_dktk_dataelement_81 character varying(255),
    urn_dktk_dataelement_81_version integer,
    urn_dktk_dataelement_18 character varying(255),
    urn_dktk_dataelement_18_version integer,
    urn_dktk_dataelement_82 character varying(255),
    urn_dktk_dataelement_82_version integer,
    urn_dktk_dataelement_28 integer,
    urn_dktk_dataelement_28_version integer,
    urn_dktk_dataelement_77 character varying(255),
    urn_dktk_dataelement_77_version integer,
    urn_dktk_dataelement_21 timestamp without time zone,
    urn_dktk_dataelement_21_version integer,
    urn_dktk_dataelement_29 character varying(255),
    urn_dktk_dataelement_29_version integer,
    urn_dktk_dataelement_20 character varying(255),
    urn_dktk_dataelement_20_version integer,
    urn_dktk_dataelement_9 character varying(255),
    urn_dktk_dataelement_9_version integer,
    urn_dktk_dataelement_3 character varying(255),
    urn_dktk_dataelement_3_version integer,
    urn_dktk_dataelement_8 character varying(255),
    urn_dktk_dataelement_8_version integer,
    urn_dktk_dataelement_5 character varying(255),
    urn_dktk_dataelement_5_version integer,
    urn_dktk_dataelement_19 character varying(255),
    urn_dktk_dataelement_19_version integer,
    urn_dktk_dataelement_4 character varying(255),
    urn_dktk_dataelement_4_version integer,
    urn_dktk_dataelement_22 character varying(255),
    urn_dktk_dataelement_22_version integer,
    urn_dktk_dataelement_7 character varying(255),
    urn_dktk_dataelement_7_version integer,
    urn_dktk_dataelement_6 character varying(255),
    urn_dktk_dataelement_6_version integer,
    urn_dktk_dataelement_83 timestamp without time zone,
    urn_dktk_dataelement_83_version integer,
    urn_dktk_dataelement_89 character varying(255),
    urn_dktk_dataelement_89_version integer,
    urn_dktk_dataelement_39 character varying(255),
    urn_dktk_dataelement_39_version integer,
    urn_dktk_dataelement_38 character varying(255),
    urn_dktk_dataelement_38_version integer,
    urn_dktk_dataelement_69 character varying(255),
    urn_dktk_dataelement_69_version integer,
    urn_dktk_dataelement_23 character varying(255),
    urn_dktk_dataelement_23_version integer,
    urn_dktk_dataelement_67 character varying(255),
    urn_dktk_dataelement_67_version integer,
    urn_dktk_dataelement_40 character varying(255),
    urn_dktk_dataelement_40_version integer,
    urn_dktk_dataelement_36 character varying(255),
    urn_dktk_dataelement_36_version integer,
    urn_dktk_dataelement_33 character varying(255),
    urn_dktk_dataelement_33_version integer,
    urn_dktk_dataelement_34 character varying(255),
    urn_dktk_dataelement_34_version integer,
    urn_dktk_dataelement_68 character varying(255),
    urn_dktk_dataelement_68_version integer,
    urn_dktk_dataelement_70 character varying(255),
    urn_dktk_dataelement_70_version integer,
    urn_dktk_dataelement_41 character varying(255),
    urn_dktk_dataelement_41_version integer,
    urn_dktk_dataelement_71 character varying(255),
    urn_dktk_dataelement_71_version integer,
    urn_dktk_dataelement_24 character varying(255),
    urn_dktk_dataelement_24_version integer,
    urn_dktk_dataelement_25 timestamp without time zone,
    urn_dktk_dataelement_25_version integer,
    urn_dktk_dataelement_46 timestamp without time zone,
    urn_dktk_dataelement_46_version integer,
    urn_dktk_dataelement_43 timestamp without time zone,
    urn_dktk_dataelement_43_version integer,
    urn_dktk_dataelement_45 timestamp without time zone,
    urn_dktk_dataelement_45_version integer,
    urn_dktk_dataelement_74 character varying(255),
    urn_dktk_dataelement_74_version integer,
    urn_dktk_dataelement_72 character varying(255),
    urn_dktk_dataelement_72_version integer,
    urn_dktk_dataelement_73 character varying(255),
    urn_dktk_dataelement_73_version integer,
    urn_dktk_dataelement_84 character varying(255),
    urn_dktk_dataelement_84_version integer,
    urn_dktk_dataelement_47 timestamp without time zone,
    urn_dktk_dataelement_47_version integer,
    urn_dktk_dataelement_48 timestamp without time zone,
    urn_dktk_dataelement_48_version integer,
    urn_dktk_dataelement_53 character varying(255),
    urn_dktk_dataelement_53_version integer,
    urn_dktk_dataelement_99 character varying(255),
    urn_dktk_dataelement_99_version integer,
    urn_dktk_dataelement_101 character varying(255),
    urn_dktk_dataelement_101_version integer,
    urn_dktk_dataelement_100 character varying(255),
    urn_dktk_dataelement_100_version integer,
    urn_dktk_dataelement_98 character varying(255),
    urn_dktk_dataelement_98_version integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.mds_k OWNER TO dktktest;

--
-- Name: mds_k_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.mds_k_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mds_k_id_seq OWNER TO dktktest;

--
-- Name: mds_k_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.mds_k_id_seq OWNED BY public.mds_k.id;


--
-- Name: mds_k_view; Type: MATERIALIZED VIEW; Schema: public; Owner: dktktest
--

CREATE MATERIALIZED VIEW public.mds_k_view AS
 SELECT single.parent_id,
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
   FROM ((((( SELECT DISTINCT single_1.parent_id,
            single_1.urn_dktk_dataelement_1,
            single_1.urn_dktk_dataelement_19,
            single_1.urn_dktk_dataelement_26,
            single_1.urn_dktk_dataelement_48,
            single_1.urn_dktk_dataelement_53,
            single_1.urn_dktk_dataelement_54,
            single_1.urn_dktk_dataelement_28,
            single_1.urn_dktk_dataelement_29,
            single_1.urn_dktk_dataelement_83,
            single_1.urn_dktk_dataelement_4,
            single_1.urn_dktk_dataelement_5,
            single_1.urn_dktk_dataelement_6
           FROM public.mds_k single_1) single
     LEFT JOIN ( SELECT hist_1.id,
            hist_1.version,
            hist_1.parent_id,
            hist_1.mds_k_site_id,
            hist_1.mds_k_teiler_id,
            hist_1.mds_k_id,
            hist_1.urn_dktk_dataelement_54,
            hist_1.urn_dktk_dataelement_54_version,
            hist_1.urn_dktk_dataelement_26,
            hist_1.urn_dktk_dataelement_26_version,
            hist_1.urn_dktk_dataelement_1,
            hist_1.urn_dktk_dataelement_1_version,
            hist_1.urn_dktk_dataelement_80,
            hist_1.urn_dktk_dataelement_80_version,
            hist_1.urn_dktk_dataelement_87,
            hist_1.urn_dktk_dataelement_87_version,
            hist_1.urn_dktk_dataelement_79,
            hist_1.urn_dktk_dataelement_79_version,
            hist_1.urn_dktk_dataelement_86,
            hist_1.urn_dktk_dataelement_86_version,
            hist_1.urn_dktk_dataelement_78,
            hist_1.urn_dktk_dataelement_78_version,
            hist_1.urn_dktk_dataelement_85,
            hist_1.urn_dktk_dataelement_85_version,
            hist_1.urn_dktk_dataelement_2,
            hist_1.urn_dktk_dataelement_2_version,
            hist_1.urn_dktk_dataelement_10,
            hist_1.urn_dktk_dataelement_10_version,
            hist_1.urn_dktk_dataelement_81,
            hist_1.urn_dktk_dataelement_81_version,
            hist_1.urn_dktk_dataelement_18,
            hist_1.urn_dktk_dataelement_18_version,
            hist_1.urn_dktk_dataelement_82,
            hist_1.urn_dktk_dataelement_82_version,
            hist_1.urn_dktk_dataelement_28,
            hist_1.urn_dktk_dataelement_28_version,
            hist_1.urn_dktk_dataelement_77,
            hist_1.urn_dktk_dataelement_77_version,
            hist_1.urn_dktk_dataelement_21,
            hist_1.urn_dktk_dataelement_21_version,
            hist_1.urn_dktk_dataelement_29,
            hist_1.urn_dktk_dataelement_29_version,
            hist_1.urn_dktk_dataelement_20,
            hist_1.urn_dktk_dataelement_20_version,
            hist_1.urn_dktk_dataelement_9,
            hist_1.urn_dktk_dataelement_9_version,
            hist_1.urn_dktk_dataelement_3,
            hist_1.urn_dktk_dataelement_3_version,
            hist_1.urn_dktk_dataelement_8,
            hist_1.urn_dktk_dataelement_8_version,
            hist_1.urn_dktk_dataelement_5,
            hist_1.urn_dktk_dataelement_5_version,
            hist_1.urn_dktk_dataelement_19,
            hist_1.urn_dktk_dataelement_19_version,
            hist_1.urn_dktk_dataelement_4,
            hist_1.urn_dktk_dataelement_4_version,
            hist_1.urn_dktk_dataelement_22,
            hist_1.urn_dktk_dataelement_22_version,
            hist_1.urn_dktk_dataelement_7,
            hist_1.urn_dktk_dataelement_7_version,
            hist_1.urn_dktk_dataelement_6,
            hist_1.urn_dktk_dataelement_6_version,
            hist_1.urn_dktk_dataelement_83,
            hist_1.urn_dktk_dataelement_83_version,
            hist_1.urn_dktk_dataelement_89,
            hist_1.urn_dktk_dataelement_89_version,
            hist_1.urn_dktk_dataelement_39,
            hist_1.urn_dktk_dataelement_39_version,
            hist_1.urn_dktk_dataelement_38,
            hist_1.urn_dktk_dataelement_38_version,
            hist_1.urn_dktk_dataelement_69,
            hist_1.urn_dktk_dataelement_69_version,
            hist_1.urn_dktk_dataelement_23,
            hist_1.urn_dktk_dataelement_23_version,
            hist_1.urn_dktk_dataelement_67,
            hist_1.urn_dktk_dataelement_67_version,
            hist_1.urn_dktk_dataelement_40,
            hist_1.urn_dktk_dataelement_40_version,
            hist_1.urn_dktk_dataelement_36,
            hist_1.urn_dktk_dataelement_36_version,
            hist_1.urn_dktk_dataelement_33,
            hist_1.urn_dktk_dataelement_33_version,
            hist_1.urn_dktk_dataelement_34,
            hist_1.urn_dktk_dataelement_34_version,
            hist_1.urn_dktk_dataelement_68,
            hist_1.urn_dktk_dataelement_68_version,
            hist_1.urn_dktk_dataelement_70,
            hist_1.urn_dktk_dataelement_70_version,
            hist_1.urn_dktk_dataelement_41,
            hist_1.urn_dktk_dataelement_41_version,
            hist_1.urn_dktk_dataelement_71,
            hist_1.urn_dktk_dataelement_71_version,
            hist_1.urn_dktk_dataelement_24,
            hist_1.urn_dktk_dataelement_24_version,
            hist_1.urn_dktk_dataelement_25,
            hist_1.urn_dktk_dataelement_25_version,
            hist_1.urn_dktk_dataelement_46,
            hist_1.urn_dktk_dataelement_46_version,
            hist_1.urn_dktk_dataelement_43,
            hist_1.urn_dktk_dataelement_43_version,
            hist_1.urn_dktk_dataelement_45,
            hist_1.urn_dktk_dataelement_45_version,
            hist_1.urn_dktk_dataelement_74,
            hist_1.urn_dktk_dataelement_74_version,
            hist_1.urn_dktk_dataelement_72,
            hist_1.urn_dktk_dataelement_72_version,
            hist_1.urn_dktk_dataelement_73,
            hist_1.urn_dktk_dataelement_73_version,
            hist_1.urn_dktk_dataelement_84,
            hist_1.urn_dktk_dataelement_84_version,
            hist_1.urn_dktk_dataelement_47,
            hist_1.urn_dktk_dataelement_47_version,
            hist_1.urn_dktk_dataelement_48,
            hist_1.urn_dktk_dataelement_48_version,
            hist_1.urn_dktk_dataelement_53,
            hist_1.urn_dktk_dataelement_53_version,
            hist_1.urn_dktk_dataelement_99,
            hist_1.urn_dktk_dataelement_99_version,
            hist_1.urn_dktk_dataelement_101,
            hist_1.urn_dktk_dataelement_101_version,
            hist_1.urn_dktk_dataelement_100,
            hist_1.urn_dktk_dataelement_100_version,
            hist_1.urn_dktk_dataelement_98,
            hist_1.urn_dktk_dataelement_98_version
           FROM public.mds_k hist_1
          WHERE (((hist_1.urn_dktk_dataelement_7 IS NOT NULL) OR (hist_1.urn_dktk_dataelement_8 IS NOT NULL)) OR (hist_1.urn_dktk_dataelement_9 IS NOT NULL))) hist ON ((single.parent_id = hist.parent_id)))
     LEFT JOIN ( SELECT meta_1.id,
            meta_1.version,
            meta_1.parent_id,
            meta_1.mds_k_site_id,
            meta_1.mds_k_teiler_id,
            meta_1.mds_k_id,
            meta_1.urn_dktk_dataelement_54,
            meta_1.urn_dktk_dataelement_54_version,
            meta_1.urn_dktk_dataelement_26,
            meta_1.urn_dktk_dataelement_26_version,
            meta_1.urn_dktk_dataelement_1,
            meta_1.urn_dktk_dataelement_1_version,
            meta_1.urn_dktk_dataelement_80,
            meta_1.urn_dktk_dataelement_80_version,
            meta_1.urn_dktk_dataelement_87,
            meta_1.urn_dktk_dataelement_87_version,
            meta_1.urn_dktk_dataelement_79,
            meta_1.urn_dktk_dataelement_79_version,
            meta_1.urn_dktk_dataelement_86,
            meta_1.urn_dktk_dataelement_86_version,
            meta_1.urn_dktk_dataelement_78,
            meta_1.urn_dktk_dataelement_78_version,
            meta_1.urn_dktk_dataelement_85,
            meta_1.urn_dktk_dataelement_85_version,
            meta_1.urn_dktk_dataelement_2,
            meta_1.urn_dktk_dataelement_2_version,
            meta_1.urn_dktk_dataelement_10,
            meta_1.urn_dktk_dataelement_10_version,
            meta_1.urn_dktk_dataelement_81,
            meta_1.urn_dktk_dataelement_81_version,
            meta_1.urn_dktk_dataelement_18,
            meta_1.urn_dktk_dataelement_18_version,
            meta_1.urn_dktk_dataelement_82,
            meta_1.urn_dktk_dataelement_82_version,
            meta_1.urn_dktk_dataelement_28,
            meta_1.urn_dktk_dataelement_28_version,
            meta_1.urn_dktk_dataelement_77,
            meta_1.urn_dktk_dataelement_77_version,
            meta_1.urn_dktk_dataelement_21,
            meta_1.urn_dktk_dataelement_21_version,
            meta_1.urn_dktk_dataelement_29,
            meta_1.urn_dktk_dataelement_29_version,
            meta_1.urn_dktk_dataelement_20,
            meta_1.urn_dktk_dataelement_20_version,
            meta_1.urn_dktk_dataelement_9,
            meta_1.urn_dktk_dataelement_9_version,
            meta_1.urn_dktk_dataelement_3,
            meta_1.urn_dktk_dataelement_3_version,
            meta_1.urn_dktk_dataelement_8,
            meta_1.urn_dktk_dataelement_8_version,
            meta_1.urn_dktk_dataelement_5,
            meta_1.urn_dktk_dataelement_5_version,
            meta_1.urn_dktk_dataelement_19,
            meta_1.urn_dktk_dataelement_19_version,
            meta_1.urn_dktk_dataelement_4,
            meta_1.urn_dktk_dataelement_4_version,
            meta_1.urn_dktk_dataelement_22,
            meta_1.urn_dktk_dataelement_22_version,
            meta_1.urn_dktk_dataelement_7,
            meta_1.urn_dktk_dataelement_7_version,
            meta_1.urn_dktk_dataelement_6,
            meta_1.urn_dktk_dataelement_6_version,
            meta_1.urn_dktk_dataelement_83,
            meta_1.urn_dktk_dataelement_83_version,
            meta_1.urn_dktk_dataelement_89,
            meta_1.urn_dktk_dataelement_89_version,
            meta_1.urn_dktk_dataelement_39,
            meta_1.urn_dktk_dataelement_39_version,
            meta_1.urn_dktk_dataelement_38,
            meta_1.urn_dktk_dataelement_38_version,
            meta_1.urn_dktk_dataelement_69,
            meta_1.urn_dktk_dataelement_69_version,
            meta_1.urn_dktk_dataelement_23,
            meta_1.urn_dktk_dataelement_23_version,
            meta_1.urn_dktk_dataelement_67,
            meta_1.urn_dktk_dataelement_67_version,
            meta_1.urn_dktk_dataelement_40,
            meta_1.urn_dktk_dataelement_40_version,
            meta_1.urn_dktk_dataelement_36,
            meta_1.urn_dktk_dataelement_36_version,
            meta_1.urn_dktk_dataelement_33,
            meta_1.urn_dktk_dataelement_33_version,
            meta_1.urn_dktk_dataelement_34,
            meta_1.urn_dktk_dataelement_34_version,
            meta_1.urn_dktk_dataelement_68,
            meta_1.urn_dktk_dataelement_68_version,
            meta_1.urn_dktk_dataelement_70,
            meta_1.urn_dktk_dataelement_70_version,
            meta_1.urn_dktk_dataelement_41,
            meta_1.urn_dktk_dataelement_41_version,
            meta_1.urn_dktk_dataelement_71,
            meta_1.urn_dktk_dataelement_71_version,
            meta_1.urn_dktk_dataelement_24,
            meta_1.urn_dktk_dataelement_24_version,
            meta_1.urn_dktk_dataelement_25,
            meta_1.urn_dktk_dataelement_25_version,
            meta_1.urn_dktk_dataelement_46,
            meta_1.urn_dktk_dataelement_46_version,
            meta_1.urn_dktk_dataelement_43,
            meta_1.urn_dktk_dataelement_43_version,
            meta_1.urn_dktk_dataelement_45,
            meta_1.urn_dktk_dataelement_45_version,
            meta_1.urn_dktk_dataelement_74,
            meta_1.urn_dktk_dataelement_74_version,
            meta_1.urn_dktk_dataelement_72,
            meta_1.urn_dktk_dataelement_72_version,
            meta_1.urn_dktk_dataelement_73,
            meta_1.urn_dktk_dataelement_73_version,
            meta_1.urn_dktk_dataelement_84,
            meta_1.urn_dktk_dataelement_84_version,
            meta_1.urn_dktk_dataelement_47,
            meta_1.urn_dktk_dataelement_47_version,
            meta_1.urn_dktk_dataelement_48,
            meta_1.urn_dktk_dataelement_48_version,
            meta_1.urn_dktk_dataelement_53,
            meta_1.urn_dktk_dataelement_53_version,
            meta_1.urn_dktk_dataelement_99,
            meta_1.urn_dktk_dataelement_99_version,
            meta_1.urn_dktk_dataelement_101,
            meta_1.urn_dktk_dataelement_101_version,
            meta_1.urn_dktk_dataelement_100,
            meta_1.urn_dktk_dataelement_100_version,
            meta_1.urn_dktk_dataelement_98,
            meta_1.urn_dktk_dataelement_98_version
           FROM public.mds_k meta_1
          WHERE (((meta_1.urn_dktk_dataelement_21 IS NOT NULL) OR (meta_1.urn_dktk_dataelement_77 IS NOT NULL)) OR (meta_1.urn_dktk_dataelement_98 IS NOT NULL))) meta ON ((single.parent_id = meta.parent_id)))
     LEFT JOIN ( SELECT prog_1.id,
            prog_1.version,
            prog_1.parent_id,
            prog_1.mds_k_site_id,
            prog_1.mds_k_teiler_id,
            prog_1.mds_k_id,
            prog_1.urn_dktk_dataelement_54,
            prog_1.urn_dktk_dataelement_54_version,
            prog_1.urn_dktk_dataelement_26,
            prog_1.urn_dktk_dataelement_26_version,
            prog_1.urn_dktk_dataelement_1,
            prog_1.urn_dktk_dataelement_1_version,
            prog_1.urn_dktk_dataelement_80,
            prog_1.urn_dktk_dataelement_80_version,
            prog_1.urn_dktk_dataelement_87,
            prog_1.urn_dktk_dataelement_87_version,
            prog_1.urn_dktk_dataelement_79,
            prog_1.urn_dktk_dataelement_79_version,
            prog_1.urn_dktk_dataelement_86,
            prog_1.urn_dktk_dataelement_86_version,
            prog_1.urn_dktk_dataelement_78,
            prog_1.urn_dktk_dataelement_78_version,
            prog_1.urn_dktk_dataelement_85,
            prog_1.urn_dktk_dataelement_85_version,
            prog_1.urn_dktk_dataelement_2,
            prog_1.urn_dktk_dataelement_2_version,
            prog_1.urn_dktk_dataelement_10,
            prog_1.urn_dktk_dataelement_10_version,
            prog_1.urn_dktk_dataelement_81,
            prog_1.urn_dktk_dataelement_81_version,
            prog_1.urn_dktk_dataelement_18,
            prog_1.urn_dktk_dataelement_18_version,
            prog_1.urn_dktk_dataelement_82,
            prog_1.urn_dktk_dataelement_82_version,
            prog_1.urn_dktk_dataelement_28,
            prog_1.urn_dktk_dataelement_28_version,
            prog_1.urn_dktk_dataelement_77,
            prog_1.urn_dktk_dataelement_77_version,
            prog_1.urn_dktk_dataelement_21,
            prog_1.urn_dktk_dataelement_21_version,
            prog_1.urn_dktk_dataelement_29,
            prog_1.urn_dktk_dataelement_29_version,
            prog_1.urn_dktk_dataelement_20,
            prog_1.urn_dktk_dataelement_20_version,
            prog_1.urn_dktk_dataelement_9,
            prog_1.urn_dktk_dataelement_9_version,
            prog_1.urn_dktk_dataelement_3,
            prog_1.urn_dktk_dataelement_3_version,
            prog_1.urn_dktk_dataelement_8,
            prog_1.urn_dktk_dataelement_8_version,
            prog_1.urn_dktk_dataelement_5,
            prog_1.urn_dktk_dataelement_5_version,
            prog_1.urn_dktk_dataelement_19,
            prog_1.urn_dktk_dataelement_19_version,
            prog_1.urn_dktk_dataelement_4,
            prog_1.urn_dktk_dataelement_4_version,
            prog_1.urn_dktk_dataelement_22,
            prog_1.urn_dktk_dataelement_22_version,
            prog_1.urn_dktk_dataelement_7,
            prog_1.urn_dktk_dataelement_7_version,
            prog_1.urn_dktk_dataelement_6,
            prog_1.urn_dktk_dataelement_6_version,
            prog_1.urn_dktk_dataelement_83,
            prog_1.urn_dktk_dataelement_83_version,
            prog_1.urn_dktk_dataelement_89,
            prog_1.urn_dktk_dataelement_89_version,
            prog_1.urn_dktk_dataelement_39,
            prog_1.urn_dktk_dataelement_39_version,
            prog_1.urn_dktk_dataelement_38,
            prog_1.urn_dktk_dataelement_38_version,
            prog_1.urn_dktk_dataelement_69,
            prog_1.urn_dktk_dataelement_69_version,
            prog_1.urn_dktk_dataelement_23,
            prog_1.urn_dktk_dataelement_23_version,
            prog_1.urn_dktk_dataelement_67,
            prog_1.urn_dktk_dataelement_67_version,
            prog_1.urn_dktk_dataelement_40,
            prog_1.urn_dktk_dataelement_40_version,
            prog_1.urn_dktk_dataelement_36,
            prog_1.urn_dktk_dataelement_36_version,
            prog_1.urn_dktk_dataelement_33,
            prog_1.urn_dktk_dataelement_33_version,
            prog_1.urn_dktk_dataelement_34,
            prog_1.urn_dktk_dataelement_34_version,
            prog_1.urn_dktk_dataelement_68,
            prog_1.urn_dktk_dataelement_68_version,
            prog_1.urn_dktk_dataelement_70,
            prog_1.urn_dktk_dataelement_70_version,
            prog_1.urn_dktk_dataelement_41,
            prog_1.urn_dktk_dataelement_41_version,
            prog_1.urn_dktk_dataelement_71,
            prog_1.urn_dktk_dataelement_71_version,
            prog_1.urn_dktk_dataelement_24,
            prog_1.urn_dktk_dataelement_24_version,
            prog_1.urn_dktk_dataelement_25,
            prog_1.urn_dktk_dataelement_25_version,
            prog_1.urn_dktk_dataelement_46,
            prog_1.urn_dktk_dataelement_46_version,
            prog_1.urn_dktk_dataelement_43,
            prog_1.urn_dktk_dataelement_43_version,
            prog_1.urn_dktk_dataelement_45,
            prog_1.urn_dktk_dataelement_45_version,
            prog_1.urn_dktk_dataelement_74,
            prog_1.urn_dktk_dataelement_74_version,
            prog_1.urn_dktk_dataelement_72,
            prog_1.urn_dktk_dataelement_72_version,
            prog_1.urn_dktk_dataelement_73,
            prog_1.urn_dktk_dataelement_73_version,
            prog_1.urn_dktk_dataelement_84,
            prog_1.urn_dktk_dataelement_84_version,
            prog_1.urn_dktk_dataelement_47,
            prog_1.urn_dktk_dataelement_47_version,
            prog_1.urn_dktk_dataelement_48,
            prog_1.urn_dktk_dataelement_48_version,
            prog_1.urn_dktk_dataelement_53,
            prog_1.urn_dktk_dataelement_53_version,
            prog_1.urn_dktk_dataelement_99,
            prog_1.urn_dktk_dataelement_99_version,
            prog_1.urn_dktk_dataelement_101,
            prog_1.urn_dktk_dataelement_101_version,
            prog_1.urn_dktk_dataelement_100,
            prog_1.urn_dktk_dataelement_100_version,
            prog_1.urn_dktk_dataelement_98,
            prog_1.urn_dktk_dataelement_98_version
           FROM public.mds_k prog_1
          WHERE (((((((((((((((((prog_1.urn_dktk_dataelement_23 IS NOT NULL) OR (prog_1.urn_dktk_dataelement_24 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_25 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_33 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_34 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_36 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_38 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_39 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_40 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_43 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_45 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_46 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_67 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_69 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_72 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_73 IS NOT NULL)) OR (prog_1.urn_dktk_dataelement_74 IS NOT NULL))) prog ON ((single.parent_id = prog.parent_id)))
     LEFT JOIN ( SELECT tnm_1.id,
            tnm_1.version,
            tnm_1.parent_id,
            tnm_1.mds_k_site_id,
            tnm_1.mds_k_teiler_id,
            tnm_1.mds_k_id,
            tnm_1.urn_dktk_dataelement_54,
            tnm_1.urn_dktk_dataelement_54_version,
            tnm_1.urn_dktk_dataelement_26,
            tnm_1.urn_dktk_dataelement_26_version,
            tnm_1.urn_dktk_dataelement_1,
            tnm_1.urn_dktk_dataelement_1_version,
            tnm_1.urn_dktk_dataelement_80,
            tnm_1.urn_dktk_dataelement_80_version,
            tnm_1.urn_dktk_dataelement_87,
            tnm_1.urn_dktk_dataelement_87_version,
            tnm_1.urn_dktk_dataelement_79,
            tnm_1.urn_dktk_dataelement_79_version,
            tnm_1.urn_dktk_dataelement_86,
            tnm_1.urn_dktk_dataelement_86_version,
            tnm_1.urn_dktk_dataelement_78,
            tnm_1.urn_dktk_dataelement_78_version,
            tnm_1.urn_dktk_dataelement_85,
            tnm_1.urn_dktk_dataelement_85_version,
            tnm_1.urn_dktk_dataelement_2,
            tnm_1.urn_dktk_dataelement_2_version,
            tnm_1.urn_dktk_dataelement_10,
            tnm_1.urn_dktk_dataelement_10_version,
            tnm_1.urn_dktk_dataelement_81,
            tnm_1.urn_dktk_dataelement_81_version,
            tnm_1.urn_dktk_dataelement_18,
            tnm_1.urn_dktk_dataelement_18_version,
            tnm_1.urn_dktk_dataelement_82,
            tnm_1.urn_dktk_dataelement_82_version,
            tnm_1.urn_dktk_dataelement_28,
            tnm_1.urn_dktk_dataelement_28_version,
            tnm_1.urn_dktk_dataelement_77,
            tnm_1.urn_dktk_dataelement_77_version,
            tnm_1.urn_dktk_dataelement_21,
            tnm_1.urn_dktk_dataelement_21_version,
            tnm_1.urn_dktk_dataelement_29,
            tnm_1.urn_dktk_dataelement_29_version,
            tnm_1.urn_dktk_dataelement_20,
            tnm_1.urn_dktk_dataelement_20_version,
            tnm_1.urn_dktk_dataelement_9,
            tnm_1.urn_dktk_dataelement_9_version,
            tnm_1.urn_dktk_dataelement_3,
            tnm_1.urn_dktk_dataelement_3_version,
            tnm_1.urn_dktk_dataelement_8,
            tnm_1.urn_dktk_dataelement_8_version,
            tnm_1.urn_dktk_dataelement_5,
            tnm_1.urn_dktk_dataelement_5_version,
            tnm_1.urn_dktk_dataelement_19,
            tnm_1.urn_dktk_dataelement_19_version,
            tnm_1.urn_dktk_dataelement_4,
            tnm_1.urn_dktk_dataelement_4_version,
            tnm_1.urn_dktk_dataelement_22,
            tnm_1.urn_dktk_dataelement_22_version,
            tnm_1.urn_dktk_dataelement_7,
            tnm_1.urn_dktk_dataelement_7_version,
            tnm_1.urn_dktk_dataelement_6,
            tnm_1.urn_dktk_dataelement_6_version,
            tnm_1.urn_dktk_dataelement_83,
            tnm_1.urn_dktk_dataelement_83_version,
            tnm_1.urn_dktk_dataelement_89,
            tnm_1.urn_dktk_dataelement_89_version,
            tnm_1.urn_dktk_dataelement_39,
            tnm_1.urn_dktk_dataelement_39_version,
            tnm_1.urn_dktk_dataelement_38,
            tnm_1.urn_dktk_dataelement_38_version,
            tnm_1.urn_dktk_dataelement_69,
            tnm_1.urn_dktk_dataelement_69_version,
            tnm_1.urn_dktk_dataelement_23,
            tnm_1.urn_dktk_dataelement_23_version,
            tnm_1.urn_dktk_dataelement_67,
            tnm_1.urn_dktk_dataelement_67_version,
            tnm_1.urn_dktk_dataelement_40,
            tnm_1.urn_dktk_dataelement_40_version,
            tnm_1.urn_dktk_dataelement_36,
            tnm_1.urn_dktk_dataelement_36_version,
            tnm_1.urn_dktk_dataelement_33,
            tnm_1.urn_dktk_dataelement_33_version,
            tnm_1.urn_dktk_dataelement_34,
            tnm_1.urn_dktk_dataelement_34_version,
            tnm_1.urn_dktk_dataelement_68,
            tnm_1.urn_dktk_dataelement_68_version,
            tnm_1.urn_dktk_dataelement_70,
            tnm_1.urn_dktk_dataelement_70_version,
            tnm_1.urn_dktk_dataelement_41,
            tnm_1.urn_dktk_dataelement_41_version,
            tnm_1.urn_dktk_dataelement_71,
            tnm_1.urn_dktk_dataelement_71_version,
            tnm_1.urn_dktk_dataelement_24,
            tnm_1.urn_dktk_dataelement_24_version,
            tnm_1.urn_dktk_dataelement_25,
            tnm_1.urn_dktk_dataelement_25_version,
            tnm_1.urn_dktk_dataelement_46,
            tnm_1.urn_dktk_dataelement_46_version,
            tnm_1.urn_dktk_dataelement_43,
            tnm_1.urn_dktk_dataelement_43_version,
            tnm_1.urn_dktk_dataelement_45,
            tnm_1.urn_dktk_dataelement_45_version,
            tnm_1.urn_dktk_dataelement_74,
            tnm_1.urn_dktk_dataelement_74_version,
            tnm_1.urn_dktk_dataelement_72,
            tnm_1.urn_dktk_dataelement_72_version,
            tnm_1.urn_dktk_dataelement_73,
            tnm_1.urn_dktk_dataelement_73_version,
            tnm_1.urn_dktk_dataelement_84,
            tnm_1.urn_dktk_dataelement_84_version,
            tnm_1.urn_dktk_dataelement_47,
            tnm_1.urn_dktk_dataelement_47_version,
            tnm_1.urn_dktk_dataelement_48,
            tnm_1.urn_dktk_dataelement_48_version,
            tnm_1.urn_dktk_dataelement_53,
            tnm_1.urn_dktk_dataelement_53_version,
            tnm_1.urn_dktk_dataelement_99,
            tnm_1.urn_dktk_dataelement_99_version,
            tnm_1.urn_dktk_dataelement_101,
            tnm_1.urn_dktk_dataelement_101_version,
            tnm_1.urn_dktk_dataelement_100,
            tnm_1.urn_dktk_dataelement_100_version,
            tnm_1.urn_dktk_dataelement_98,
            tnm_1.urn_dktk_dataelement_98_version
           FROM public.mds_k tnm_1
          WHERE ((((((((((((((tnm_1.urn_dktk_dataelement_10 IS NOT NULL) OR (tnm_1.urn_dktk_dataelement_100 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_101 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_18 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_2 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_20 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_3 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_78 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_79 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_80 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_81 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_82 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_89 IS NOT NULL)) OR (tnm_1.urn_dktk_dataelement_99 IS NOT NULL))) tnm ON ((single.parent_id = tnm.parent_id)))
  WITH NO DATA;


ALTER TABLE public.mds_k_view OWNER TO dktktest;

--
-- Name: patient; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.patient (
    id integer NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    patient_site_id character varying(255) NOT NULL,
    patient_teiler_id character varying(255) NOT NULL,
    patient_id character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    updated_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.patient OWNER TO dktktest;

--
-- Name: patient_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.patient_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patient_id_seq OWNER TO dktktest;

--
-- Name: patient_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.patient_id_seq OWNED BY public.patient.id;


--
-- Name: query; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.query (
    id bigint NOT NULL,
    version bigint NOT NULL,
    group_by character varying(255) NOT NULL,
    mode character varying(255) NOT NULL,
    name character varying(255),
    query character varying(255),
    save_date timestamp without time zone,
    type character varying(255) NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.query OWNER TO dktktest;

--
-- Name: query_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.query_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_id_seq OWNER TO dktktest;

--
-- Name: query_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.query_id_seq OWNED BY public.query.id;


--
-- Name: query_public; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.query_public (
    id bigint NOT NULL,
    version bigint DEFAULT 0 NOT NULL,
    name character varying(150),
    query character varying(1000) NOT NULL,
    result_patients integer,
    result_samples integer,
    chart_results character varying(500),
    created timestamp without time zone,
    run_date timestamp without time zone,
    counter integer,
    update_date timestamp without time zone,
    is_attribute boolean NOT NULL
);


ALTER TABLE public.query_public OWNER TO dktktest;

--
-- Name: query_public_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.query_public_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.query_public_id_seq OWNER TO dktktest;

--
-- Name: query_public_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.query_public_id_seq OWNED BY public.query_public.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    version bigint NOT NULL,
    authority character varying(255) NOT NULL
);


ALTER TABLE public.role OWNER TO dktktest;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO dktktest;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: upload_time; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.upload_time (
    id bigint NOT NULL,
    version bigint NOT NULL,
    site character varying(255) NOT NULL,
    teiler character varying(255) NOT NULL,
    last_upload character varying(255) NOT NULL
);


ALTER TABLE public.upload_time OWNER TO dktktest;

--
-- Name: upload_time_id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.upload_time_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.upload_time_id_seq OWNER TO dktktest;

--
-- Name: upload_time_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.upload_time_id_seq OWNED BY public.upload_time.id;


--
-- Name: user_; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.user_ (
    id bigint NOT NULL,
    version bigint NOT NULL,
    account_expired boolean NOT NULL,
    account_locked boolean NOT NULL,
    display_name character varying(255) NOT NULL,
    enabled boolean NOT NULL,
    mail character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    password_expired boolean NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE public.user_ OWNER TO dktktest;

--
-- Name: user__id_seq; Type: SEQUENCE; Schema: public; Owner: dktktest
--

CREATE SEQUENCE public.user__id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user__id_seq OWNER TO dktktest;

--
-- Name: user__id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dktktest
--

ALTER SEQUENCE public.user__id_seq OWNED BY public.user_.id;


--
-- Name: user_role; Type: TABLE; Schema: public; Owner: dktktest
--

CREATE TABLE public.user_role (
    role_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.user_role OWNER TO dktktest;

--
-- Name: attribute id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.attribute ALTER COLUMN id SET DEFAULT nextval('public.attribute_id_seq'::regclass);


--
-- Name: entity_type id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.entity_type ALTER COLUMN id SET DEFAULT nextval('public.entity_type_id_seq'::regclass);


--
-- Name: group_ id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.group_ ALTER COLUMN id SET DEFAULT nextval('public.group__id_seq'::regclass);


--
-- Name: list_item id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.list_item ALTER COLUMN id SET DEFAULT nextval('public.list_item_id_seq'::regclass);


--
-- Name: list_of_values id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.list_of_values ALTER COLUMN id SET DEFAULT nextval('public.list_of_values_id_seq'::regclass);


--
-- Name: mds_b id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.mds_b ALTER COLUMN id SET DEFAULT nextval('public.mds_b_id_seq'::regclass);


--
-- Name: mds_k id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.mds_k ALTER COLUMN id SET DEFAULT nextval('public.mds_k_id_seq'::regclass);


--
-- Name: patient id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.patient ALTER COLUMN id SET DEFAULT nextval('public.patient_id_seq'::regclass);


--
-- Name: query id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.query ALTER COLUMN id SET DEFAULT nextval('public.query_id_seq'::regclass);


--
-- Name: query_public id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.query_public ALTER COLUMN id SET DEFAULT nextval('public.query_public_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: upload_time id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.upload_time ALTER COLUMN id SET DEFAULT nextval('public.upload_time_id_seq'::regclass);


--
-- Name: user_ id; Type: DEFAULT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.user_ ALTER COLUMN id SET DEFAULT nextval('public.user__id_seq'::regclass);


--
-- Name: attribute attribute_key_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_key_key UNIQUE (key);


--
-- Name: attribute attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.attribute
    ADD CONSTRAINT attribute_pkey PRIMARY KEY (id);


--
-- Name: entity_type entity_type_key_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.entity_type
    ADD CONSTRAINT entity_type_key_key UNIQUE (key);


--
-- Name: entity_type entity_type_name_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.entity_type
    ADD CONSTRAINT entity_type_name_key UNIQUE (name);


--
-- Name: entity_type entity_type_order__key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.entity_type
    ADD CONSTRAINT entity_type_order__key UNIQUE (order_);


--
-- Name: entity_type entity_type_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.entity_type
    ADD CONSTRAINT entity_type_pkey PRIMARY KEY (id);


--
-- Name: group_ group__entity_type_id_order__key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.group_
    ADD CONSTRAINT group__entity_type_id_order__key UNIQUE (entity_type_id, order_);


--
-- Name: group_ group__name_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.group_
    ADD CONSTRAINT group__name_key UNIQUE (name);


--
-- Name: group_ group__pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.group_
    ADD CONSTRAINT group__pkey PRIMARY KEY (id);


--
-- Name: group_attribute group_attribute_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT group_attribute_pkey PRIMARY KEY (group_id, attribute_id);


--
-- Name: list_item list_item_list_of_values_id_key_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.list_item
    ADD CONSTRAINT list_item_list_of_values_id_key_key UNIQUE (list_of_values_id, key);


--
-- Name: list_item list_item_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.list_item
    ADD CONSTRAINT list_item_pkey PRIMARY KEY (id);


--
-- Name: list_of_values list_of_values_name_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.list_of_values
    ADD CONSTRAINT list_of_values_name_key UNIQUE (name);


--
-- Name: list_of_values list_of_values_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.list_of_values
    ADD CONSTRAINT list_of_values_pkey PRIMARY KEY (id);


--
-- Name: mds_b mds_b_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.mds_b
    ADD CONSTRAINT mds_b_pkey PRIMARY KEY (id);


--
-- Name: mds_k mds_k_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.mds_k
    ADD CONSTRAINT mds_k_pkey PRIMARY KEY (id);


--
-- Name: patient patient_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.patient
    ADD CONSTRAINT patient_pkey PRIMARY KEY (id);


--
-- Name: query query_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.query
    ADD CONSTRAINT query_pkey PRIMARY KEY (id);


--
-- Name: query_public query_public_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.query_public
    ADD CONSTRAINT query_public_pkey PRIMARY KEY (id);


--
-- Name: role role_authority_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_authority_key UNIQUE (authority);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: upload_time upload_time_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.upload_time
    ADD CONSTRAINT upload_time_pkey PRIMARY KEY (id);


--
-- Name: upload_time upload_time_site_teiler_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.upload_time
    ADD CONSTRAINT upload_time_site_teiler_key UNIQUE (site, teiler);


--
-- Name: user_ user__pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.user_
    ADD CONSTRAINT user__pkey PRIMARY KEY (id);


--
-- Name: user_ user__username_key; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.user_
    ADD CONSTRAINT user__username_key UNIQUE (username);


--
-- Name: user_role user_role_pkey; Type: CONSTRAINT; Schema: public; Owner: dktktest
--

ALTER TABLE ONLY public.user_role
    ADD CONSTRAINT user_role_pkey PRIMARY KEY (role_id, user_id);


--
-- Name: mds_b_parent_id_idx; Type: INDEX; Schema: public; Owner: dktktest
--

CREATE INDEX mds_b_parent_id_idx ON public.mds_b USING btree (parent_id);


--
-- Name: mds_k_parent_id_idx; Type: INDEX; Schema: public; Owner: dktktest
--

CREATE INDEX mds_k_parent_id_idx ON public.mds_k USING btree (parent_id);


--
-- Name: mds_k_urn_dktk_dataelement_1_index; Type: INDEX; Schema: public; Owner: dktktest
--

CREATE INDEX mds_k_urn_dktk_dataelement_1_index ON public.mds_k USING btree (urn_dktk_dataelement_1);


--
-- Name: mds_k_urn_dktk_dataelement_29_index; Type: INDEX; Schema: public; Owner: dktktest
--

CREATE INDEX mds_k_urn_dktk_dataelement_29_index ON public.mds_k USING btree (urn_dktk_dataelement_29);


--
-- Name: mds_k_view_parent_id_idx; Type: INDEX; Schema: public; Owner: dktktest
--

CREATE INDEX mds_k_view_parent_id_idx ON public.mds_k_view USING btree (parent_id);


--
-- Name: patient_id_idx; Type: INDEX; Schema: public; Owner: dktktest
--

CREATE INDEX patient_id_idx ON public.patient USING btree (id);




--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

