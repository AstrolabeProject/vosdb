#!/bin/bash

echo "Creating the IVOAAL Database and Users ..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeIvoaalDB.sql

echo "Creating the VOS schema and installing the Q3C extension ..."
/usr/bin/psql -U postgres -d ivoaal -f /sql/makeVosSchema.sql

echo "Creating the VOS tables in the VOS Schema..."
/usr/bin/psql -U astrolabe -d ivoaal -f /sql/makeVosTables.sql
