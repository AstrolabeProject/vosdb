--
-- Make Image Metadata (JSON) tables and indices in the VOS database.
--   This script assumes that the database 'alws', and astro users
--   have been created and that this script is run within that DB and schema.
--

SET check_function_bodies = false;
SET client_min_messages = warning;
SET idle_in_transaction_session_timeout = 0;
SET lock_timeout = 0;
SET row_security = off;
SET standard_conforming_strings = on;
SET statement_timeout = 0;
SET timezone = 'UTC';


--
-- Name: imgmd; Type: TABLE; Schema: hyb; Owner: astrolabe
--
--    Legend: M=Mandatory, O=Optional (ObsCore v1.1),
--            C=Custom,  F=FITS (Standard 4, 8/13/2018),  J=JWST-specific
--
CREATE TABLE imgmd (
    md5sum character(32) PRIMARY KEY,                -- C. MD5 hash of the image file
    file_info character varying(128) NOT NULL UNIQUE, -- C. Name of FITS file
    s_ra double precision NOT NULL,                  -- M. Center of field/image
    s_dec double precision NOT NULL,                 -- M. Center of field/image
    is_public boolean NOT NULL DEFAULT FALSE,        -- C. Is this record available to the public?
    obs_collection character varying(64) NOT NULL,   -- M. Collection name
    filter character varying (16),                   -- J. Name of filter element used
    md jsonb                                         -- C. All image metadata
);

ALTER TABLE imgmd OWNER TO astrolabe;


--
-- Name: imgmd_q3c_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_q3c_idx ON imgmd USING btree(q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE imgmd CLUSTER ON imgmd_q3c_idx;


--
-- Name: imgmd_s_dec_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_s_dec_idx ON imgmd USING btree (s_dec);


--
-- Name: imgmd_s_ra_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_s_ra_idx ON imgmd USING btree (s_ra);


--
-- Name: imgmd_is_public_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_is_public_idx ON imgmd USING btree (is_public);


--
-- Name: imgmd_obs_coll_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_obs_coll_idx ON imgmd USING btree (obs_collection);


--
-- Name: imgmd_filt_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_filt_idx ON imgmd USING btree (filter);


--
-- Name: imgmd_md_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX imgmd_md_idx ON imgmd USING GIN (md);
