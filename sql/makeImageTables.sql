--
-- Make Image Metadata (JSON) tables and indices in the ALWS database.
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
CREATE TABLE imgmd (
    md5sum character(32) PRIMARY KEY,                 -- MD5 hash of the image file
    file_info character varying(128) NOT NULL UNIQUE, -- Name of FITS file
    ra double precision NOT NULL,                     -- Center of field/image
    "dec" double precision NOT NULL,                  -- Center of field/image
    is_public boolean NOT NULL DEFAULT FALSE,         -- Is this record available to the public?
    collection character varying(64) NOT NULL,        -- Collection name
    filter character varying (16),                    -- Name of filter element used
    md jsonb                                          -- All image metadata
);

ALTER TABLE imgmd OWNER TO astrolabe;


--
-- Name: imgmd_q3c_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_q3c_idx ON imgmd USING btree(q3c_ang2ipix(ra, dec));

ALTER TABLE imgmd CLUSTER ON imgmd_q3c_idx;


--
-- Name: imgmd_dec_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_dec_idx ON imgmd USING btree (dec);


--
-- Name: imgmd_ra_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_ra_idx ON imgmd USING btree (ra);


--
-- Name: imgmd_is_public_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_is_public_idx ON imgmd USING btree (is_public);


--
-- Name: imgmd_obs_coll_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_obs_coll_idx ON imgmd USING btree (collection);


--
-- Name: imgmd_filt_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_filt_idx ON imgmd USING btree (filter);


--
-- Name: imgmd_md_idx; Type: INDEX; Schema: public; Owner: astrolabe
--
CREATE INDEX imgmd_md_idx ON imgmd USING GIN (md);
