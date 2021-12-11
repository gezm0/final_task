#!/bin/sh

PGPASSWORD=test
export PGPASSWORD
path_dump=/local/files
path_back=/local/backups
db_user=study
db_host=db
db_name=final_task

# dumping database and compressing it
pg_dump -h $db_host -U $db_user -d $db_name | gzip -9 > $path_dump/$db_name.`date +%F`.all.sql.gz

# check for condition 'no more than 3 files' and moving dumps to backups storage if there more then 3

find $path_dump -name "*.all.sql.gz" -type f -printf '%T@ %i\n' | sort -n | head -n -3 | while read tstamp inode; do \
find $path_dump -inum "$inode" -exec mv '{}' $path_back \;; done

# deleting REALLY old backups
find $path_back -name "*.all.sql.gz" -type f -mtime +90 -delete

# clearing variable
unset PGPASSWORD
