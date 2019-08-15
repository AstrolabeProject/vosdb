--
-- Drop all tap_schema tables in the correct order to not violate foreign key constraints.
--   Taken from DALserver V0.9+NOAO mods (V0.10?).
--   Tested with: PostgreSQL 8.x, 10.x, and Sybase 15.x.
--
DROP TABLE tap_schema.key_columns;
DROP TABLE tap_schema.keys;
DROP TABLE tap_schema.columns;
DROP TABLE tap_schema.tables;
DROP TABLE tap_schema.schemas;
