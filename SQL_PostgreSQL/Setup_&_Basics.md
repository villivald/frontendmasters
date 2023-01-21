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
```

### Insert

```sql
INSERT INTO ingredients (title) VALUES ('bell pepper'); -- insert row

INSERT INTO ingredients (title, image, type)
VALUES ('red pepper', 'red_pepper.jpg', 'vegetable'); -- insert row with multiple columns

INSERT INTO ingredients (title, image, type)
VALUES('avocado', 'avocado.jpg', 'fruit'),
ON CONFLICT DO NOTHING; -- will not crush if row already exists

ON CONFLICT (title) DO UPDATE SET image = excluded.image; -- update image if row already exists
```

### Select

```sql
SELECT * FROM ingredients; -- show all rows
SELECT title FROM ingredients; -- show only title column
SELECT title, image FROM ingredients LIMIT 2; -- show only title and image columns, limit to 2 rows
SELECT title FROM ingredients LIMIT 10 OFFSET 2; -- show only title column, limit to 10 rows, skip first 2 rows
SELECT title FROM ingredients WHERE type id > 2 LIMIT 10; -- show only title column, limit to 10 rows, skip first 2 rows
SELECT * FROM ingredients WHERE id <= 10 AND title != 'banana' OR id = 25; -- show all rows, where id is less or equal to 10 and title is not banana or id is 25
SELECT * FROM ingredients ORDER BY id DESC LIMIT 5; -- show all rows, order by id descending, limit to 5 rows
```

### Drop, Alter, Update, Delete

```sql
DROP TABLE ingredients; -- drop table

ALTER TABLE ingredients ADD COLUMN image VARCHAR (255); -- add column
ALTER TABLE ingredients DROP COLUMN image; -- drop column

UPDATE ingredients SET image = 'strawberry.jpg' WHERE title = 'chicken'; -- update row
UPDATE ingredients SET image = 'strawberry.jpg' WHERE title = 'chicken' RETURNING title, image, id, type; -- update row and return updated row (can use * instead of columns)

DELETE FROM ingredients WHERE image='delete.jpg' RETURNING *; -- delete specific row and return it
```

### LIKE, ILIKE, Functions

```sql
SELECT * FROM ingredients WHERE title LIKE 'pota%'; -- show all rows where title starts with pota
SELECT * FROM ingredients WHERE title ILIKE 'Pota%'; -- show all rows where title starts with pota (case insensitive)
SELECT * FROM ingredients WHERE CONCAT(title, type) ILIKE '%fruit'; -- show all rows where title or type contains fruit (case insensitive)
SELECT * FROM ingredients WHERE title LIKE 'ch_rry'; -- show all rows where title contains ch and one character and rry
```

## Connecting to a PostgreSQL database

```js
const pg = require("pg");
const pool = new pg.Pool({
  user: "postgres",
  host: "localhost",
  database: "recipeguru",
  password: "lol",
  port: 5432,
});

const { rows } = await pool.query(`SELECT * FROM recipes`);

const { id } = req.query;

const { rows2 } = await pool.query(`SELECT * FROM ingredients WHERE id=$1`, [
  id,
]);
```
