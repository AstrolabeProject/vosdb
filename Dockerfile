FROM postgres:10

MAINTAINER Tom Hicks <hickst@email.arizona.edu>

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-q3c \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d /data /scripts/
COPY ./makeIvoaalDB.sql ./makeVosSchema.sql ./makeVosTables.sql /sql/
COPY ./makeDB.sh /docker-entrypoint-initdb.d/
