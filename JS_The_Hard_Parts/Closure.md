Functions get a "new memory" every run/invocation, since local function state gets cleared after each run.

However, if a function is defined inside another function, the inner function can access the outer function's variables. This is called a **closure**.

```js
function outer() {
  let counter = 0;
  function increment() {
    console.log((counter += 1));
  }
  return increment;
}

const myFunc = outer();
myFunc(); // 1
myFunc(); // 2

const anotherFunc = outer(); // has its own execution context and own counter
anotherFunc(); // 1
anotherFunc(); // 2
```

Persistant lexical static reference data (backpack) - **closure**
