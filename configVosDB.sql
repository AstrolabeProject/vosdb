--
-- Final setup and configuration for the VOS database.
--

--
-- Create database users and grant them existing roles.
--
CREATE USER astrolabe WITH
  CREATEDB
  IN ROLE readwrite
  ENCRYPTED PASSWORD 'changeMe';
ALTER SCHEMA sia OWNER TO astrolabe;
ALTER SCHEMA tap_schema OWNER TO astrolabe;

CREATE USER alquery WITH
  IN ROLE readonly
  ENCRYPTED PASSWORD 'changeMe';

CREATE USER tapuser WITH
  IN ROLE readonly
  ENCRYPTED PASSWORD 'changeMe';


--
-- set the search_path to include the SIA, TAP, and public schemas
---
SET search_path TO sia, tap_schema, public;
