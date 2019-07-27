--
-- Create a separate database for the IVOA Astrolabe project.
--
CREATE DATABASE vos;

CREATE ROLE readonly;
GRANT CONNECT ON DATABASE vos TO readonly;

CREATE ROLE readwrite;
GRANT CONNECT ON DATABASE vos TO readwrite;

--
-- Create admin and query users for the database.
--
CREATE USER astrolabe WITH ENCRYPTED PASSWORD 'changeMe';
GRANT ALL PRIVILEGES ON DATABASE vos TO astrolabe;

CREATE USER alquery WITH ENCRYPTED PASSWORD 'changeMe';
GRANT CONNECT ON DATABASE vos TO alquery;
