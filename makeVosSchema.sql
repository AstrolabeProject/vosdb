--
-- Create the VOS schema within the ivoaal database and add the q3c extension.
--   This script assumes that the database ivoaal and astro users have already been created.
--   NB: Extensions can only be created by a user with the Superuser attribute,
--       so this script must be run by a Superuser while connected to the ivoaal database.
--
CREATE SCHEMA vos;
ALTER SCHEMA vos OWNER TO astrolabe;

--
-- Add the Q3C extension, which is needed for indexing.
-- NB: Extensions can only be created by a user with the Superuser attribute.
--
CREATE EXTENSION IF NOT EXISTS q3c SCHEMA public;

SET search_path TO vos, public;
