--
-- Final setup and configuration for the VOS database.
--

--
-- Set permissions for Hybrid tables for various users
--
GRANT SELECT ON ALL TABLES IN SCHEMA hyb TO alquery;
GRANT SELECT ON ALL TABLES IN SCHEMA hyb TO readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA hyb TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA hyb TO readwrite;


--
-- set the search_path to include the Hybrid and public schemas
---
SET search_path TO hyb, public;
