scp alexr@193.151.90.188:/home/alexr/$1.gz .
gzip -d $1.gz
/Library/PostgreSQL/10/bin/dropdb --username=postgres danit
/Library/PostgreSQL/10/bin/createdb --username=postgres danit
/Library/PostgreSQL/10/bin/pg_restore --verbose --username=postgres --dbname=danit ./$1