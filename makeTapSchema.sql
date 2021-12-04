--
-- Create the tap_schema schema within the VOS database.
--
CREATE SCHEMA tap_schema;

--
-- Grant usage on the tap_schema schema:
--
GRANT USAGE ON SCHEMA tap_schema TO readonly;
GRANT USAGE, CREATE ON SCHEMA tap_schema TO readwrite;

--
-- Set default (future) privileges for objects in the tap_schema schema:
--
ALTER DEFAULT PRIVILEGES IN SCHEMA tap_schema
  GRANT SELECT ON TABLES TO readonly;

ALTER DEFAULT PRIVILEGES IN SCHEMA tap_schema
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
ALTER DEFAULT PRIVILEGES IN SCHEMA tap_schema
  GRANT USAGE ON SEQUENCES TO readwrite;
