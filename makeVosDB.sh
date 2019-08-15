#!/bin/bash

echo "Creating the VOS Database and Users ..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeVosDB.sql

echo "Creating the TAP schema in the TAP schema..."
/usr/bin/psql -U postgres -d vos -f /sql/makeTapSchema.sql

echo "Creating the TAP tables in the TAP schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeTapTables.sql

echo "Loading the TAP-self (reflexive) data into the TAP tables in the TAP schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeTapSelfTables.sql

echo "Creating the JWST SIA schema and installing the Q3C extension ..."
/usr/bin/psql -U postgres -d vos -f /sql/makeJwstSiaSchema.sql

echo "Creating the JWST tables in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeJwstSiaTables.sql
