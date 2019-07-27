--
-- Drop the VOS schema from the ivoaal database.
--
REVOKE USAGE ON SCHEMA vos FROM alquery;
REVOKE USAGE ON SCHEMA vos FROM astrolabe;
DROP SCHEMA vos CASCADE;
