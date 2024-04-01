## Mongo DB

Setup on macOS:

```zsh
brew tap mongodb/brew
brew install mongodb-community@7.0

# Start the service
brew services start mongodb-community@7.0

# Stop the service
brew services stop mongodb-community@7.0

# Check the status
brew services list

# Connect to the database
mongosh
```

## Querys

```zsh
# Show all databases
show dbs;

# Create a new database
use mydatabase;

# Show the current database
db;

# Show collections
show collections;

# Create a collection
db.createCollection("testCollection");

# Remove a collection
db.testCollection.drop();

# Insert a document
db.pets.insertOne({name: "Luna", type: "dog", breed: "Havanese", age: 8});

# Insert multiple documents
db.pets.insertMany(
  Array.from({ length: 10000 }).map((_, index) => ({
    name: [
      "Luna",
      "Fido",
      "Fluffy",
      "Carina",
      "Spot",
      "Beethoven",
      "Baxter",
      "Dug",
      "Zero",
      "Santa's Little Helper",
      "Snoopy",
    ][index % 9],
    type: ["dog", "cat", "bird", "reptile"][index % 4],
    age: (index % 18) + 1,
    breed: [
      "Havanese",
      "Bichon Frise",
      "Beagle",
      "Cockatoo",
      "African Gray",
      "Tabby",
      "Iguana",
    ][index % 7],
    index: index,
  }))
);

# Find all documents
db.pets.find();

# Find a document
db.pets.findOne({name: "Luna"});

# Count documents
db.pets.countDocuments();

# Count with a filter
db.pets.count({name: "Luna"});

# Find with a limit
db.pets.find({age: 8}).limit(40);

# Find and return as an array
db.pets.find({age: 8}).toArray();

# Query operators
db.pets.count({type: "cat", age: {$gt: 12}}); # Greater than
db.pets.count({type: "cat", age: {$gte: 12}}); # Greater than or equal
db.pets.count({type: "cat", age: {$lt: 12}}); # Less than
db.pets.count({type: "cat", age: {$lte: 12}}); # Less than or equal
db.pets.count({type: "cat", age: {$gt: 12, $lte: 16}}); # Between
db.pets.count({type: "cat", age: {$eq: 12}}); # Equal
db.pets.count({type: "cat", age: {$ne: 12}}); # Not equal

db.pets.count({type: "cat", $and: [{age: {$gt: 12}}, {age: {$lte: 16}}]}); # And
db.pets.count({type: "cat", $or: [{age: {$lt: 12}}, {age: {$gt: 16}}]}); # Or

db.pets.count({type: "cat", age: {$in: [12, 13, 14]}}); # In array
db.pets.count({type: "cat", age: {$nin: [12, 13, 14]}}); # Not in array
db.pets.count({type: "cat", age: {$exists: true}}); # Exists
db.pets.count({type: "cat", age: {$exists: false}}); # Not exists

db.pets.count({type: "cat", age: {$type: "number"}}); # Type
db.pets.count({type: "cat", age: {$mod: [5, 0]}}); # Mod (remainder)
db.pets.count({type: "cat", name: {$regex: /^Luna/}}); # Regular expression

db.pets.find({type: "dog"}).sort({age: 1, breed: -1}).limit(5); # Sort ascending (-1 descending)

# Projection
db.pets.find({ type: "dog"}, {name: 1}).limit(5); # Projection - show only name
db.pets.find({ type: "dog"}, {_id: 0}).limit(5); # Projection - show everything except _id
```
