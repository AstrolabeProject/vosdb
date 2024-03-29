FROM postgres:14

MAINTAINER Tom Hicks <hickst@email.arizona.edu>

RUN apt-get update \
    && apt-get install -y --no-install-recommends postgresql-14-q3c \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /docker-entrypoint-initdb.d /data /scripts /sql
COPY sql /sql
COPY makeDB.sh /docker-entrypoint-initdb.d/
