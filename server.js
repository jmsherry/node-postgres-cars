require("dotenv").config();
const express = require("express"); // express server; this is a constructor
const cors = require("cors");
// const { v4: uuidv4 } = require('uuid');
const app = express(); // the constructor to create an app
const db = require("./db");

app.use(express.static("public")); //is it inside thisfolder and use; the order of app uses matter
app.use(express.json()); //all json is properly passed
app.use(cors());

app.get("/api/v1/cars/:id?", (req, res) => {
  const { id } = req.params;

  // If you want to change the order: /api/v1/cars
  const { searchField = "id", searchDirection = "ASC" } = req.query;

  console.log("id", id);
  const QUERY = "SELECT * FROM cars";
  let SORT = "";
  let CASE = "";
  if (id) {
    CASE = ` WHERE id = ${id}`;
  } else {
    SORT = ` ORDER BY ${searchField} ${searchDirection}`; // only sort if multiple
  }
  const fullQuery = `${QUERY}${CASE}${SORT}`;
  console.log("fullQuery", fullQuery);
  db.query(fullQuery, (error, results) => {
    // console.log("in");
    if (error) {
      // throw error;
      console.log("error", error);
      return res.status(500).send(error);
    }
    if (id && !results?.rows?.length) {
      return res.sendStatus(404);
    }
    // console.log("results", results);
    res.status(200).json(results.rows);
  });
});

app.post("/api/v1/cars", (req, res) => {
  console.log("Adding", req.body); // { name: 'bugatti', bhp: 123 }
  const fields = Object.keys(req.body); // again, doing this for the whole of req.body is a bad idea. re.body.data would be a better place to put it.
  const columns = fields.join(", ");
  const values = [];
  for (const field of fields) {
    const value = req.body[field];
    if (value) {
      values.push(value);
    }
  }

  const fullQuery = `INSERT INTO cars (${columns}) VALUES (${values
    .map((v, i) => `$${i + 1}`)
    .join(", ")}) RETURNING *`;
  console.log("fullQuery", fullQuery);
  console.log("values", values);

  db.query(fullQuery, values, (error, results) => {
    console.log("in");
    if (error) {
      console.log("err", error);
      return res.status(500).send(error);
    }
    console.log("done", results);
    if (!results?.rows?.length) {
      return res.sendStatus(404);
    }
    res.status(200).send(results);
  });
});

app.put("/api/v1/cars/:id", (req, res) => {
  console.log("Updating", req.params.id);
  const { id: carId } = req.params;

  const data = req.body;

  const keys = Object.keys(data);
  console.log("keys", keys);

  // 'UPDATE cars SET name = $1, email = $2 WHERE id = $3'

  let setStr = ""; // to do this bit: name = $1, email = $2

  for (const key in data) {
    if (data.hasOwnProperty(key)) {
      setStr += `${key} = ${
        typeof data[key] === "string" ? `'${data[key]}'` : data[key]
      }, `; // <-- like this
    }
  }
  console.log(setStr);
  const query = `UPDATE cars SET ${setStr.slice(
    0,
    setStr.length - 2 // get rid of last ', '
  )} WHERE id = ${carId} RETURNING *`;
  console.log("full query", query);

  db.query(query, (error, results) => {
    if (error) {
      throw error;
    }
    console.log("results", results);
    if (!results?.rows?.length) {
      return res.sendStatus(404);
    }
    res.status(200).send(results.rows[0]);
  });
});

app.delete("/api/v1/cars/:id", (req, res) => {
  console.log("Deleting", req.params.id);
  const { id: carId } = req.params;

  console.log("carToBeDeleted", carId);
  db.query(
    "DELETE FROM cars WHERE id = $1 RETURNING *",
    [carId],
    (error, results) => {
      if (error) {
        return res.status(500).send(error);
      }
      console.log("results", results);
      if (!results?.rows?.length) {
        return res.sendStatus(404);
      }
      res.status(200).send(results.rows[0]);
      // res.sendStatus(204)
    }
  );
});

app.get("/api/v1/cars/join/owner", (req, res) => {
  const QUERY = "SELECT * FROM cars AS T1";
  let JOIN = " INNER JOIN owners AS T2 ON T1.owner = T2.id"; // try changing 'LEFT' for 'RIGHT' or 'INNER' or 'FULL OUTER' "

  const fullQuery = `${QUERY}${JOIN}`;
  console.log("fullQuery", fullQuery);

  db.query(fullQuery, (error, results) => {
    if (error) {
      // throw error;
      console.log(error);
      return res.status(500).send(error);
    }
    res.status(200).json(results.rows);
  });
});

app.all("*", (req, res) => {
  res.sendStatus(404);
});

module.exports = app;

// CAR

// id  make             bhp          owner
// 1   ferrari          300            6*

// OWNERS

// id  firstname     lastname
// 6*    fred          bloggs

// CARS REPORT

// id  firstname     lastname    make             bhp          owner
// 6*    fred          bloggs     ferrari          300            6
