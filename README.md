# Node App w/ Postgres

This app demos a node server with API

## shell-utilites

There are 2 scripts:

1. whatsonport - tells you what process is on a particular port. Usage: `whatsonport 3000`

2. stop - stops program bound to a port. Usage: `stop 5000`

## Exercises

There's a 35 question exercise and answers in the `exercises` folder.


## Elephant Remote DB

You can sign up here: <https://www.elephantsql.com/>

Schema has to change as sequences don't seem to work:

```sql
CREATE TABLE public.cars (
    id INT GENERATED ALWAYS AS IDENTITY,
    name character varying(30),
    bhp INT,
    avatar_url character varying(100) DEFAULT 'https://static.thenounproject.com/png/449586-200.png'::character varying
);
```
