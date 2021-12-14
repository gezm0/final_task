#!/usr/bin/bash

PGPASSWORD=test
export PGPASSWORD
source_file="/home/gezm0/db/author.csv"		# source file with data
IFS=$'\n'					# filesystem artefact

for item in $(cat $source_file)
do
	echo "insert into author (author) values ('$item')" | psql -h db -U study -d test
done

unset PGPASSWORD
