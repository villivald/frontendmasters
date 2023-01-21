## Joins & Constraints

```sql
CREATE TABLE recipes (
  recipe_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  title VARCHAR ( 255 ) UNIQUE NOT NULL,
  body TEXT
);

CREATE TABLE recipes_photos (
  photo_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  recipe_id INTEGER,
  url VARCHAR(255) NOT NULL
);

INSERT INTO recipes
  (title, body)
VALUES
  ('cookies', 'very yummy'),
  ('empanada','ugh so good'),
  ('jollof rice', 'spectacular'),
  ('shakshuka','absolutely wonderful'),
  ('khachapuri', 'breakfast perfection'),
  ('xiao long bao', 'god I want some dumplings right now');

INSERT INTO recipes_photos
  (recipe_id, url)
VALUES
  (1, 'cookies1.jpg'),
  (1, 'cookies2.jpg'),
  (1, 'cookies3.jpg'),
  (1, 'cookies4.jpg'),
  (1, 'cookies5.jpg'),
  (2, 'empanada1.jpg'),
  (2, 'empanada2.jpg'),
  (3, 'jollof1.jpg'),
  (4, 'shakshuka1.jpg'),
  (4, 'shakshuka2.jpg'),
  (4, 'shakshuka3.jpg'),
  (5, 'khachapuri1.jpg'),
  (5, 'khachapuri2.jpg');
```

Join is used to combine rows from two or more tables, based on a related column between them.

```sql
SELECT recipe.title, recipe.body, photo.url
FROM recipes_photos photo
INNER JOIN -- RIGHT JOIN, LEFT JOIN, FULL JOIN
recipes recipe
ON
photo.recipe_id = recipe.recipe_id;

--RESULT:
--     title    |         body         |       url
-- -------------+----------------------+-----------------
--  cookies     | very yummy           | cookies1.jpg
--  cookies     | very yummy           | cookies2.jpg
--  cookies     | very yummy           | cookies3.jpg
--  cookies     | very yummy           | cookies4.jpg
--  cookies     | very yummy           | cookies5.jpg
--  empanada    | ugh so good          | empanada1.jpg
--  empanada    | ugh so good          | empanada2.jpg
--  jollof rice | spectacular          | jollof1.jpg
--  shakshuka   | absolutely wonderful | shakshuka1.jpg
--  shakshuka   | absolutely wonderful | shakshuka2.jpg
--  shakshuka   | absolutely wonderful | shakshuka3.jpg
--  khachapuri  | breakfast perfection | khachapuri1.jpg
--  khachapuri  | breakfast perfection | khachapuri2.jpg
```

Types of joins:
![SQL Joins](/images/SQL_Joins.png)

NATURAL JOIN - joins every column with the same name in both tables
CROSS JOIN - joins every row in one table with every row in another table

## Foreign keys & Managing References

### One-to-Many Relationships

```sql
CREATE TABLE recipes_photos (
photo_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
url VARCHAR(255) NOT NULL,
recipe_id INT REFERENCES recipes(recipe_id) ON DELETE CASCADE -- ON DELETE CASCADE deletes all rows in the child table that have a matching value in the parent table
);
```

### Many-to-Many Relationships

```sql
CREATE TABLE recipe_ingredients (
recipe_id INT REFERENCES recipes(recipe_id) ON DELETE NO ACTION,
ingredient_id INT REFERENCES ingredients(id) ON DELETE NO ACTION,
CONSTRAINT recipe_ingredients_pk PRIMARY KEY (recipe_id, ingredient_id)
);

INSERT INTO recipe_ingredients
  (recipe_id, ingredient_id)
VALUES
  (1, 10),
  (1, 11),
  (1, 13),
  (2, 5),
  (2, 13);

SELECT
  i.title AS ingredient_title,
  i.image AS ingredient_image,
  i.type AS ingredient_type
FROM
  recipe_ingredients ri
INNER JOIN
  ingredients i
ON
  i.id = ri.ingredient_id
WHERE
  ri.recipe_id = 1;

--RESULT:
--  ingredient_title | ingredient_image | ingredient_type
-- ------------------+------------------+-----------------
--  chicken          | chicken.jpg      | meat
--  corn             | corn.jpg         | vegetable
--  eggplant         | eggplant.jpg     | vegetable

SELECT
  i.title AS ingredient_title,
  i.image AS ingredient_image,
  i.type AS ingredient_type,
  r.title AS recipe_title,
  r.body AS recipe_body,
  r.recipe_id AS rid,
  i.id AS iid
FROM
  recipe_ingredients ri
INNER JOIN
  ingredients i
ON
  i.id = ri.ingredient_id
INNER JOIN
  recipes r
ON
  r.recipe_id = ri.recipe_id;

--RESULT:
--  ingredient_title | ingredient_image | ingredient_type | recipe_title | recipe_body | rid | iid
-- ------------------+------------------+-----------------+--------------+-------------+-----+-----
--  chicken          | chicken.jpg      | meat            | cookies      | very yummy  |   1 |  10
--  corn             | corn.jpg         | vegetable       | cookies      | very yummy  |   1 |  11
--  eggplant         | eggplant.jpg     | vegetable       | cookies      | very yummy  |   1 |  13
--  blueberry        | blueberry.jpg    | fruit           | empanada     | ugh so good |   2 |   5
--  eggplant         | eggplant.jpg     | vegetable       | empanada     | ugh so good |   2 |  13
```
