# Factory pattern

Factory pattern can be used to create multiple objects with the same properties:

```js
const createUser = (firstName, lastName) => ({
  id: uuid(),
  createdAt: new Date(),
  firstName,
  lastName,
  fullName: `${firstName} ${lastName}`,
});

createUser("John", "Doe");
createUser("Jane", "Doe");
```

```js
const books = [];

const createBook = (title, author, isbn) => ({
  title,
  author,
  isbn,
});

books.push(createBook('Harry Potter', 'JK Rowling', 'AB123'));

books.push(createBook('The Great Gatsby', 'F. Scott Fitzgerald', 'CD456'));

console.log(books); ->
// [
//   {
//     title: 'Harry Potter',
//     author: 'JK Rowling',
//     isbn: 'AB123'
//   },
//   {
//     title: 'The Great Gatsby',
//     author: 'F. Scott Fitzgerald',
//     isbn: 'CD456'
//   }
// ]
```
