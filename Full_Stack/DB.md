## SQLite

npm i sqlite3

```js
process.on("SIGINT", () => {
  server.close(() => {
    shutdownDB();
  });
});

db.run("INSERT INTO visitors (count, time) VALUES (1, datetime('now'))");

const sqlite = require("sqlite3");
const db = new sqlite.Database(":memory:");

db.serialize(() => {
  db.run(`
    CREATE TABLE visitors (
      count INTEGER,
      time TEXT
    )
  `);
});

function getCounts() {
  db.each("SELECT * FROM visitors", (err, row) => {
    console.log(row);
  });
}

function shutdownDB() {
  getCounts();
  console.log("Shutting down DB");
  db.close();
}
```
