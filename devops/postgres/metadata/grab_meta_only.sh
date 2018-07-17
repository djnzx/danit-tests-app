#!/bin/bash

POSTGRES_ROOT=/Library/PostgreSQL/10/bin
export PATH=$POSTGRES_ROOT:$PATH
IP=$1
BASE=$2
PREFIX=$3

if [ -z "$1" ]
then
    echo "parameter 1 should be IP address"
    exit 1
fi

if [ -z "$2" ]
then
    echo "parameter 2 should be database name"
    exit 1
fi

if [ -z "$3" ]
then
    echo "parameter 3 should be SQL file name prefix"
    exit 1
fi

pg_dump -s --no-owner --username=postgres --host=$IP $BASE > $PREFIX$IP.sql
