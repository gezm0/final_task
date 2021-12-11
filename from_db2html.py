#!/usr/lib/python

from os import read
import psycopg2

conn = psycopg2.connect(host='10.0.1.201', 
                        port="5432", 
                        dbname='final_task', 
                        user='study', 
                        password='test')

query_file  = 'backup_articles.sql'
query_result = []

cursor = conn.cursor()

# defining query
#query_db="SELECT magazines.name, article_types.type, author.author FROM magazines, article_types, author, articles WHERE articles.magazines_id=magazines.id AND articles.article_type_id=article_types.id AND articles.author_id=author.id"

# reading query from file
with open(query_file, 'r') as f:
        query_db = f.read()

cursor.execute(query_db)
query_result = cursor.fetchall()

# printing raw data
print(query_result)