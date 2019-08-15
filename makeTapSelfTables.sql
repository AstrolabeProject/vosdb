--
-- Fill the tap_schema tables that describe the tap_schema itself.
--   This script assumes that the database, tap_schema schema, and TAP tables have already
--   been created.
--   Taken from DALserver V0.9+NOAO mods (V0.10?).
--   Tested with: PostgreSQL 8.x, 10.x, and Sybase 15.x.
--     NOTE: this makes use of the multiple insert support in PostgreSQL and may not be portable.

-- Delete key columns for keys from tables in the tap_schema schema
--
DELETE FROM tap_schema.key_columns WHERE
  key_id IN (SELECT key_id FROM tap_schema.keys WHERE
    from_table IN (SELECT table_name FROM tap_schema.tables WHERE schema_name = 'tap_schema')
    OR
    target_table IN (SELECT table_name FROM tap_schema.tables WHERE schema_name = 'tap_schema')
  );


-- Delete keys from tables in the tap_schema schema
DELETE FROM tap_schema.keys WHERE
  from_table IN (SELECT table_name FROM tap_schema.tables WHERE schema_name = 'tap_schema')
  OR
  target_table IN (SELECT table_name FROM tap_schema.tables WHERE schema_name = 'tap_schema');


-- Delete columns from tables in the tap_schema schema
DELETE FROM tap_schema.columns WHERE table_name IN
  (SELECT table_name FROM tap_schema.tables WHERE schema_name = 'tap_schema');

-- Delete tables in the caom schema
DELETE FROM tap_schema.tables WHERE schema_name = 'tap_schema';

-- Delete the caom schema
DELETE FROM tap_schema.schemas WHERE schema_name = 'tap_schema';


INSERT INTO tap_schema.schemas (schema_name,description,utype) VALUES
  ('tap_schema', 'a special schema to describe a TAP tableset', NULL)
;

INSERT INTO tap_schema.tables (schema_name,table_name,table_type,description,utype) VALUES
  ('tap_schema', 'tap_schema.schemas', 'table', 'description of schemas in this tableset', NULL),
  ('tap_schema', 'tap_schema.tables', 'table', 'description of tables in this tableset', NULL),
  ('tap_schema', 'tap_schema.columns', 'table', 'description of columns in this tableset', NULL),
  ('tap_schema', 'tap_schema.keys', 'table', 'description of foreign keys in this tableset', NULL),
  ('tap_schema', 'tap_schema.key_columns', 'table', 'description of foreign key columns in this tableset', NULL)
;

INSERT INTO tap_schema.columns (table_name,column_name,description,utype,ucd,unit,datatype,size,principal,indexed,std) VALUES
  ('tap_schema.schemas', 'schema_name', 'schema name for reference to tap_schema.schemas', NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.schemas', 'utype', 'lists the utypes of schemas in the tableset',           NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),
  ('tap_schema.schemas', 'description', 'describes schemas in the tableset',               NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),

  ('tap_schema.tables', 'schema_name', 'the schema this table belongs to',                 NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.tables', 'table_name', 'the fully qualified table name',                    NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.tables', 'table_type', 'one of: table view',                                NULL, NULL, NULL, 'adql:VARCHAR', 8, 1,0,0),
  ('tap_schema.tables', 'utype', 'lists the utype of tables in the tableset',              NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),
  ('tap_schema.tables', 'description', 'describes tables in the tableset',                 NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),

  ('tap_schema.columns', 'table_name', 'the table this column belongs to',                 NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.columns', 'column_name', 'the column name',                                 NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.columns', 'utype', 'lists the utypes of columns in the tableset',           NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),
  ('tap_schema.columns', 'ucd', 'lists the UCDs of columns in the tableset',               NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.columns', 'unit', 'lists the unit used for column values in the tableset',  NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.columns', 'description', 'describes the columns in the tableset',           NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),
  ('tap_schema.columns', 'datatype', 'lists the ADQL datatype of columns in the tableset', NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.columns', 'size', 'lists the size of variable-length columns in the tableset', NULL, NULL, NULL, 'adql:INTEGER', NULL, 1,0,0),
  ('tap_schema.columns', 'principal', 'a principal column; 1 means 1, 0 means 0',          NULL, NULL, NULL, 'adql:INTEGER', NULL, 1,0,0),
  ('tap_schema.columns', 'indexed', 'an indexed column; 1 means 1, 0 means 0',             NULL, NULL, NULL, 'adql:INTEGER', NULL, 1,0,0),
  ('tap_schema.columns', 'std', 'a standard column; 1 means 1, 0 means 0',                 NULL, NULL, NULL, 'adql:INTEGER', NULL, 1,0,0),

  ('tap_schema.keys', 'key_id', 'unique key to join to tap_schema.key_columns',            NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.keys', 'from_table', 'the table with the foreign key',                      NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.keys', 'target_table', 'the table with the primary key',                    NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.keys', 'utype', 'lists the utype of keys in the tableset',                  NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),
  ('tap_schema.keys', 'description', 'describes keys in the tableset',                     NULL, NULL, NULL, 'adql:VARCHAR', 512, 1,0,0),

  ('tap_schema.key_columns', 'key_id', 'key to join to tap_schema.keys',                   NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.key_columns', 'from_column', 'column in the from_table',                    NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0),
  ('tap_schema.key_columns', 'target_column', 'column in the target_table',                NULL, NULL, NULL, 'adql:VARCHAR', 64, 1,0,0)
;

INSERT INTO tap_schema.keys (key_id, from_table,target_table) VALUES
  ('k1', 'tap_schema.tables', 'tap_schema.schemas'),
  ('k2', 'tap_schema.columns', 'tap_schema.tables'),
  ('k3', 'tap_schema.keys', 'tap_schema.tables'), -- two separate foreign keys: see below
  ('k4', 'tap_schema.keys', 'tap_schema.tables'), -- two separate foreign keys: see below
  ('k5', 'tap_schema.key_columns', 'tap_schema.keys')
;

INSERT INTO tap_schema.key_columns (key_id,from_column,target_column) VALUES
  ('k1', 'schema_name', 'schema_name'),
  ('k2', 'table_name', 'table_name'),
  ('k3', 'from_table', 'table_name'),
  ('k4', 'target_table', 'table_name'),
  ('k5', 'key_id', 'key_id')
;
