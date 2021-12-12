CREATE TABLE author (id INT NOT NULL, author VARCHAR (255) NOT NULL);
CREATE TABLE article_types (id INT NOT NULL, type VARCHAR (255) NOT NULL);
CREATE TABLE magazines (id INT NOT NULL, name VARCHAR (255) NOT NULL);
CREATE TABLE Articles (id INT NOT NULL, magazines_id INT NOT NULL, article_type_id INT NOT NULL, author_id INT NOT NULL);
