--
-- Make tables and indices for the VOS schema of the Ivoaal database.
--   This script assumes that the database 'ivoaal', astro users, and the schema 'vos'
--   have all been created and that it is run in that DB and schema.
--

SET check_function_bodies = false;
SET client_min_messages = warning;
SET idle_in_transaction_session_timeout = 0;
SET lock_timeout = 0;
SET row_security = off;
SET standard_conforming_strings = on;
SET statement_timeout = 0;

SET search_path TO vos, public;


--
-- Name: exposure; Type: TABLE; Schema: vos; Owner: astrolabe
--
CREATE TABLE vos.exposure (
    ra_j2000 double precision,
    dec_j2000 double precision,
    exptime real,
    zd real,
    airmass real,
    seeing real,
    moonangle real,
    fwhm real,
    elliptic real,
    magzero real,
    calib_level integer,
    access_estsize integer,
    expnum integer,
    photflag integer,
    access_url character varying(255),
    fileref character varying(160),
    path character varying(160),
    obs_pub_did character varying(128),
    obs_collection character varying(64),
    obs_id character varying(64),
    product_type character varying(16),
    access_format character varying(64),
    raj2000_ character varying(32),
    decj2000_ character varying(32),
    date_obs character varying(32),
    mjd_obs character varying(32),
    filt_str character varying(64),
    proctype character varying(64),
    prodtype character varying(64),
    obstype character varying(64),
    telescope character varying(64),
    plver character varying(60),
    obsid character varying(64),
    object character varying(160),
    proposer character varying(160),
    propid character varying(32),
    ha character varying(20),
    instrument character varying(64),
    filter character varying(32),
    is_public integer
);

ALTER TABLE vos.exposure OWNER TO astrolabe;


--
-- Name: obscore; Type: TABLE; Schema: vos; Owner: astrolabe
--
CREATE TABLE vos.obscore (
    s_ra double precision,
    s_dec double precision,
    s_fov double precision,
    s_resolution double precision,
    t_min double precision,
    t_max double precision,
    t_exptime double precision,
    t_resolution double precision,
    em_min double precision,
    em_max double precision,
    em_res_power double precision,
    calib_level integer,
    access_estsize integer,
    s_xel1 integer,
    s_xel2 integer,
    t_xel integer,
    em_xel integer,
    pol_xel integer,
    access_url character varying(255),
    s_region character varying(255),
    obs_pub_did character varying(128),
    obs_collection character varying(64),
    obs_id character varying(64),
    access_format character varying(64),
    target_name character varying(128),
    facility_name character varying(64),
    instrument_name character varying(64),
    o_ucd character varying(64),
    pol_states character varying(64),
    product_type character varying(16),
    is_public integer
);

ALTER TABLE vos.obscore OWNER TO astrolabe;


--
-- Name: siav1; Type: TABLE; Schema: vos; Owner: astrolabe
--
CREATE TABLE vos.siav1 (
    s_ra double precision,
    s_dec double precision,
    spat_lolimit1 double precision,
    spat_lolimit2 double precision,
    spat_hilimit1 double precision,
    spat_hilimit2 double precision,
    ra1 double precision,
    dec1 double precision,
    ra2 double precision,
    dec2 double precision,
    ra3 double precision,
    dec3 double precision,
    ra4 double precision,
    dec4 double precision,
    im_scale double precision,
    spec_location double precision,
    em_min double precision,
    em_max double precision,
    em_res double precision,
    spec_respower double precision,
    time_start double precision,
    time_stop double precision,
    access_estsize integer,
    calib_level integer,
    datalength integer,
    im_naxes integer,
    im_naxis1 integer,
    im_naxis2 integer,
    el_length integer,
    el_size integer,
    expnum integer,
    exptime real,
    zd real,
    airmass real,
    seeing real,
    moonangle real,
    fwhm real,
    elliptic real,
    magzero real,
    access_url character varying(255),
    object character varying(160),
    obs_pub_did character varying(128),
    title character varying(128),
    creator character varying(128),
    id character varying(128),
    obs_collection character varying(64),
    project_code character varying(64),
    propid character varying(64),
    obs_id character varying(64),
    assoc_id character varying(64),
    access_format character varying(64),
    fluxaxis_ucd character varying(64),
    fileref character varying(160),
    proposer character varying(160),
    date_obs character varying(32),
    mjd_obs character varying(32),
    filt_str character varying(64),
    time_location character varying(60),
    pixtype character varying(60),
    wcsaxes1 character varying(60),
    wcsaxes2 character varying(60),
    fluxaxis_unit character varying(60),
    proctype character varying(64),
    prodtype character varying(64),
    obstype character varying(64),
    telescope character varying(64),
    ha character varying(20),
    instrument_name character varying(64),
    filter character varying(32),
    obs_bandpass character varying(32),
    is_public integer
);

