--
-- Make Hybrid (SQL/JSON) tables and indices for image metadata in the VOS database.
--   This script assumes that the database 'vos', astro users, and the schema 'sia'
--   have all been created and that this script is run within that DB and schema.
--

SET check_function_bodies = false;
SET client_min_messages = warning;
SET idle_in_transaction_session_timeout = 0;
SET lock_timeout = 0;
SET row_security = off;
SET standard_conforming_strings = on;
SET statement_timeout = 0;
SET timezone = 'UTC';

SET search_path TO sia, public;


--
-- Name: hybrid; Type: TABLE; Schema: sia; Owner: astrolabe
--
--    Legend: M=Mandatory, O=Optional (ObsCore v1.1),
--            C=Custom,  D=DALserver-specific,  F=FITS (Standard 4, 8/13/2018),  J=JWST-specific
--
CREATE TABLE sia.hybrid (
    id serial primary key,                  -- D. Auto-incrementing primary key
    s_dec double precision,                 -- M. Center of field/image
    s_ra double precision,                  -- M. Center of field/image
    obs_collection character varying(64),   -- M. Data collection name
    is_public integer,                      -- C. Is this record available to the public?
    metadata jsonb                          -- C. All image metadata
);

ALTER TABLE sia.hybrid OWNER TO astrolabe;


--
-- Name: hyb_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX hyb_q3c_idx ON sia.hybrid USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.hybrid CLUSTER ON hyb_q3c_idx;


--
-- Name: hyb_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX hyb_s_dec_idx ON sia.hybrid USING btree (s_dec);


--
-- Name: hyb_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX hyb_s_ra_idx ON sia.hybrid USING btree (s_ra);


--
-- Name: hyb_obs_coll_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX hyb_obs_coll_idx ON sia.hybrid USING btree (obs_collection);


--
-- Name: hyb_is_public_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX hyb_is_public_idx ON sia.hybrid USING btree (is_public);


--
-- Name: hyb_metadata_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX hyb_metadata_idx ON sia.hybrid USING GIN (metadata);
