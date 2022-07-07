--
-- Create a separate database for the Astrolabe/JWST project.
--
CREATE DATABASE alws;

CREATE ROLE readonly;
GRANT CONNECT ON DATABASE alws TO readonly;
ALTER ROLE readonly SET client_encoding TO 'utf8';
ALTER ROLE readonly SET default_transaction_isolation TO 'read committed';
ALTER ROLE readonly SET timezone TO 'UTC';

CREATE ROLE readwrite;
GRANT CONNECT ON DATABASE alws TO readwrite;
ALTER ROLE readwrite SET client_encoding TO 'utf8';
ALTER ROLE readwrite SET default_transaction_isolation TO 'read committed';
ALTER ROLE readwrite SET timezone TO 'UTC';


--
-- Set default (future) privileges for objects
--
ALTER DEFAULT PRIVILEGES GRANT SELECT ON TABLES TO readonly;

ALTER DEFAULT PRIVILEGES GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO readwrite;
ALTER DEFAULT PRIVILEGES GRANT USAGE ON SEQUENCES TO readwrite;
