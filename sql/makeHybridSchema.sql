--
-- Create the Hybrid schema within the VOS database and add the q3c extension.
--   NB: Extensions can only be created by a user with the Superuser attribute,
--       so this script must be run by a Superuser while connected to the VOS database.
--
CREATE SCHEMA hyb;

--
-- Grant usage on the Hybrid schema:
--
GRANT USAGE ON SCHEMA hyb TO readonly;
GRANT USAGE, CREATE ON SCHEMA hyb TO readwrite;

--
-- Set default (future) privileges for objects in the Hybrid schema:
--
ALTER DEFAULT PRIVILEGES IN SCHEMA hyb
  GRANT SELECT ON TABLES TO readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA hyb
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA hyb
  GRANT USAGE ON SEQUENCES TO readwrite;


--
-- Add the Q3C extension, which is needed for indexing.
-- NB: Extensions can only be created by a user with the Superuser attribute.
--
CREATE EXTENSION IF NOT EXISTS q3c SCHEMA public;
