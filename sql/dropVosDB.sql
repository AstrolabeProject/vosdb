--
-- Drop the VOS users and database.
--
REVOKE ALL privileges ON DATABASE vos FROM alquery;
REVOKE ALL privileges ON DATABASE vos FROM astrolabe;
DROP USER astrolabe;
DROP USER alquery;
DROP DATABASE vos;
