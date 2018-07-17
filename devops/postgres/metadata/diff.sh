#!/bin/bash

DIFFAPP=~/dev/apgdiff/apgdiff-2.4.jar
SRC=metadata_127.0.0.1.sql
SRC9=metadata_127.0.0.1v9.sql
DST=metadata_193.151.90.188.sql
RESULT=diff.sql

./grab_all_meta.sh

more $SRC | grep -v "AS integer" > $SRC9
java -jar $DIFFAPP $DST $SRC9 > $RESULT
