#!/usr/lib/python3.6

from os import read
import psycopg2
from datetime import datetime

# define connection method
conn = psycopg2.connect(host='10.0.1.201', 
                        port="5432", 
                        dbname='test', 
                        user='study', 
                        password='test')

# checking the connection status and displaying the result
if conn:
        print('All OK')
else:
        print('Something wrong with connection')
        breakpoint

query_file  = 'backup_articles.sql'     # file with query to database
query_result = ()                       # empty tuple for query result
result_file = 'articles.html'           # output html file
current_datetime = datetime.now()       # current time for page time marker
cursor = conn.cursor()                  # need for working with database

# top (constant) part of output file
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

# bottom (contstant) part of output file with time marker
foot_html = str(f"</table></center><p align=right>Generated at: {current_datetime}</p></body></html>")

# we can define query
#query_db="SELECT magazines.name, article_types.type, author.author FROM magazines, article_types, author, articles WHERE articles.magazines_id=magazines.id AND articles.article_type_id=article_types.id AND articles.author_id=author.id"

# or read query from file
with open(query_file, 'r') as query_sql:
        query_db = query_sql.read()
# execution of query
        cursor.execute(query_db)
# receiving result of query
        query_result = cursor.fetchall()

# parse result of query to database and write output file
with open(result_file, 'w') as file:
# at first write top part of file
        file.write(head_html)
# make table row in html for each line from result of query
        for line in query_result:
                file.write("<tr>")
# don't forget to make line end
                file.write("\n")
# make cells for each item from row
                for item in line:
                        text = "<td><center>"+str(item)+"</center></td>"+"\n"
# and write them
                        file.write(text)
# write closing tags for row and end of line symbol
                file.write("</tr>")
                file.write("\n")
# at the end write bottom part of output file
        file.write(foot_html)

# close database connection if it exist
if conn:
        cursor.close()
        conn.close()
# report time of this action
        print(f"PostgreSQL connection is closed at {current_datetime}")
