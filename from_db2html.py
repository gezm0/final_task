#!/usr/lib/python

from os import read
import psycopg2
from datetime import datetime

conn = psycopg2.connect(host='10.0.1.201', 
                        port="5432", 
                        dbname='final_task', 
                        user='study', 
                        password='test')

if conn:
        print('All OK')
else:
        print('Something wrong with connection')
        breakpoint

query_file  = 'backup_articles.sql'
query_result = ()
result_file = 'articles.html'
current_datetime = datetime.now()
cursor = conn.cursor()

head_html = '''
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta content="text/html; charset=UTF-8" http-equiv="content-type">
<link rel="stylesheet" type="text/css" href="style.css">
<title>Articles</title>
</head>
<body bgcolor="DarkSlateGray">
<center>
<table>
<tr><h1>Articles</h1><tr>
<tr><th><center><b>Magazine</b></center></th>
<th><center><b>Type</b></center></th>
<th><center><b>Author</b></center></th></b><br>'''

foot_html = str(f"</table></center><p align=right>Generated at: {current_datetime}</p></body></html>")

# define query
#query_db="SELECT magazines.name, article_types.type, author.author FROM magazines, article_types, author, articles WHERE articles.magazines_id=magazines.id AND articles.article_type_id=article_types.id AND articles.author_id=author.id"

# or read query from file
with open(query_file, 'r') as query_sql:
        query_db = query_sql.read()
        cursor.execute(query_db)
        query_result = cursor.fetchall()

with open(result_file, 'w') as file:
        file.write(head_html)
        for line in query_result:
                file.write("<tr>")
                file.write("\n")
                for item in line:
                        text = "<td><center>"+str(item)+"</center></td>"+"\n"
                        file.write(text)
                file.write("</tr>")
                file.write("\n")
        file.write(foot_html)

# close database connection
if conn:
        cursor.close()
        conn.close()
        print(f"PostgreSQL connection is closed at {current_datetime}")
