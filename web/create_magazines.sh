#!/usr/bin/bash

PGPASSWORD=test
export PGPASSWORD
source_file="/home/gezm0/db/magazines.csv"	# source file with data
IFS=$'\n'					# filesystem artefact

for item in $(cat $source_file)
do
	# insert into table_name (column)...
	echo "insert into magazines (name) values ('$item')" | psql -h db -U study -d test
done

unset PGPASSWORD
