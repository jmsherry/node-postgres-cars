# SQL QUIZ ANSWERS


## Questions

1. Create a database called 'vets'
```sql
CREATE DATABASE vets;
```
2. List the databases to see if it's there
```sql
\l
```
3. Delete it
```sql
DROP DATABASE vets;
```
4. Check that it has gone
```sql
\l
```
5. Re-create it
```sql
CREATE DATABASE vets;
```
6. Connect to it and confirm that you are connected
```sql
\c vets
\conninfo
```
7. Create a table called 'owners'. It will have an id for each owner; a name (required), and; an email
```sql
CREATE TABLE owners(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) UNIQUE
);
```
8. Create a table called 'pets'. It will have an id for each pet; a name; a type (cat, dog, etc.) a weight (in kg) column - all required. It will also have an 'owner' field which will have the id of their owner
```sql
CREATE TABLE pets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  type VARCHAR(50),
  weight DECIMAL,
  owner INTEGER,
  constraint fk_owner
     foreign key (owner) 
     REFERENCES pets (id)
);
```
9. Alter the pets table to make the type required
```sql
ALTER TABLE pets ALTER COLUMN type SET NOT NULL;
```
10. What is the command to inspect the table to see the constraints? Check they are correct.
```sql
\d owners
```
11. Insert the following data

### Owners

| name | email          |
| ---- | -------------- |
| tom  | tom@yahoo.com  |
| jane | jane@gmail.com |
| adam | adam@yahoo.com |
| andy | andy@gmail.com |

```sql
INSERT INTO owners (name, email) VALUES 
( 'tom', 'tom@yahoo.com' ),
( 'jane', 'jane@gmail.com' ),
( 'adam', 'adam@yahoo.com' ),
( 'andy', 'andy@gmail.com' );
```

### Pets

**Owner's names are shown. You need to link that to their ids**

| name       | type   | weight | owner |
| ---------- | ------ | ------ | ----- |
| tiddles    | cat    | 3.6    | jane  |
| fluffytail | rabbit | 2.1    | tom   |
| fido       | dog    | 23.2   | adam  |
| rover      | dog    | 44.6   | jane  |
| whiskers   | cat    | 4.5    | adam  |
| shergar    | horse  | 600    | tom   |
| squealer   | pig    | 300    | tom   |
| jaws       | shark  | 800    | jane  |

```sql
INSERT INTO pets (name, type, weight, owner) VALUES 
( 'tiddles', 'cat', 3.6, 2 ),
( 'fluffytail', 'rabbit', 2.1, 1 ),
( 'fido', 'dog', 23.2, 3 ),
( 'rover', 'dog', 44.6, 2 ),
( 'whiskers', 'cat', 4.5, 3 ),
( 'shergar', 'horse', 600, 1 ),
( 'squealer', 'pig', 300, 1 ),
( 'jaws', 'shark', 800, 2 );
```

11. What is the command to view the table and its data? Check you've inserted all the data correctly
```sql
TABLE pets;
```
12. Retrieve all the pets data
```sql
SELECT * FROM pets;
```
13. Retrieve the pets data but only name and weight
```sql
SELECT name, weight FROM pets;
```
14. Retrieve all the pets that weigh less than 20kg
```sql
SELECT * FROM pets WHERE weight < 20;
```
15. Retrieve all the pets that weigh more than 20kg and are not a dog
```sql
SELECT * FROM pets WHERE weight > 20 AND type != 'dog';
```
16. Count how many pets there are in total
```sql
SELECT count(*) FROM pets;
```
17. Show the count by type (e.g. 2 cats, 1 rabbit, etc)
```sql
SELECT type, count(type) FROM pets GROUP BY type;
```
18. Find the average weight of the dogs and cats
```sql
SELECT avg(weight) FROM pets WHERE type = 'cat' OR type = 'dog';
```
19. Find the heaviest pet
```sql
SELECT max(weight) FROM pets;
```
20. Find the lightest pet
```sql
SELECT min(weight) FROM pets;
```
21. Retrieve all the pets data in reverse name order
```sql
SELECT * FROM pets ORDER BY name DESC;
```
22. Increase tiddles's weight to 4kg
```sql
UPDATE pets SET weight = 4 WHERE name = 'tiddles'; # you could use id too
```
23. Remove the shark!
```sql
DELETE FROM pets WHERE type = 'shark'; # you could use id too
```
24. Get the first 2 animals over 20kg
```sql
SELECT * FROM pets WHERE weight > 20 LIMIT 2;
```
25. Get the next 2 animals over 20kg
```sql
SELECT * FROM pets WHERE weight > 20 LIMIT 2 OFFSET 2;
```

## Advanced (Optional. look [here](https://www.tutorialspoint.com/postgresql/index.htm))
26. Join the tables to (effectively) get the pets table above
```sql
SELECT * FROM pets AS T1 INNER JOIN owners AS T2 ON T1.owner = T2.id;
```
27. Create a table which lists ALL the owners and their respective pets
```sql
SELECT * FROM owners AS T1 LEFT JOIN pets AS T2 ON T1.id = T2.owner;
```
28. Retrieve all the owners who have a gmail email (hint: `in` clause)
```sql
SELECT * FROM owners WHERE email LIKE '%gmail%';
```
29. Retrieve all the distinct pet types (hint: look for a keyword)
```sql
SELECT DISTINCT type FROM pets;
```
** Next 3 are rock hard!! (Do your own research!!! - Joe Bro-gan) **

30. Create a table which lists the owner's name and the number of pets they own
```sql
SELECT T1.name, count(*) FROM owners AS T1 LEFT JOIN pets AS T2 ON T1.id = T2.owner GROUP BY T1.name;
```

31. Find the owner who has the biggest cat (hint: sub-query)
```sql
SELECT name FROM owners WHERE id = (SELECT id FROM pets WHERE type = 'cat' ORDER BY weight DESC LIMIT 1);

```
32.  Retrieve all the owners who have more than 2 pets (hint: `having` clause)
```sql
SELECT T1.name FROM owners AS T1 LEFT JOIN pets AS T2 ON T1.id = T2.owner GROUP BY T1.name HAVING count(T1.name) > 2;
```

## Dump/Seed (not optional!)
33. Create an SQL dump of your db (a .sql file)
```shell
pg_dump vets > ./vets.sql
```
34. Delete your db
```sql
DROP DATABASE vets;
```
35. Seed from the dump file to re-ceate your database (from outside the postgres shell)
```sql
psql vets < ./vets.sql
```

