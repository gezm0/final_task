CREATE TABLE author (id SERIAL PRIMARY KEY, author VARCHAR (255) NOT NULL);
CREATE TABLE article_types (id SERIAL PRIMARY KEY, type VARCHAR (255) NOT NULL);
CREATE TABLE magazines (id SERIAL PRIMARY KEY, name VARCHAR (255) NOT NULL);
CREATE TABLE Articles (id SERIAL PRIMARY KEY, magazines_id INT NOT NULL, article_type_id INT NOT NULL, author_id INT NOT NULL);
