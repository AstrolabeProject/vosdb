--
-- Create the SIA schema within the VOS database and add the q3c extension.
--   This script assumes that the database VOS and astro users have already been created.
--   NB: Extensions can only be created by a user with the Superuser attribute,
--       so this script must be run by a Superuser while connected to the VOS database.
--
CREATE SCHEMA sia;
ALTER SCHEMA sia OWNER TO astrolabe;

--
-- Usage grants on the SIA schema
--
GRANT USAGE ON SCHEMA sia TO alquery;
GRANT USAGE ON SCHEMA sia TO readonly;
GRANT USAGE ON SCHEMA sia TO tapuser;
GRANT USAGE, CREATE ON SCHEMA sia TO readwrite;


--
-- Add the Q3C extension, which is needed for indexing.
-- NB: Extensions can only be created by a user with the Superuser attribute.
--
CREATE EXTENSION IF NOT EXISTS q3c SCHEMA public;
