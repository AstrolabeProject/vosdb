--
-- Create the SIA schema within the VOS database and add the q3c extension.
--   NB: Extensions can only be created by a user with the Superuser attribute,
--       so this script must be run by a Superuser while connected to the VOS database.
--
CREATE SCHEMA sia;

--
-- Grant usage on the tap_schema schema:
--
GRANT USAGE ON SCHEMA sia TO readonly;
GRANT USAGE, CREATE ON SCHEMA sia TO readwrite;

--
-- Set default (future) privileges for objects in the SIA schema:
--
ALTER DEFAULT PRIVILEGES IN SCHEMA sia
  GRANT SELECT ON TABLES TO readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA sia
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA sia
  GRANT USAGE ON SEQUENCES TO readwrite;


--
-- Add the Q3C extension, which is needed for indexing.
-- NB: Extensions can only be created by a user with the Superuser attribute.
--
CREATE EXTENSION IF NOT EXISTS q3c SCHEMA public;
