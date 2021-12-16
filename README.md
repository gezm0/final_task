Scripts for final task

# db
Contains bash scripts: 
backup_db.sh for backing database "final_task" from postgresql. 
backup_articles.sh for backing result of query (external file backup_articles.sql). 
backup_db.sh.bak is old variant of previous script. 
iptables_db.sh bash iptables script for db machine.
script_mail.sh is mailing script (script2 from final task).

# router
"intercept" directory includes two examples of traffic dumps and short description of actions how it works.
iptables_router.sh bash iptables script for router machine.
latency_down.sh bash script for switching off network latency emulation demonstration with tc tool.
latency_up.sh bash script for switching on network latency emulation demonstration with tc tool.

# web
Articles.csv CSV file with raw data for table 'Articles' from 'final_task' database.
article_types.csv CSV file with raw data for table 'types' from 'final_task' database.
articles.html output html file with data from 'final_task' for webserver serving.
author.csv CSV file with raw data for table 'author' from 'final_task' database.
backup_articles.sql SQL query to get data from 'final_task' database.
create_Articles.sh and create_Articles.sql script and query for filling table Articles in 'final_task' database.
create_all.sh and create_all.sql script and query for creating tables in 'final_task' database.
create_article_types.sh bash script for loading data to 'article_types' in 'final_task' database.
create_author.sh script for loading data to 'author' table in 'final_task' database
create_magazines.sh script for loading data to 'magazines' table in 'final_task' database
from_db2html.py python script for query, parse and output data from 'final_task' database to articles.html file, served by webserver.
iptables_web.sh bash iptables script for web machine.
magazines.csv CSV file with raw data for table 'magazines' from 'final_task' database.
style.css CSS file for articles.html.
