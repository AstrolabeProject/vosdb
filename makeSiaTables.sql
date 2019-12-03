--
-- Make image tables and indices for the SIA schema of the VOS database.
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
-- Name: obscore; Type: TABLE; Schema: sia; Owner: astrolabe
--
--    Legend: M=Mandatory, O=Optional (based on ObsCore v1.1), C=Custom
--
-- CREATE TABLE sia.obscore (
--     em_max double precision,                -- M. Spectral bandpass, upper limit
--     em_min double precision,                -- M. Spectral bandpass, lower limit
--     em_res_power double precision,          -- M. Resolving power, spectral axis (characteristic)
--     s_dec double precision,                 -- M. Center of field/image
--     s_fov double precision,                 -- M. Field Of View of observation
--     s_ra double precision,                  -- M. Center of field/image
--     s_resolution double precision,          -- M. Spatial resolution of signal
--     t_exptime double precision,             -- M. Total exposure time
--     t_max double precision,                 -- M. Temporal bandpass, upper limit, in MJD
--     t_min double precision,                 -- M. Temporal bandpass, lower limit, in MJD
--     t_resolution double precision,          -- M. Temporal resolution (FWHM)
--     access_estsize integer,                 -- M. Estimated dataset size in kB
--     calib_level integer,                    -- M. Dataset calibration level
--     em_xel integer,                         -- M. Number elements along the spectral axis
--     pol_xel integer,                        -- M. Number elements along the polarization axis
--     s_xel1 integer,                         -- M. Number elements along 1st coord of spatial axis
--     s_xel2 integer,                         -- M. Number elements along 2nd coord of spatial axis
--     t_xel integer,                          -- M. Number elements along the time axis
--     access_url character varying(255),      -- M. URL to access dataset
--     s_region character varying(255),        -- M. Sky region covered by observation
--     obs_publisher_did character varying(160), -- M. ID for dataset given by publisher
--     target_name character varying(128),     -- M. Name of object of interest
--     access_format character varying(64),    -- M. MIME type (content format) of the dataset
--     facility_name character varying(64),    -- M. Name of facility that created the dataset
--     instrument_name character varying(64),  -- M. Name of the instrument that generated the data
--     o_ucd character varying(64),            -- M. UCD for observable
--     obs_collection character varying(64),   -- M. Data collection name
--     obs_id character varying(64),           -- M. Internal ID given by the ObsTAP service
--     pol_states character varying(64),       -- M. Polarization states represented in dataset
--     dataproduct_type character varying(16)  -- M. Primary dataset type (ObsCore 3.3.1)
-- );

-- ALTER TABLE sia.obscore OWNER TO astrolabe;


