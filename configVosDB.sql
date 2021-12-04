--
-- Final setup and configuration for the VOS database.
--

--
-- Create database users and grant them existing roles.
--
CREATE USER astrolabe WITH ENCRYPTED PASSWORD 'changeMe';
GRANT readwrite TO astrolabe;
ALTER SCHEMA sia OWNER TO astrolabe;
ALTER SCHEMA tap_schema OWNER TO astrolabe;

CREATE USER alquery WITH ENCRYPTED PASSWORD 'changeMe';
GRANT readonly TO alquery;

CREATE USER tapuser WITH ENCRYPTED PASSWORD 'changeMe';
GRANT readonly TO tapuser;


--
-- set the search_path to include the SIA, TAP, and public schemas
---
SET search_path TO sia, tap_schema, public;
