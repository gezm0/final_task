drop table author;
CREATE TABLE author (id INT NOT NULL, author VARCHAR (255) NOT NULL);
\COPY author FROM '/home/gezm0/author.csv' DELIMITER ';' CSV HEADER;
select * from author;
