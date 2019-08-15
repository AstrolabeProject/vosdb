--
-- Create tables for the tap_schema.
--   This script assumes that the database and tap_schema schema have already been created.
--   Taken from DALserver V0.9+NOAO mods (V0.10?).
--   Sizes for fields are rather arbitrary and generous.
--   Tested with: PostgreSQL 8.x, 10.x, and Sybase 15.x.
--
CREATE TABLE tap_schema.schemas (
    schema_name   varchar(64),
    utype         varchar(512) NULL,
    description   varchar(512) NULL,

    primary key (schema_name)
);

CREATE TABLE tap_schema.tables (
    schema_name   varchar(64),
    table_name    varchar(128),
    table_type    varchar(8),
    utype         varchar(512) NULL,
    description   varchar(512) NULL,

    primary key (table_name),
    foreign key (schema_name) references tap_schema.schemas (schema_name)
);

CREATE TABLE tap_schema.columns (
    table_name    varchar(128),
    column_name   varchar(64),
    utype         varchar(512) NULL,
    ucd           varchar(64)  NULL,
    unit          varchar(64)  NULL,
    description   varchar(512) NULL,
    datatype      varchar(64)  NOT NULL,
    size          integer      NULL,
    principal     integer      NOT NULL,
    indexed       integer      NOT NULL,
    std           integer      NOT NULL,
    -- globally unique columnID for use as an XML ID attribute on the FIELD in VOTable output
    id            varchar(32)  NULL,

    primary key (table_name,column_name),
    foreign key (table_name) references tap_schema.tables (table_name)
);

CREATE TABLE tap_schema.keys (
    key_id        varchar(64),
    from_table    varchar(128) NOT NULL,
    target_table  varchar(128) NOT NULL,
    utype         varchar(512) NULL,
    description   varchar(512) NULL,

    primary key (key_id),
    foreign key (from_table) references tap_schema.tables (table_name),
    foreign key (target_table) references tap_schema.tables (table_name)
);

CREATE TABLE tap_schema.key_columns (
    key_id        varchar(64),
    from_column   varchar(64)  NOT NULL,
    target_column varchar(64)  NOT NULL,

    foreign key (key_id) references tap_schema.keys (key_id)
);

GRANT SELECT ON ALL TABLES IN SCHEMA tap_schema TO tapuser;
GRANT SELECT ON ALL TABLES IN SCHEMA tap_schema TO readonly;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA tap_schema TO readwrite;
GRANT USAGE ON ALL SEQUENCES IN SCHEMA tap_schema TO readwrite;
