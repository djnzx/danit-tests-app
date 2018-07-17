
gzip -d $FILE
/Library/PostgreSQL/10/bin/dropdb --username=postgres danit
/Library/PostgreSQL/10/bin/createdb --username=postgres danit
/Library/PostgreSQL/10/bin/pg_restore --verbose --username=postgres --dbname=danit ./$1