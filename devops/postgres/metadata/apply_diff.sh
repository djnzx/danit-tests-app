#!/bin/bash

# https://dba.stackexchange.com/questions/14740/how-to-use-psql-with-no-password-prompt/14741#14741?newreg=b9eb561666014c5bbbc2b509d38d50f1

export PGPASSWORD=pg123457
POSTGRES_ROOT=/Library/PostgreSQL/10/bin
export PATH=$POSTGRES_ROOT:$PATH
PSQLAPP=psql

DELTA_FILE=$1
if [ -z "$1" ]
then
    echo "parameter 1 should be file name with delta"
    exit 1
fi

DB_NAME=$2
if [ -z "$2" ]
then
    echo "parameter 2 should be DB name"
    exit 1
fi

IP_ADDR=$3
if [ -z "$3" ]
then
    echo "parameter 3 should be IP address"
    exit 1
fi

$PSQLAPP -U postgres -h $IP_ADDR -d $DB_NAME -f $DELTA_FILE