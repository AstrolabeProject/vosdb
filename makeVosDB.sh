#!/bin/bash

echo "Creating the VOS Database and Roles..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeVosDB.sql

echo "Creating the Hybrid schema and installing the Q3C extension..."
/usr/bin/psql -U postgres -d vos -f /sql/makeHybridSchema.sql

echo "Creating the Users..."
/usr/bin/psql -U postgres -d vos -f /sql/configVosDB.sql

echo "Creating the Image table in the Hybrid schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeImageTables.sql
