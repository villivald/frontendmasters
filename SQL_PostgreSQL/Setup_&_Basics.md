## SQL & PostgreSQL

### Docker commands for course setup:

```bash
docker run -e POSTGRES_PASSWORD=lol --name=pg --rm -d -p 5432:5432 postgres:14 # run postgres with password lol, name it pg, remove it when stopped, run in background, map port 5432 to 5432

docker exec -u postgres -it pg psql # run psql in container pg as user postgres
```

### psql commands

```sql
\l -- list databases
\d -- show tables
\c -- connect to database
\du -- list users
\q -- quit
\! -- execute shell command (e.g. \! ls)
```

### SQL basics

```sql
CREATE DATABASE dbname; -- create database

\c dbname; -- connect to database

CREATE TABLE ingredients (
id INT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
title VARCHAR(255) UNIQUE NOT NULL
); -- create table

\d ingredients; -- show table structure

INSERT INTO ingredients (title) VALUES ('bell pepper'); -- insert row

SELECT * FROM ingredients; -- show all rows

DROP TABLE ingredients; -- drop table

ALTER TABLE ingredients ADD COLUMN image VARCHAR (255); -- add column
ALTER TABLE ingredients DROP COLUMN image; -- drop column
```
