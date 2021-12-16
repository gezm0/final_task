Scripts for final task

# db
<b>backup_db.sh</b> for backing database "final_task" from postgresql. <br>
<b>backup_articles.sh</b> for backing result of query (external file backup_articles.sql). <br>
<b>backup_db.sh.bak</b> is old variant of previous script. <br>
<b>iptables_db.sh</b> bash iptables script for db machine.<br>
<b>script_mail.sh</b> is mailing script (script2 from final task).<br>

# router
<b><i>"intercept"</i></b> directory includes two examples of traffic dumps and short description of actions how it works.<br>
<b>iptables_router.sh</b> bash iptables script for router machine.<br>
<b>latency_down.sh</b> bash script for switching off network latency emulation demonstration with tc tool.<br>
<b>latency_up.sh</b> bash script for switching on network latency emulation demonstration with tc tool.<br>

# web
<b>Articles.csv</b> CSV file with raw data for table 'Articles' from 'final_task' database.<br>
<b>article_types.csv</b> CSV file with raw data for table 'types' from 'final_task' database.<br>
<b>articles.html</b> output html file with data from 'final_task' for webserver serving.<br>
<b>author.csv</b> CSV file with raw data for table 'author' from 'final_task' database.<br>
<b>backup_articles.sql</b> SQL query to get data from 'final_task' database.<br>
<b>create_Articles.sh</b> and create_Articles.sql script and query for filling table Articles in 'final_task' database.<br>
<b>create_all.sh</b> and create_all.sql script and query for creating tables in 'final_task' database.<br>
<b>create_article_types.sh</b> bash script for loading data to 'article_types' in 'final_task' database.<br>
<b>create_author.sh</b> script for loading data to 'author' table in 'final_task' database.<br>
<b>create_magazines.sh</b> script for loading data to 'magazines' table in 'final_task' database.<br>
<b>from_db2html.py</b> python script for query, parse and output data from 'final_task' database to articles.html file, served by webserver.<br>
<b>iptables_web.sh</b> bash iptables script for web machine.<br>
<b>magazines.csv</b> CSV file with raw data for table 'magazines' from 'final_task' database.<br>
<b>style.css</b> CSS file for articles.html.
