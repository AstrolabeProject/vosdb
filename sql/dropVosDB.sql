--
-- Drop the ALWS users and database.
--
REVOKE ALL privileges ON DATABASE alws FROM alquery;
REVOKE ALL privileges ON DATABASE alws FROM astrolabe;
DROP USER astrolabe;
DROP USER alquery;
DROP DATABASE alws;
