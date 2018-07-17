#!/bin/bash

POSTGRES_ROOT=/Library/PostgreSQL/10/bin
export PATH=$POSTGRES_ROOT:$PATH

# VARIABLES
IP=alexr@193.151.90.188
PATHTO=/backup/danit
FILE=danit.backup.bk.gz
FILEWOZIP=$(echo "$FILE" | sed 's/\.[^.]*$//')
DBNAME=$1

# GRAB
scp $IP:$PATHTO/$FILE .

# UNPACK
gzip -f -d $FILE

# DROP

if [ -z "$1" ]
then
    echo "parameter 1 should be database name"
    exit 1
fi

dropdb --username=postgres $DBNAME
createdb --username=postgres $DBNAME