ALTER TABLE vos.siav1 OWNER TO astrolabe;


--
-- Name: siav2; Type: TABLE; Schema: vos; Owner: astrolabe
--
CREATE TABLE vos.siav2 (
    spat_loc1 double precision,
    spat_loc2 double precision,
    spat_lolimit1 double precision,
    spat_lolimit2 double precision,
    spat_hilimit1 double precision,
    spat_hilimit2 double precision,
    ra1 double precision,
    dec1 double precision,
    ra2 double precision,
    dec2 double precision,
    ra3 double precision,
    dec3 double precision,
    ra4 double precision,
    dec4 double precision,
    spat_res1 double precision,
    spat_res2 double precision,
    pix_res1 double precision,
    pix_res2 double precision,
    spec_location double precision,
    spec_start double precision,
    spec_stop double precision,
    spec_res double precision,
    spec_respower double precision,
    time_start double precision,
    time_stop double precision,
    access_estsize integer,
    calib_level integer,
    datalength integer,
    nsubarrays integer,
    naxes integer,
    naxis1 integer,
    naxis2 integer,
    el_naxes integer,
    el_naxis1 integer,
    el_naxis2 integer,
    el_length integer,
    el_size integer,
    ccdnum integer,
    photflag integer,
    access_url character varying(255),
    pubdid character varying(160),
    obs_pub_did character varying(128),
    title character varying(128),
    creator character varying(128),
    collection character varying(128),
    fileref character varying(128),
    access_format character varying(64),
    obs_collection character varying(64),
    obs_id character varying(64),
    fluxaxis_ucd character varying(64),
    proctype character varying(64),
    prodtype character varying(64),
    time_location character varying(60),
    extname character varying(128),
    el_pixtype character varying(60),
    fluxaxis_unit character varying(60),
    plver character varying(60),
    pixtype character varying(60),
    wcsaxes1 character varying(60),
    wcsaxes2 character varying(60),
    creationtype character varying(60),
    filter character varying(32)
);

ALTER TABLE vos.siav2 OWNER TO astrolabe;


--
-- Name: exp_q3c_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exp_q3c_idx ON vos.exposure USING btree (public.q3c_ang2ipix(ra_j2000, dec_j2000));

ALTER TABLE vos.exposure CLUSTER ON exp_q3c_idx;


--
-- Name: exposure_dec_j2000_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_dec_j2000_idx ON vos.exposure USING btree (dec_j2000);


--
-- Name: exposure_exptime_idx; Type: INDEX; Schema: vos; Owner: astrolabe; Tablespace: data1
--
CREATE INDEX exposure_exptime_idx ON vos.exposure USING btree (exptime);


--
-- Name: exposure_fileref_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_fileref_idx ON vos.exposure USING btree (fileref);


--
-- Name: exposure_filter_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_filter_idx ON vos.exposure USING btree (filter);


--
-- Name: exposure_is_public_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_is_public_idx ON vos.exposure USING btree (is_public);


--
-- Name: exposure_mjd_obs_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_mjd_obs_idx ON vos.exposure USING btree (mjd_obs);


--
-- Name: exposure_proctype_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_proctype_idx ON vos.exposure USING btree (proctype);


--
-- Name: exposure_prodtype_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_prodtype_idx ON vos.exposure USING btree (prodtype);


