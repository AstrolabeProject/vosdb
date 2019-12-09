--
-- Make catalog tables and indices for the SIA schema of the VOS database.
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
-- Name: eazy; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.eazy (
    id integer,
    s_ra double precision,
    s_dec double precision,
    z_spec double precision,
    z_a double precision,
    z_m1 double precision,
    chi_a double precision,
    l68 double precision,
    u68 double precision,
    l95 double precision,
    u95 double precision,
    l99 double precision,
    u99 double precision,
    nfilt double precision,
    q_z double precision,
    z_peak double precision,
    z_prob double precision,
    z_mc double precision
);

ALTER TABLE sia.eazy OWNER TO astrolabe;


--
-- Name: eazy_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy_q3c_idx ON sia.eazy USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.eazy CLUSTER ON eazy_q3c_idx;


--
-- Name: eazy_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy_id_idx ON sia.eazy USING btree (id);


--
-- Name: eazy_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy_s_dec_idx ON sia.eazy USING btree (s_dec);


--
-- Name: eazy_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy_s_ra_idx ON sia.eazy USING btree (s_ra);



--
-- Name: photometric; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.photometric (
    id integer,
    jaguar_id integer,
    redshift double precision,
    s_ra double precision,
    s_dec double precision,
    X double precision,
    Y double precision,
    NRC_F090W double precision,
    NRC_F090W_err double precision,
    NRC_F115W double precision,
    NRC_F115W_err double precision,
    NRC_F150W double precision,
    NRC_F150W_err double precision,
    NRC_F200W double precision,
    NRC_F200W_err double precision,
    NRC_F277W double precision,
    NRC_F277W_err double precision,
    NRC_F335M double precision,
    NRC_F335M_err double precision,
    NRC_F356W double precision,
    NRC_F356W_err double precision,
    NRC_F410M double precision,
    NRC_F410M_err double precision,
    NRC_F444W double precision,
    NRC_F444W_err double precision,
    d2d double precision
);

ALTER TABLE sia.photometric OWNER TO astrolabe;


--
-- Name: phm_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm_q3c_idx ON sia.photometric USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.photometric CLUSTER ON phm_q3c_idx;


--
-- Name: phm_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm_id_idx ON sia.photometric USING btree (id);


--
-- Name: phm_jaguar_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm_jaguar_id_idx ON sia.photometric USING btree (jaguar_id);


--
-- Name: phm_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm_s_dec_idx ON sia.photometric USING btree (s_dec);


--
-- Name: phm_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm_s_ra_idx ON sia.photometric USING btree (s_ra);
