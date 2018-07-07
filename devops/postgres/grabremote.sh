#!/usr/bin/env bash
scp root@193.151.90.188:/home/postgres/danit.backup.2018-07-06_08-49.bk.gz .
gzip -d danit.backup.2018-07-06_08-49.bk.gz
/Library/PostgreSQL/10/bin/pg_restore ./danit.backup.2018-07-06_08-49.bk -d=danit3
su postgres
/Library/PostgreSQL/10/bin/dropdb --username=postgres danit
/Library/PostgreSQL/10/bin/createdb --username=postgres danit
/Library/PostgreSQL/10/bin/pg_restore --verbose --username=postgres --dbname=danit ./danit.backup.2018-07-06_08-49.bk