--
-- Name: exposure_ra_j2000_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX exposure_ra_j2000_idx ON vos.exposure USING btree (ra_j2000);


--
-- Name: obs_q3c_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obs_q3c_idx ON vos.obscore USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE vos.obscore CLUSTER ON obs_q3c_idx;


--
-- Name: obscore_instrument_name_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_instrument_name_idx ON vos.obscore USING btree (instrument_name);


--
-- Name: obscore_is_public_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_is_public_idx ON vos.obscore USING btree (is_public);


--
-- Name: obscore_obs_id_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_obs_id_idx ON vos.obscore USING btree (obs_id);


--
-- Name: obscore_obs_pub_did_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_obs_pub_did_idx ON vos.obscore USING btree (obs_pub_did);


--
-- Name: obscore_product_type_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_product_type_idx ON vos.obscore USING btree (product_type);


--
-- Name: obscore_s_dec_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_s_dec_idx ON vos.obscore USING btree (s_dec);


--
-- Name: obscore_s_ra_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_s_ra_idx ON vos.obscore USING btree (s_ra);


--
-- Name: obscore_t_exptime_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_t_exptime_idx ON vos.obscore USING btree (t_exptime);


--
-- Name: obscore_t_min_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX obscore_t_min_idx ON vos.obscore USING btree (t_min);


--
-- Name: siav1_exptime_idx; Type: INDEX; Schema: vos; Owner: astrolabe; Tablespace: data1
--
CREATE INDEX siav1_exptime_idx ON vos.siav1 USING btree (exptime);


--
-- Name: siav1_fileref_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_fileref_idx ON vos.siav1 USING btree (fileref);


--
-- Name: siav1_filter_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_filter_idx ON vos.siav1 USING btree (filter);


--
-- Name: siav1_is_public_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_is_public_idx ON vos.siav1 USING btree (is_public);


--
-- Name: siav1_mjd_obs_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_mjd_obs_idx ON vos.siav1 USING btree (mjd_obs);


--
-- Name: siav1_obs_id_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_obs_id_idx ON vos.siav1 USING btree (obs_id);


--
-- Name: siav1_obs_pub_did_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_obs_pub_did_idx ON vos.siav1 USING btree (obs_pub_did);


--
-- Name: siav1_q3c_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_q3c_idx ON vos.siav1 USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE vos.siav1 CLUSTER ON siav1_q3c_idx;


--
-- Name: siav1_s_dec_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_s_dec_idx ON vos.siav1 USING btree (s_dec);


--
-- Name: siav1_s_ra_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_s_ra_idx ON vos.siav1 USING btree (s_ra);


--
-- Name: siav1_time_start_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav1_time_start_idx ON vos.siav1 USING btree (time_start);


--
-- Name: siav2_fileref_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_fileref_idx ON vos.siav2 USING btree (fileref);


--
-- Name: siav2_filter_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_filter_idx ON vos.siav2 USING btree (filter);


--
-- Name: siav2_obs_id_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_obs_id_idx ON vos.siav2 USING btree (obs_id);


--
-- Name: siav2_obs_pub_did_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_obs_pub_did_idx ON vos.siav2 USING btree (obs_pub_did);


--
-- Name: siav2_q3c_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_q3c_idx ON vos.siav2 USING btree (public.q3c_ang2ipix(spat_loc1, spat_loc2));

ALTER TABLE vos.siav2 CLUSTER ON siav2_q3c_idx;


--
-- Name: siav2_spat_loc1_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_spat_loc1_idx ON vos.siav2 USING btree (spat_loc1);


--
-- Name: siav2_spat_loc2_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_spat_loc2_idx ON vos.siav2 USING btree (spat_loc2);


--
-- Name: siav2_time_start_idx; Type: INDEX; Schema: vos; Owner: astrolabe
--
CREATE INDEX siav2_time_start_idx ON vos.siav2 USING btree (time_start);


--
-- Set permissions to these tables for various users
--
GRANT SELECT ON ALL TABLES IN SCHEMA vos TO alquery;
GRANT SELECT ON ALL TABLES IN SCHEMA vos TO readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA vos TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA vos TO readwrite;
