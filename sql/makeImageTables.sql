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
    s_ra double precision NOT NULL,                  -- M. Center of field/image
    s_dec double precision NOT NULL,                 -- M. Center of field/image
    is_public boolean NOT NULL DEFAULT FALSE,        -- C. Is this record available to the public?
    obs_collection character varying(64),            -- M. Collection name
    file_name character varying(64) NOT NULL UNIQUE, -- C. Name of FITS file
    file_size bigint NOT NULL                        -- C. size of FITS file in bytes
      CONSTRAINT non_empty_file CHECK (file_size > 0),
    md jsonb                                         -- C. All image metadata
);

ALTER TABLE imgmd OWNER TO astrolabe;


--
-- Name: imgmd_q3c_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX q3c_idx ON imgmd USING btree(q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE imgmd CLUSTER ON q3c_idx;


--
-- Name: s_dec_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX s_dec_idx ON imgmd USING btree (s_dec);


--
-- Name: s_ra_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX s_ra_idx ON imgmd USING btree (s_ra);


--
-- Name: is_public_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX is_public_idx ON imgmd USING btree (is_public);


--
-- Name: obs_coll_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX obs_coll_idx ON imgmd USING btree (obs_collection);


--
-- Name: md_idx; Type: INDEX; Schema: hyb; Owner: astrolabe
--
CREATE INDEX md_idx ON imgmd USING GIN (md);
