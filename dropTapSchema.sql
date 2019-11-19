--
-- Drop the tap_schema schema from the VOS database.
--
REVOKE USAGE ON SCHEMA tap_schema FROM tapuser;
REVOKE USAGE ON SCHEMA tap_schema FROM alquery;
REVOKE USAGE ON SCHEMA tap_schema FROM astrolabe;
DROP SCHEMA tap_schema CASCADE;
