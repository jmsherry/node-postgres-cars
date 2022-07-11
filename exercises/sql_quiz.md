# SQL QUIZ

## How to submit this HW

1. Rename this file to `<name>_sql_quiz.md`
2. Put the code you used to answer the question in the triple backticks under each question.
```sql
LIKE this
```
3. Hand your sql dump file in too


## Questions

1. Create a database called 'vets'
```sql

```
2. List the databases to see if it's there
```sql

```
3. Delete it
```sql

```
4. Check that it has gone
```sql

```
5. Re-create it
```sql

```
6. Connect to it and confirm that you are connected
```sql

```
7. Create a table called 'owners'. It will have an id for each owner; a name (required), and; an email
```sql

```
8. Create a table called 'pets'. It will have an id for each pet; a name (required); a type (cat, dog, etc.) a weight (in kg - use 'decimal') column. It will also have an 'owner' field which will have the id of their owner
```sql
  owner INTEGER,
  constraint fk_owner
     foreign key (owner) 
     REFERENCES pets (id)
```
9. Alter the pets table to make the type required
```sql

```
10. What is the command to inspect the table to see the constraints? Check they are correct.
```sql

```
11. Insert the following data
```sql

```

### Owners

| name | email          |
| ---- | -------------- |
| tom  | tom@yahoo.com  |
| jane | jane@gmail.com |
| adam | adam@yahoo.com |
| andy | andy@gmail.com |

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

11. What is the command to view the table and its data? Check you've inserted all the data correctly
```sql

```
12. Retrieve all the pets data
```sql

```
13. Retrieve the pets data but only name and weight
```sql

```
14. Retrieve all the pets that weigh less than 20kg
```sql

```
15. Retrieve all the pets that weigh more than 20kg and are not a dog
```sql

```
16. Count how many pets there are in total
```sql

```
17. Show the count by type (e.g. 2 cats, 1 rabbit, etc)
```sql

```
18. Find the average weight of the dogs and cats
```sql

```
19. Find the heaviest pet
```sql

```
20. Find the lightest pet
```sql

```
21. Retrieve all the pets data in reverse name order
```sql

```
22. Increase tiddles's weight to 4kg
```sql

```
23. Remove the shark!
```sql

```
24. Get the first 2 animals over 20kg
```sql

```
25. Get the next 2 animals over 20kg
```sql

```

## Advanced (Optional. look [here](https://www.tutorialspoint.com/postgresql/index.htm))
26. Join the tables to (effectively) get the pets table above
```sql

```
27. Create a table which lists ALL the owners and their respective pets
```sql

```
28. Retrieve all the owners who have a gmail email (hint: `in` clause)
```sql

```
29. Retrieve all the distinct pet types (hint: look for a keyword)
```sql

```

** Next 3 are hard!! (Do your own research!!! - Joe Bro-gan) **

30. Create a table which lists the owner's name and the number of pets they own
```sql

```
31. Find the owner who has the biggest cat (hint: sub-query)
```sql

```
32. Retrieve all the owners who have more than 2 pets (hint: `having` clause)
```sql

```

## Dump/Seed (not optional!)
33. Create an SQL dump of your db (a .sql file created from outside the postgres shell)
```shell

```
34. Delete your db
```sql

```
35. Seed from the dump file to re-ceate your database (from outside the postgres shell)
```shell

```

