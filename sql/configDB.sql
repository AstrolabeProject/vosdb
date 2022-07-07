--
-- Create database users and grant them existing roles.
--
CREATE USER astrolabe WITH
  CREATEDB
  IN ROLE readwrite
  ENCRYPTED PASSWORD 'changeMe';

CREATE USER alquery WITH
  IN ROLE readonly
  ENCRYPTED PASSWORD 'changeMe';


--
-- Add the Q3C extension, which is needed for indexing.
-- NB: Extensions can only be created by a user with the Superuser attribute.
--
CREATE EXTENSION IF NOT EXISTS q3c;
