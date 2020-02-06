--
-- Make catalog tables and indices for the mini-DataChallenge schema of the VOS database.
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
-- Name: eazy200; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.eazy200 (
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

ALTER TABLE sia.eazy200 OWNER TO astrolabe;


--
-- Name: eazy200_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy200_q3c_idx ON sia.eazy200 USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.eazy200 CLUSTER ON eazy200_q3c_idx;


--
-- Name: eazy200_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy200_id_idx ON sia.eazy200 USING btree (id);


--
-- Name: eazy200_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy200_s_dec_idx ON sia.eazy200 USING btree (s_dec);


--
-- Name: eazy200_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy200_s_ra_idx ON sia.eazy200 USING btree (s_ra);



--
-- Name: eazy356; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.eazy356 (
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

ALTER TABLE sia.eazy356 OWNER TO astrolabe;


--
-- Name: eazy356_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy356_q3c_idx ON sia.eazy356 USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.eazy356 CLUSTER ON eazy356_q3c_idx;


--
-- Name: eazy356_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy356_id_idx ON sia.eazy356 USING btree (id);


--
-- Name: eazy356_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy356_s_dec_idx ON sia.eazy356 USING btree (s_dec);


--
-- Name: eazy356_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX eazy356_s_ra_idx ON sia.eazy356 USING btree (s_ra);



--
-- Name: eazy_psf; Type: TABLE; Schema: sia; Owner: astrolabe
--
-- CREATE TABLE sia.eazy_psf (
--     id integer,
--     s_ra double precision,
--     s_dec double precision,
--     z_spec double precision,
--     z_a double precision,
--     z_m1 double precision,
--     chi_a double precision,
--     l68 double precision,
--     u68 double precision,
--     l95 double precision,
--     u95 double precision,
--     l99 double precision,
--     u99 double precision,
--     nfilt double precision,
--     q_z double precision,
--     z_peak double precision,
--     z_prob double precision,
--     z_mc double precision
-- );

-- ALTER TABLE sia.eazy_psf OWNER TO astrolabe;


--
-- Name: eazy_psf_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX eazy_psf_q3c_idx ON sia.eazy_psf USING btree (public.q3c_ang2ipix(s_ra, s_dec));

-- ALTER TABLE sia.eazy_psf CLUSTER ON eazy_psf_q3c_idx;


--
-- Name: eazy_psf_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX eazy_psf_id_idx ON sia.eazy_psf USING btree (id);


--
-- Name: eazy_psf_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX eazy_psf_s_dec_idx ON sia.eazy_psf USING btree (s_dec);


--
-- Name: eazy_psf_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX eazy_psf_s_ra_idx ON sia.eazy_psf USING btree (s_ra);



--
-- Name: photometric200; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.photometric200 (
    id integer,
    -- jaguar_id integer,
    s_ra  double precision,
    s_dec  double precision,
    redshift  double precision,
    NRC_F090W  double precision,
    NRC_F090W_err  double precision,
    NRC_F115W  double precision,
    NRC_F115W_err  double precision,
    NRC_F150W  double precision,
    NRC_F150W_err  double precision,
    NRC_F200W  double precision,
    NRC_F200W_err  double precision,
    NRC_F277W  double precision,
    NRC_F277W_err  double precision,
    NRC_F335M  double precision,
    NRC_F335M_err  double precision,
    NRC_F356W  double precision,
    NRC_F356W_err  double precision,
    NRC_F410M  double precision,
    NRC_F410M_err  double precision,
    NRC_F444W  double precision,
    NRC_F444W_err  double precision,
    x  double precision,
    y  double precision,
    a  double precision,
    b  double precision,
    theta  double precision,
    npix  double precision,
    kron_flag integer
);

ALTER TABLE sia.photometric200 OWNER TO astrolabe;


--
-- Name: phm200_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm200_q3c_idx ON sia.photometric200 USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.photometric200 CLUSTER ON phm200_q3c_idx;


--
-- Name: phm200_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm200_id_idx ON sia.photometric200 USING btree (id);


--
-- Name: phm200_jaguar_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX phm200_jaguar_id_idx ON sia.photometric200 USING btree (jaguar_id);


--
-- Name: phm200_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm200_s_dec_idx ON sia.photometric200 USING btree (s_dec);


--
-- Name: phm200_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm200_s_ra_idx ON sia.photometric200 USING btree (s_ra);



--
-- Name: photometric356; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.photometric356 (
    id integer,
    -- jaguar_id integer,
    s_ra  double precision,
    s_dec  double precision,
    redshift  double precision,
    NRC_F090W  double precision,
    NRC_F090W_err  double precision,
    NRC_F115W  double precision,
    NRC_F115W_err  double precision,
    NRC_F150W  double precision,
    NRC_F150W_err  double precision,
    NRC_F200W  double precision,
    NRC_F200W_err  double precision,
    NRC_F277W  double precision,
    NRC_F277W_err  double precision,
    NRC_F335M  double precision,
    NRC_F335M_err  double precision,
    NRC_F356W  double precision,
    NRC_F356W_err  double precision,
    NRC_F410M  double precision,
    NRC_F410M_err  double precision,
    NRC_F444W  double precision,
    NRC_F444W_err  double precision,
    x  double precision,
    y  double precision,
    a  double precision,
    b  double precision,
    theta  double precision,
    npix  double precision,
    kron_flag integer
);

ALTER TABLE sia.photometric356 OWNER TO astrolabe;


--
-- Name: phm356_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm356_q3c_idx ON sia.photometric356 USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.photometric356 CLUSTER ON phm356_q3c_idx;


--
-- Name: phm356_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm356_id_idx ON sia.photometric356 USING btree (id);


--
-- Name: phm356_jaguar_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX phm356_jaguar_id_idx ON sia.photometric356 USING btree (jaguar_id);


--
-- Name: phm356_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm356_s_dec_idx ON sia.photometric356 USING btree (s_dec);


--
-- Name: phm356_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX phm356_s_ra_idx ON sia.photometric356 USING btree (s_ra);
