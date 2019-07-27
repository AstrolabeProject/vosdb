--
-- Drop the Ivoaal users and database.
--
REVOKE ALL privileges ON DATABASE ivoaal FROM alquery;
REVOKE ALL privileges ON DATABASE ivoaal FROM astrolabe;
DROP USER astrolabe;
DROP USER alquery;
DROP DATABASE ivoaal;
