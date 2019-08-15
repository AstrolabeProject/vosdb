--
-- Create the tap_schema schema within the VOS database.
--   This script assumes that the database VOS and astro users have already been created.
--
CREATE SCHEMA tap_schema;
ALTER SCHEMA tap_schema OWNER TO astrolabe;

--
-- Usage grants on the tap_schema schema
--
GRANT USAGE ON SCHEMA tap_schema TO tapuser;
GRANT USAGE ON SCHEMA tap_schema TO readonly;
GRANT USAGE, CREATE ON SCHEMA tap_schema TO readwrite;

SET search_path TO tap_schema, sia, public;
