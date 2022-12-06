# Proxy pattern

The proxy pattern helps to control interactions with an object:

```js
const person = {
  name: "John",
  age: 25,
  job: "Frontend",
};

const proxy = new Proxy(person, {
  get: (target, property) => {
    // Log every time a property is accessed
    console.log(`Getting prop ${property}. Value: ${target[property]}`);
    return target[property];
  },
  set: (target, property, value) => {
    // Log every time a property is changed
    console.log(
      `Setting prop ${property} from ${target[property]} to ${value}`
    );
    target[property] = value;
    return true;
  },
});
```

Built-in Reflect object can be used to simplify using of Proxy:

```js
new Proxy(person, {
  get: (target, property) => {
    return Reflect.get(target, property);
  },
  set: (target, property, value) => {
    return Reflect.set(target, property, value);
  },
});
```

Example of using Proxy pattern for validation purposes:

```js
import { isValidEmail, isAllLetters } from "./validator.js";

const user = {
  firstName: "John",
  lastName: "Doe",
  username: "johndoe",
  age: 42,
  email: "john@doe.com",
};

const proxy = new Proxy(user, {
  get: (target, property) => {
    // Log every time a property is accessed
    console.log(
      `${new Date()} | The value of ${property} is ${target[property]}.`
    );
    return Reflect.get(target, property);
  },
  set: (target, property, value) => {
    if (property === "username") {
      // Check if the username is valid
      if (!isAllLetters(value)) {
        throw new Error("You can only use letters in username!");
      }

      if (value.length < 3) {
        throw new Error("Min. length of a username is 3 characters.");
      }
    }

    if (property === "email") {
      // Check if the email is valid
      if (!isValidEmail(value)) {
        throw new Error("Email is not valid");
      }
    }

    if (property === "age") {
      // Check if the age is valid
      if (typeof value !== "number") {
        throw new Error("Pass a number for age!");
      }

      if (value < 18) {
        throw new Error("Min. age is 18");
      }
    }

    console.log("Succesfully updated");
    return Reflect.set(target, property, value);
  },
});

proxy.name;
// proxy.username = 123;
proxy.age = 11;
```
