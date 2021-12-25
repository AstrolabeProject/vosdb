--
-- Make Image Metadata (JSON) tables and indices in the VOS database.
--   This script assumes that the database 'vos', astro users, and the schema 'hyb'
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

SET search_path TO hyb, public;


--
-- Name: imgmd; Type: TABLE; Schema: hyb; Owner: astrolabe
--
--    Legend: M=Mandatory, O=Optional (ObsCore v1.1),
--            C=Custom,  D=DALserver-specific,  F=FITS (Standard 4, 8/13/2018),  J=JWST-specific
--
CREATE TABLE hyb.imgmd (
    md5sum character(32) PRIMARY KEY,         -- C. MD5 hash of the image file
    s_ra double precision NOT NULL,           -- M. Center of field/image
    s_dec double precision NOT NULL,          -- M. Center of field/image
    is_public boolean NOT NULL DEFAULT FALSE, -- C. Is this record available to the public?
    obs_collection character varying(64),     -- M. Collection name
    md jsonb                                  -- C. All image metadata
);

ALTER TABLE hyb.imgmd OWNER TO astrolabe;


--
-- Name: hyb_q3c_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX hyb_q3c_idx ON hyb.imgmd USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE hyb.imgmd CLUSTER ON hyb_q3c_idx;


--
-- Name: hyb_s_dec_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX hyb_s_dec_idx ON hyb.imgmd USING btree (s_dec);


--
-- Name: hyb_s_ra_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX hyb_s_ra_idx ON hyb.imgmd USING btree (s_ra);


--
-- Name: hyb_obs_coll_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX hyb_obs_coll_idx ON hyb.imgmd USING btree (obs_collection);


--
-- Name: hyb_is_public_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX hyb_is_public_idx ON hyb.imgmd USING btree (is_public);


--
-- Name: hyb_md_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX hyb_md_idx ON hyb.imgmd USING GIN (md);
