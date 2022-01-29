#!/bin/bash

echo "# Creating the VOS Database and Roles..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeVosDB.sql

echo "# Creating the Users and the Q3C extension..."
/usr/bin/psql -U postgres -d alws -f /sql/configVosDB.sql

echo "# Creating the Image Metadata table..."
/usr/bin/psql -U astrolabe -d alws -f /sql/makeImageTables.sql
