#!/usr/bin/env bash
SERVER=alexr@192.168.5.103
PATH=/Users/alexr
FILE=danit_sat.bk
DBNAME=danit
scp $SERVER:$PATH/$FILE .
#gzip -d danit.backup.2018-07-06_08-49.bk.gz
#/Library/PostgreSQL/10/bin/pg_restore ./$FILE -d=$DBNAME
#su postgres
/Library/PostgreSQL/10/bin/dropdb --username=postgres $DBNAME
/Library/PostgreSQL/10/bin/createdb --username=postgres $DBNAME
/Library/PostgreSQL/10/bin/pg_restore --verbose --username=postgres --dbname=$DBNAME ./$FILE