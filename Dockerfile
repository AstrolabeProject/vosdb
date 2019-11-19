FROM postgres:10

MAINTAINER Tom Hicks <hickst@email.arizona.edu>

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-q3c \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d /data /scripts/
COPY makeVosDB.sql makeSiaSchema.sql makeSiaTables.sql makeCatTables.sql \
     makeTapSchema.sql makeTapTables.sql makeTapSelfTables.sql configVosDB.sql .//sql/
COPY makeVosDB.sh /docker-entrypoint-initdb.d/
