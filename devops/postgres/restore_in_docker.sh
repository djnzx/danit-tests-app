#!/usr/bin/env bash
docker exec -it 6d3439d640f5 pg_restore --verbose --username=postgres --dbname=danit /var/lib/postgresql/data/danit.backup.2019-02-03_07-01.bk
