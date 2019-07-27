#!/bin/bash

echo "Creating the VOS Database and Users ..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeVosDB.sql

echo "Creating the JWST SIA schema and installing the Q3C extension ..."
/usr/bin/psql -U postgres -d vos -f /sql/makeJwstSiaSchema.sql

echo "Creating the JWST tables in the SIA Schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeJwstSiaTables.sql
