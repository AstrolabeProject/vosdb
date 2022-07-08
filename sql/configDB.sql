--
-- Create database users and grant them existing roles.
--
CREATE USER astrolabe WITH
  CREATEDB
  IN ROLE readwrite
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:cHJXlwg3+5t2eragr3UKMw==$xqU3NMsWHjURJtmFt4wvbqz95wYvjtiPSgYDu5Gpp64=:5RWwIHIo79bvG2l3ErhM6e0WzrJj8s1A310ogRiGegg=';

CREATE USER alquery WITH
  IN ROLE readonly
  ENCRYPTED PASSWORD 'SCRAM-SHA-256$4096:cHJXlwg3+5t2eragr3UKMw==$xqU3NMsWHjURJtmFt4wvbqz95wYvjtiPSgYDu5Gpp64=:5RWwIHIo79bvG2l3ErhM6e0WzrJj8s1A310ogRiGegg=';


--
-- Add the Q3C extension, which is needed for indexing.
-- NB: Extensions can only be created by a user with the Superuser attribute.
--
CREATE EXTENSION IF NOT EXISTS q3c;
