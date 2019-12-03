--
-- Drop the VOS users and database.
--
REVOKE ALL privileges ON DATABASE vos FROM alquery;
REVOKE ALL privileges ON DATABASE vos FROM astrolabe;
REVOKE ALL privileges ON DATABASE vos FROM tapuser;
DROP USER astrolabe;
DROP USER alquery;
DROP USER tapuser;
DROP DATABASE vos;
