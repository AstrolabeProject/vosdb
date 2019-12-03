--
-- Final setup and configuration for the VOS database.
--

--
-- Set permissions for SIA tables for various users
--
GRANT SELECT ON ALL TABLES IN SCHEMA sia TO alquery;
GRANT SELECT ON ALL TABLES IN SCHEMA sia TO readonly;
GRANT SELECT ON ALL TABLES IN SCHEMA sia TO tapuser;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA sia TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA sia TO readwrite;


--
-- set the search_path to include the SIA, TAP, and public schemas
---
SET search_path TO sia, tap_schema, public;
