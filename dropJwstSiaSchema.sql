--
-- Drop the SIA schema from the VOS database.
--
REVOKE USAGE ON SCHEMA sia FROM alquery;
REVOKE USAGE ON SCHEMA sia FROM astrolabe;
DROP SCHEMA sia CASCADE;
