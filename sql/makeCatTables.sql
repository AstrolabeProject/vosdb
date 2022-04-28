--
-- Make Catalog and CatRow tables and indices in the VOS database.
--   This script assumes that the database 'alws', and astro users
--   have been created and that this script is run within that DB.
--

SET check_function_bodies = false;
SET client_encoding = 'UTF8';
SET client_min_messages = warning;
SET idle_in_transaction_session_timeout = 0;
SET lock_timeout = 0;
SET row_security = off;
SET standard_conforming_strings = on;
SET statement_timeout = 0;
SET timezone = 'UTC';


--
-- Name: imgmd; Type: TABLE; Schema: public; Owner: astrolabe
--
CREATE TABLE catalogs (
    id integer PRIMARY KEY,                         -- auto-incremented primary key
    name character varying(64) NOT NULL UNIQUE,     -- unique catalog name
    description character varying(128) NOT NULL,    -- catalog description
    file_info character varying(128) NOT NULL,      -- name of CSV catalog file
    md5sum character(32) NOT NULL                   -- MD5 hash of the catalog file
);

ALTER TABLE catalogs OWNER TO astrolabe;


--
-- Name: catalogs_id_seq; Type: SEQUENCE; Schema: public; Owner: astrolabe
--
CREATE SEQUENCE catalogs_id_seq
    AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE catalogs_id_seq OWNER TO astrolabe;


--
-- Name: catalogs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: astrolabe
--
ALTER SEQUENCE catalogs_id_seq OWNED BY catalogs.id;


--
-- Name: catalogs id; Type: DEFAULT; Schema: public; Owner: astrolabe
--
ALTER TABLE ONLY catalogs
    ALTER COLUMN id SET DEFAULT nextval('catalogs_id_seq'::regclass);


--
-- Name: catalogs_name_idx_like; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catalogs_name_idx_like ON catalogs USING btree (name varchar_pattern_ops);



--
-- Name: catrows; Type: TABLE; Schema: public; Owner: astrolabe
--
CREATE TABLE catrows (
    id bigint PRIMARY KEY,                          -- auto-incremented primary key
    ra double precision NOT NULL,                   -- right ascension decimal
    "dec" double precision NOT NULL,                -- declination decimal
    magnitude double precision NOT NULL,            -- primary magnitude field of catalog
    is_public boolean NOT NULL DEFAULT FALSE,       -- publically released? (not currently used)
    cols jsonb,                                     -- ingested catalog data
    catalog_id integer NOT NULL                     -- id of parent catalog record
);

ALTER TABLE catrows OWNER TO astrolabe;


--
-- Name: catrows_id_seq; Type: SEQUENCE; Schema: public; Owner: astrolabe
--
CREATE SEQUENCE catrows_id_seq
    START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE catrows_id_seq OWNER TO astrolabe;


--
-- Name: catrows_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: astrolabe
--
ALTER SEQUENCE catrows_id_seq OWNED BY catrows.id;


--
-- Name: catrows id; Type: DEFAULT; Schema: public; Owner: astrolabe
--
ALTER TABLE ONLY catrows
    ALTER COLUMN id SET DEFAULT nextval('catrows_id_seq'::regclass);


--
-- Name: catrows_catalog_id_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_catalog_id_idx ON catrows USING btree (catalog_id);


--
-- Name: catrows catrows_catalog_id_idx_fk_catalogs_id; Type: FK CONSTRAINT; Schema: public; Owner: astrolabe
--
ALTER TABLE ONLY catrows
    ADD CONSTRAINT catrows_catalog_id_idx_fk_catalogs_id FOREIGN KEY (catalog_id)
    REFERENCES catalogs(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: catrows_q3c_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_q3c_idx ON catrows USING btree(q3c_ang2ipix(ra, dec));

ALTER TABLE catrows CLUSTER ON catrows_q3c_idx;


--
-- Name: catrows_dec_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_dec_idx ON catrows USING btree (dec);


--
-- Name: catrows_ra_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_ra_idx ON catrows USING btree (ra);


--
-- Name: catrows_mag_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_mag_idx ON catrows USING btree (magnitude);


--
-- Name: catrows_is_public_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_is_public_idx ON catrows USING btree (is_public);


--
-- Name: catrows_cols_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX catrows_cols_idx ON catrows USING GIN (cols);
