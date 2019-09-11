#!/bin/bash --norc
#
#  Written by: Tom Hicks, adapted from Mike Fitzpatrick (NOAO).
#  Last Modified: Minor update to error messages.
#
#  Create and/or load a PostgreSQL database with a SIA protocol schema and data.
#
#  Script Arguments:
#
#    --init    Drop and/or reinitialize the schema and load all tables
#
#  This flag will initialize all schema, first dropping any existing schema
#  (including any tables they contain!). This can be used to re-initialize the
#  SIA schema entirely. Initialization must be run at least once since we don't
#  check that the schema already exists before loading tables.
#
#    --load    Load all JWST SIA tables
#
#  Loads the JWST SIA table:  sia.jwst
#
#    --append  Use of this flag on an existing schema will append rows to the
#              SIA tables from the corresponding files in the given data directory.
#
#  Examples:
#

Usage () {
    echo "Usage:"
    echo "  $0 [options]"
    echo ""
    echo "  options:"
    echo "    -a, --append           - append data to the existing SIA tables"
    echo "    -d, --datadir <path>   - directory with input data to append or load to existing SIA tables (default: /data)"
    echo "    -h, --help             - print this help message and exit"
    echo "    -i, --init             - initialize (or reinitialize) a schema"
    echo "    -l, --load             - load (or reload) the SIA tables"
    echo "    -n, --noop             - show what would be run without executing it"
    echo "    -q, --quser <name>     - the username of the user to query with (default: alquery)"
    echo "    -s, --schema <name>    - the name of the schema to work on (default: sia)"
    echo "    -v, --verbose          - provide more information during run"
    echo "        --debug            - show additional debugging information"
    echo ""
}

# test for the Help argument
if [ "$1" = "-h" -o "$1" = "--help" ]; then
  Usage
  exit 1
fi

# use or initialize standard PostgreSQL environment variables:
#
export PGDATA=${PGDATA:-/var/lib/postgresql/data}
export PGDATABASE=${PGDATABASE:-vos}
export PGHOST=${PGHOST:-localhost}
export PGPASSFILE=${PGPASSFILE:-/.pgpass}
export PGPORT=${PGPORT:-5432}              # NOTE: remapped for Docker based PostgreSQL
export PGUSER=${PGUSER:-astrolabe}

# use or initialize some variables of our own:
#
DATA_DIR=${DATA_DIR:-/data}
QUERY_USER=${QUERY_USER:-alquery}
SCHEMA_NAME=${SCHEMA_NAME:-sia}


# variables corresponding to possible script arguments:
#
APPEND_FLAG=""
DEBUG=0
DO_APPEND=0
DO_INIT=0
DO_LOAD=0
NOOP=0
VERBOSE=0

# parse the script arguments:
#
while [ $# -gt 0 ]; do
    case "$1" in
        "-a"|"--append")  DO_APPEND=1;
                          APPEND_FLAG="--append";
                          ;;
        "-d"|"--datadir") shift
                          DATA_DIR=${1:-/data}
                          ;;
        "-h"|"--help") Usage
                       exit 1
                       ;;
        "-i"|"--init") DO_INIT=1
                       ;;
        "-l"|"--load") DO_LOAD=1
                       ;;
        "-n"|"--noop") NOOP=1
                       ;;
        "-q"|"--quser") shift
                        QUERY_USER=${1:-alquery}
                        ;;
        "-s"|"--schema") shift
                         SCHEMA_NAME=${1:-sia}
                         ;;
        "-v"|"--verbose") VERBOSE=1
                          ;;
        "--debug") DEBUG=1
                   VERBOSE=1
                   ;;
        *) echo "ERROR: Unknown argument: $1"
           Usage
           exit 2
           ;;
    esac
    shift
done

# print variables for debugging:
#
if [ $DEBUG -eq 1 ]; then
    echo "------------------------------------------------------------"
    echo "PostgreSQL Environment Variables:"
    echo "  PGDATA      = $PGDATA"
    echo "  PGDATABASE  = $PGDATABASE"
    echo "  PGHOST      = $PGHOST"
    echo "  PGPASSFILE  = $PGPASSFILE"
    echo "  PGPORT      = $PGPORT"
    echo "  PGUSER      = $PGUSER"
    echo ""
    echo "VOS DB Environment Variables:"
    echo "  DATA_DIR = $DATA_DIR"
    echo "  QUERY_USER  = $QUERY_USER"
    echo "  SCHEMA_NAME = $SCHEMA_NAME"
    echo ""
    echo "Command Line Flags:"
    echo "  DEBUG=$DEBUG, APPEND=$DO_APPEND, INIT=$DO_INIT, LOAD=$DO_LOAD, NOOP=$NOOP, VERBOSE=$VERBOSE"
    echo "------------------------------------------------------------"
    echo ""
fi

# sanity tests for the provided arguments:
#
if [ $DO_INIT -eq 1 -a $DO_APPEND -eq 1 ]; then
    echo "ERROR: The --init AND --append flags were both specified but Initialization removes existing data."
    Usage
    exit 10
fi

d1=`echo $DATA_DIR | cut -c1`
if [ -z "$DATA_DIR" -o -z "$d1" -o "$d1" = "-" ]; then
    echo "ERROR: The specified input data directory ($DATA_DIR) may not be empty or begin with '-'."
    echo "       Did you forgot to specify the input data directory after the -d or --datadir flag?"
    Usage
    exit 11
fi

q1=`echo $QUERY_USER | cut -c1`
if [ -z "$QUERY_USER" -o -z "$q1" -o "$q1" = "-" ]; then
    echo "ERROR: The specified query username ($QUERY_USER) may not be empty or begin with '-'."
    echo "       Did you forgot to specify the query username after the -q or --quser flag?"
    Usage
    exit 12
fi

s1=`echo $SCHEMA_NAME | cut -c1`
if [ -z "$SCHEMA_NAME" -o -z "$s1" -o "$s1" = "-" ]; then
    echo "ERROR: The specified schema name ($SCHEMA_NAME) may not be empty or begin with '-'."
    echo "       Did you forgot to specify the schema name after the -s or --schema flag?"
    Usage
    exit 13
fi

if [ ! -d "$DATA_DIR" -o ! -r "$DATA_DIR" ]; then
    echo "ERROR: The specified data input directory ($DATA_DIR) must exist and be readable."
    Usage
    exit 20
fi

# export/rexport VOS DB environment variables after checks:
#
export DATA_DIR
export QUERY_USER
export SCHEMA_NAME

exit 0
