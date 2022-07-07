#!/bin/bash

echo "# Creating the ALWS Database and Roles..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeDB.sql

echo "# Creating the Users and the Q3C extension..."
/usr/bin/psql -U postgres -d alws -f /sql/configDB.sql

echo "# Creating the Image Metadata table..."
/usr/bin/psql -U astrolabe -d alws -f /sql/makeImageTables.sql

echo "# Creating the Catalog & CatRow table..."
/usr/bin/psql -U astrolabe -d alws -f /sql/makeCatTables.sql
