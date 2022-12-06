# Singleton pattern

```js
let instance;

// 1. Creating the `Counter` class, which contains a `constructor`, `getInstance`, `getCount`, `increment` and `decrement` method.
class Counter {
  constructor() {
    // Within the constructor, we check to make sure the class hasn't already been instantiated.
    if (instance) {
      throw new Error("You can only create one instance!");
    }
    this.counter = counter;
    instance = this;
  }

  getCount() {
    return this.counter;
  }

  increment() {
    return ++this.counter;
  }

  decrement() {
    return --this.counter;
  }
}

// 2. Setting a variable equal to the the frozen newly instantiated object, by using the built-in `Object.freeze` method.
// This ensures that the newly created instance is not modifiable.
const singletonCounter = Object.freeze(new Counter());

// 3. Exporting the variable as the `default` value within the file to make it globally accessible.
export default singletonCounter;
```

Shorter version:

```js
let counter = 0;

export default Object.freeze({
  getCount: () => counter,
  increment: () => ++counter,
  decrement: () => --counter,
});
```

**+** using singletones could potentially save a lot of memory space.

**-** ES2015 Modules are singletons by default. There is no need to use the singleton pattern in such cases.

Example of using singleton pattern for database connection:

```js
let instance;

class DBConnection {
  constructor(uri) {
    if (instance) {
      throw new Error("You can only create one instance!");
    }
    this.uri = uri;
    instance = this;
  }

  connect() {
    console.log(`DB ${this.uri} has been connected!`);
  }

  disconnect() {
    console.log("DB disconnected");
  }
}

const connection = new Object.freeze(DBConnection("mongodb://..."));

export default connection;
```
