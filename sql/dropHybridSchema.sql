--
-- Drop the Hybrid schema from the VOS database.
--
REVOKE USAGE ON SCHEMA hyb FROM alquery;
REVOKE USAGE ON SCHEMA hyb FROM astrolabe;
DROP SCHEMA hyb CASCADE;
