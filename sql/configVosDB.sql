--
-- Final setup and configuration for the VOS database.
--

--
-- Create database users and grant them existing roles.
--
CREATE USER astrolabe WITH ENCRYPTED PASSWORD 'changeMe';
GRANT readwrite TO astrolabe;
ALTER SCHEMA hyb OWNER TO astrolabe;

CREATE USER alquery WITH ENCRYPTED PASSWORD 'changeMe';
GRANT readonly TO alquery;


--
-- set the search_path to include the Hybrid and public schemas
---
SET search_path TO hyb, public;
