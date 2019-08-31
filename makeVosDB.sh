#!/bin/bash

echo "Creating the VOS Database and Users ..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeVosDB.sql

echo "Creating the TAP schema in the TAP schema..."
/usr/bin/psql -U postgres -d vos -f /sql/makeTapSchema.sql

echo "Creating the TAP tables in the TAP schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeTapTables.sql

echo "Loading the TAP-self (reflexive) data into the TAP tables in the TAP schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeTapSelfTables.sql

echo "Creating the SIA schema and installing the Q3C extension ..."
/usr/bin/psql -U postgres -d vos -f /sql/makeSiaSchema.sql

echo "Creating the Image tables in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeSiaTables.sql

echo "Creating the Catalog tables in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeCatTables.sql

echo "Setting the search_path..."
/usr/bin/psql -U postgres -d vos -c 'SET search_path TO sia, tap_schema, public;'
