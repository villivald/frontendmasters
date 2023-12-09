### Factory pattern

```js
function userCreator(name, score) {
  const newUser = Object.create({});
  newUser.name = name;
  newUser.score = score;
  newUser.increment = function () {
    newUser.score++;
  };
  return newUser;
}

const user1 = userCreator("Phil", 4);
const user2 = userCreator("Julia", 5);
user1.increment(); // 4 -> 5
```

### Prototype chain

```js
function userCreator(name, score) {
  // Object has a prototype property that has a hasOwnProperty method
  const newUser = Object.create(userFunctionStore);
  newUser.name = name;
  newUser.score = score;
  return newUser;
}

const userFunctionStore = {
  increment: function () {
    this.score++;
  },
  login: function () {
    console.log("You're loggedin");
  },
};

// has hidden __proto__ property that points to userFunctionStore
const user1 = new userCreator("Phil", 4);
const user2 = new userCreator("Julia", 5);
user1.increment(); // 4 -> 5
```

### Class

```js
class User {
  constructor(name, score) {
    this.name = name;
    this.score = score;
  }
  increment() {
    this.score++;
  }
  login() {
    console.log("You're loggedin");
  }
}

const user1 = new User("Phil", 4);
const user2 = new User("Julia", 5);
user1.increment(); // 4 -> 5
```
