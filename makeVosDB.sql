--
-- Create a separate database for the IVOA Astrolabe project.
--
CREATE DATABASE vos;

CREATE ROLE readonly;
GRANT CONNECT ON DATABASE vos TO readonly;
ALTER ROLE readonly SET client_encoding TO 'utf8';
ALTER ROLE readonly SET default_transaction_isolation TO 'read committed';
ALTER ROLE readonly SET timezone TO 'UTC';

CREATE ROLE readwrite;
GRANT CONNECT ON DATABASE vos TO readwrite;
ALTER ROLE readwrite SET client_encoding TO 'utf8';
ALTER ROLE readwrite SET default_transaction_isolation TO 'read committed';
ALTER ROLE readwrite SET timezone TO 'UTC';