--
-- Name: jwst; Type: TABLE; Schema: sia; Owner: astrolabe
--
--    Legend: M=Mandatory, O=Optional (ObsCore v1.1),
--            C=Custom,  D=DALserver-specific,  F=FITS (Standard 4, 8/13/2018),  J=JWST-specific
--
CREATE TABLE sia.jwst (
    id serial primary key,                  -- D. Auto-incrementing primary key
    equinox double precision,               -- F. Non-negative epoch of mean equator/equinox in years.
    s_dec double precision,                 -- M. Center of field/image
    s_fov double precision,                 -- M. Field Of View of observation
    s_ra double precision,                  -- M. Center of field/image
    s_resolution double precision,          -- M. Spatial resolution of signal
    t_exptime double precision,             -- M. Total exposure time
    t_max double precision,                 -- M. Temporal bandpass, upper limit, in MJD
    t_min double precision,                 -- M. Temporal bandpass, lower limit, in MJD
    t_resolution double precision,          -- M. Temporal resolution (FWHM)
    spat_lolimit1 double precision,         -- D. Min value of spatial limit along RA axis
    spat_hilimit1 double precision,         -- D. Max value of spatial limit along RA axis
    spat_lolimit2 double precision,         -- D. Min value of spatial limit along DEC axis
    spat_hilimit2 double precision,         -- D. Max value of spatial limit along DEC axis
    im_scale double precision,              -- D. Scale of the image
    im_ra1 double precision,                -- D. RA  of lower left corner of image
    im_dec1 double precision,               -- D. DEC of lower left corner of image
    im_ra2 double precision,                -- D. RA  of upper left corner of image
    im_dec2 double precision,               -- D. DEC of upper left corner of image
    im_ra3 double precision,                -- D. RA  of upper right corner of image
    im_dec3 double precision,               -- D. DEC of upper right corner of image
    im_ra4 double precision,                -- D. RA  of lower right corner of image
    im_dec4 double precision,               -- D. DEC of lower right corner of image
    access_estsize integer,                 -- M. Estimated dataset size in kB
    calib_level integer,                    -- M. Dataset calibration level
    im_naxes integer,                       -- D. Number of physical image axes
    im_naxis1 integer,                      -- D. Size of primary axis (same as s_xel1)
    im_naxis2 integer,                      -- D. Size of secondary axis (same as s_xel2)
    im_nsubarrays integer,                  -- D. Number of subarrays in image
    is_public integer,                      -- C. Is this observation available to the public?
    s_xel1 integer,                         -- M. Number elements along 1st coord of spatial axis
    s_xel2 integer,                         -- M. Number elements along 2nd coord of spatial axis
    t_xel integer,                          -- M. Number elements along the time axis
    gmt_date timestamp,                     -- J. FITS timestamp in GMT
    obs_creation_date timestamp,            -- O. Dataset creation date in UTC
    access_url character varying(252),      -- M. URL to access dataset
    file_path character varying(252),       -- D. Path to the originating FITS file on disk
    s_region character varying(252),        -- M. Sky region covered by observation
    obs_publisher_did character varying(160), -- M. ID for dataset given by publisher
    obs_creator_name character varying(128),  -- O. Name of entity that created the dataset
    target_name character varying(128),     -- M. Name of object of interest
    access_format character varying(64),    -- M. MIME type (content format) of the dataset
    facility_name character varying(64),    -- M. Name of facility that created the dataset
    file_name character varying(64),        -- D. Name of originating FITS file
    instrument_name character varying(64),  -- M. Name of the instrument that generated the data
    o_ucd character varying(64),            -- M. UCD for observable
    obs_collection character varying(64),   -- M. Data collection name
    obs_id character varying(64),           -- M. Internal ID given by the ObsTAP service
    obs_bandpass character varying(32),     -- C. Observed band
    dataproduct_type character varying(16), -- M. Primary dataset type (ObsCore 3.3.1)
    filter character varying(16),           -- J. Name of filter element used
    im_pixtype character varying(16),       -- D. Pixel datatype specified as a VOTable type
    im_wcsaxes1 character varying(16),      -- D. WCS axis type of primary axis (e.g. 'RA---TAN')
    im_wcsaxes2 character varying(16),      -- D. WCS axis type of secondary axis (e.g. 'DEC--TAN')
    pupil character varying(16),            -- J. Name of pupil element used
    radesys character varying(16),          -- F. Reference frame of coordinates (FITS: table 24)
    nircam_channel character varying(8),    -- J. NIRCam channel: short or long
    nircam_module character varying(4)      -- J. NIRCam module: A or B
);

ALTER TABLE sia.jwst OWNER TO astrolabe;


--
-- Name: jwst_q3c_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_q3c_idx ON sia.jwst USING btree (public.q3c_ang2ipix(s_ra, s_dec));

ALTER TABLE sia.jwst CLUSTER ON jwst_q3c_idx;


--
-- Name: jwst_instrument_name_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_instrument_name_idx ON sia.jwst USING btree (instrument_name);


--
-- Name: jwst_is_public_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_is_public_idx ON sia.jwst USING btree (is_public);


--
-- Name: jwst_obs_id_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_obs_id_idx ON sia.jwst USING btree (obs_id);


--
-- Name: jwst_obs_publisher_did_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_obs_publisher_did_idx ON sia.jwst USING btree (obs_publisher_did);


--
-- Name: jwst_dataproduct_type_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_dataproduct_type_idx ON sia.jwst USING btree (dataproduct_type);


--
-- Name: jwst_s_dec_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_s_dec_idx ON sia.jwst USING btree (s_dec);


--
-- Name: jwst_s_ra_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_s_ra_idx ON sia.jwst USING btree (s_ra);


--
-- Name: jwst_t_exptime_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_t_exptime_idx ON sia.jwst USING btree (t_exptime);


--
-- Name: jwst_t_min_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
CREATE INDEX jwst_t_min_idx ON sia.jwst USING btree (t_min);


--
-- Name: jwst_fileref_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX jwst_fileref_idx ON sia.jwst USING btree (fileref);

--
-- Name: jwst_filter_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX jwst_filter_idx ON sia.jwst USING btree (filter);

--
-- Name: jwst_mjd_obs_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX jwst_mjd_obs_idx ON sia.jwst USING btree (mjd_obs);

--
-- Name: jwst_spat_loc1_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX jwst_spat_loc1_idx ON sia.jwst USING btree (spat_loc1);

--
-- Name: jwst_spat_loc2_idx; Type: INDEX; Schema: sia; Owner: astrolabe
--
-- CREATE INDEX jwst_spat_loc2_idx ON sia.jwst USING btree (spat_loc2);
