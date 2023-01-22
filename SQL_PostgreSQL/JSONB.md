### JSONB

```sql
ALTER TABLE recipes
ADD COLUMN meta JSONB;

UPDATE recipes
SET meta = '{ "tags": ["chocolate", "dessert", "cake"] }'
WHERE recipe_id = 16;

SELECT meta FROM recipes WHERE meta IS NOT NULL;
-- {"tags": ["sweet", "fruit"]}
-- {"tags": ["chocolate", "dessert", "cake"]}

SELECT meta -> 'tags' FROM recipes WHERE meta IS NOT NULL;
-- ["sweet", "fruit"]
-- ["chocolate", "dessert", "cake"]

SELECT meta -> 'tags' -> 0 FROM recipes WHERE meta IS NOT NULL;
-- "sweet"
-- "chocolate"

SELECT meta -> 'tags' ->> 0 AS first_tag FROM recipes WHERE meta IS NOT NULL;
--  first_tag
-- -----------
--  sweet
--  chocolate

SELECT recipe_id, title, meta -> 'tags' FROM recipes
WHERE meta -> 'tags' ? 'cake';
--  recipe_id |           title           |             ?column?
-- -----------+---------------------------+----------------------------------
--         16 | Jenny's Black Forest Cake | ["chocolate", "dessert", "cake"]

SELECT recipe_id, title, meta -> 'tags' FROM recipes
WHERE meta -> 'tags' @> '"cake"'; --does the array contain the string "cake"
```
