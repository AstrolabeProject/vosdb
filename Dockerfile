FROM postgres:10.11

MAINTAINER Tom Hicks <hickst@email.arizona.edu>

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-q3c \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d /data /scripts/
COPY makeVosDB.sql makeSiaSchema.sql makeSiaTables.sql makeJaguarTable.sql \
     makeCatalogs.sql makeDCCatalogs.sql makeHybridTables.sql \
     makeTapSchema.sql makeTapTables.sql makeTapSelfTables.sql configVosDB.sql ./sql/
COPY makeVosDB.sh /docker-entrypoint-initdb.d/
