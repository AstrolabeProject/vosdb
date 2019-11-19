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
-- Name: jcat; Type: TABLE; Schema: sia; Owner: astrolabe
--
CREATE TABLE sia.jcat (
    s_id integer primary key,
    s_ra double precision,
    s_dec double precision,
    redshift double precision,
    mStar real,
    MUV double precision,
    beta double precision,
    SFR_10 real,
    SFR_100 real,
    sSFR real,
    tau real,
    max_stellar_age real,
    tauV_eff real,
    A1500 real,
    HST_F435W_fnu real,
    HST_F606W_fnu real,
    HST_F775W_fnu real,
    HST_F814W_fnu real,
    HST_F850LP_fnu real,
    HST_F105W_fnu real,
    HST_F125W_fnu real,
    HST_F140W_fnu real,
    HST_F160W_fnu real,
    IRAC_3p6_fnu real,
    IRAC_4p5_fnu real,
    NRC_F070W_fnu real,
    NRC_F090W_fnu real,
    NRC_F115W_fnu real,
    NRC_F150W_fnu real,
    NRC_F200W_fnu real,
    NRC_F277W_fnu real,
    NRC_F356W_fnu real,
    NRC_F444W_fnu real,
    NRC_F140M_fnu real,
    NRC_F162M_fnu real,
    NRC_F182M_fnu real,
    NRC_F210M_fnu real,
    NRC_F250M_fnu real,
    NRC_F300M_fnu real,
    NRC_F335M_fnu real,
    NRC_F360M_fnu real,
    NRC_F410M_fnu real,
    NRC_F430M_fnu real,
    NRC_F460M_fnu real,
    NRC_F480M_fnu real,
    NRC_F410M_F444W_fnu real,
    metallicity real,
    log_OH real,
    C4_1548_1550_EW double precision,
    O3_1660_EW double precision,
    O3_1666_EW double precision,
    C3_1907_1909_EW double precision,
    O2_3726_3729_EW double precision,
    HBaB_4861_EW double precision,
    O3_4959_EW double precision,
    O3_5007_EW double precision,
    HBaA_6563_EW double precision,
    C4_1548_flux real,
    C4_1551_flux real,
    O3_1661_flux real,
    O3_1666_flux real,
    C3_1907_flux real,
    C3_1909_flux real,
    O2_3726_flux real,
    O2_3729_flux real,
    Ne3_3869_flux real,
    O3_4363_flux real,
    HBaB_4861_flux real,
    O3_4959_flux real,
    O3_5007_flux real,
    HBaA_6563_flux real,
    N2_6584_flux real,
    S2_6716_flux real,
    S2_6731_flux real,
    luminosity_distance real,
    Re_circ double precision,
    Re_maj double precision,
    axis_ratio double precision,
    sersic_n double precision,
    position_angle double precision,
    is_public integer
);

ALTER TABLE sia.jcat OWNER TO astrolabe;


--
-- Name: jcat_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jcat_q3c_idx ON sia.jcat USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.jcat CLUSTER ON jcat_q3c_idx;


--
-- Name: jcat_is_public_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jcat_is_public_idx ON sia.jcat USING btree (is_public);


--
-- Name: jcat_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jcat_s_dec_idx ON sia.jcat USING btree (s_dec);


--
-- Name: jcat_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jcat_s_ra_idx ON sia.jcat USING btree (s_ra);


--
-- Name: jcat_redshift_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jcat_redshift_idx ON sia.jcat USING btree (redshift);


--
-- Name: jcat_tau_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jcat_tau_idx ON sia.jcat USING btree (tau);
