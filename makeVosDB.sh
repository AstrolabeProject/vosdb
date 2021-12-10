#!/bin/bash

echo "# Creating the VOS Database and Roles..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeVosDB.sql

echo "# Creating the ALAdmin Database..."
/usr/bin/psql -U postgres -d postgres -f /sql/makeALAdminDB.sql

echo "# Creating the SIA schema and installing the Q3C extension ..."
/usr/bin/psql -U postgres -d vos -f /sql/makeSiaSchema.sql

echo "# Creating the TAP schema in the TAP schema..."
/usr/bin/psql -U postgres -d vos -f /sql/makeTapSchema.sql

echo "# Creating the Users ..."
/usr/bin/psql -U postgres -d vos -f /sql/configVosDB.sql

echo "# Creating the TAP tables in the TAP schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeTapTables.sql

echo "# Loading the TAP-self (reflexive) data into the TAP tables in the TAP schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeTapSelfTables.sql

echo "# Creating the Image tables in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeSiaTables.sql

echo "# Creating the Hybrid table in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeHybridTables.sql

echo "# Creating the Jaguar Catalog table in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeJaguarTable.sql

echo "# Creating other JADES Catalog tables in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeCatalogs.sql

echo "# Creating mini Data Challenge Catalog tables in the SIA schema..."
/usr/bin/psql -U astrolabe -d vos -f /sql/makeDCCatalogs.sql
