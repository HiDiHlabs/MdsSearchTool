CREATE TABLE entity_name (
    id integer NOT NULL,
    parent_id integer,
    name character varying(255) NOT NULL
);

CREATE TABLE entity (
    id bigint NOT NULL,
    parent_id bigint,
    entity_name_id integer
);

CREATE TABLE dataelement_datatype (
    id integer NOT NULL,
    datatype character varying(255) NOT NULL
);

CREATE TABLE dataelement_urn (
    id integer NOT NULL,
    --urn character varying(255) NOT NULL,
    urn_namespace character varying(255) NOT NULL,
    urn_id integer NOT NULL,
    urn_version integer NOT NULL,
    dataelement_datatype_id integer
);

CREATE TABLE dataelement (
    id bigint NOT NULL,
    dataelement_urn_id integer NOT NULL,
    string_value character varying(255),
    integer_value integer,
    date_value timestamp, --without time zone
    bool_value boolean
);

--SELECT id, urn_namespace, urn_id, dataelement_datatype_id, max(urn_version) AS version FROM dataelement_urn GROUP BY urn_version;
--SELECT

CREATE MATERIALIZED VIEW central_search_base_view AS

WITH DATA;
