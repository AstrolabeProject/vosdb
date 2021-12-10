--
-- Create a separate database for ALWS administration.
--
CREATE DATABASE aladmin;

GRANT CONNECT ON DATABASE aladmin TO readonly;
GRANT CREATE, CONNECT ON DATABASE aladmin TO readwrite;
