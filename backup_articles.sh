#!/bin/sh

PGPASSWORD=test
export PGPASSWORD
path_dump=/local/files
path_back=/local/backups
db_user=study
db_host=db
db_name=final_task

# making query and compressing result
psql -h $db_host -U $db_user -d $db_name -f /local/scripts/backup_articles.sql | gzip -9 > $path_dump/$db_name.`date +%F`.articles.sql.gz

# moving dumps older than 3 days to backups storage
find $path_dump/ -name "*.articles.sql.gz" -type f -mtime +3 -exec mv '{}' $path_back \;

# deleting REALLY old backups
find $path_back/ -name "*.articles.sql.gz" -type f -mtime +180 -delete

# clearing variable
unset PGPASSWORD
