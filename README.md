Scripts for final task

# db
backup_db.sh for backing database "final_task" from postgresql. <br>
backup_articles.sh for backing result of query (external file backup_articles.sql). <br>
backup_db.sh.bak is old variant of previous script. <br>
iptables_db.sh bash iptables script for db machine.<br>
script_mail.sh is mailing script (script2 from final task).<br>

# router
"intercept" directory includes two examples of traffic dumps and short description of actions how it works.<br>
iptables_router.sh bash iptables script for router machine.<br>
latency_down.sh bash script for switching off network latency emulation demonstration with tc tool.<br>
latency_up.sh bash script for switching on network latency emulation demonstration with tc tool.<br>

# web
Articles.csv CSV file with raw data for table 'Articles' from 'final_task' database.<br>
article_types.csv CSV file with raw data for table 'types' from 'final_task' database.<br>
articles.html output html file with data from 'final_task' for webserver serving.<br>
author.csv CSV file with raw data for table 'author' from 'final_task' database.<br>
backup_articles.sql SQL query to get data from 'final_task' database.<br>
create_Articles.sh and create_Articles.sql script and query for filling table Articles in 'final_task' database.<br>
create_all.sh and create_all.sql script and query for creating tables in 'final_task' database.<br>
create_article_types.sh bash script for loading data to 'article_types' in 'final_task' database.<br>
create_author.sh script for loading data to 'author' table in 'final_task' database.<br>
create_magazines.sh script for loading data to 'magazines' table in 'final_task' database.<br>
from_db2html.py python script for query, parse and output data from 'final_task' database to articles.html file, served by webserver.<br>
iptables_web.sh bash iptables script for web machine.<br>
magazines.csv CSV file with raw data for table 'magazines' from 'final_task' database.<br>
style.css CSS file for articles.html.
