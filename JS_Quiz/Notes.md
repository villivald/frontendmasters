## Event Loop

The order of execution:

```js
/* 1. */ console.log("1"); // runs synchronously
/* 2. */ new Promise(() => console.log("2")); // runs synchronously
/* 3. */ (async () => console.log("3"))(); // runs synchronously - immediately invoked
/* 4. */ Promise.resolve().then(() => console.log("4")); // first from the microtask queue
/* 5. */ queueMicrotask(() => console.log("5")); // second from the microtask queue
/* 6. */ setTimeout(() => console.log("6"), 0); // last from the macrotask queue
```

## Scope & Closures

- Function envocation creates a new lexical environment.
- Variable persists in memory until the closure is destroyed.
- Hoisting in JS is the process of moving function and variable declarations to the top of the scope. Variables declared with `let` and `const` are hoisted but not initialized.

## this

- Global context - window object in the browser, global object in Node.js.
- Regular function - object on which the function is invoked.
- Array function - lexical environment in which the function is defined.
- Classes - value of the newly created instance.
- Strict mode - `this` is `undefined` in the global context.
- Event handlers - element that received the event (e.g. button).

## Classes & Prototypes

## Generators & Iterators

## Garbage Collection

## Modules

## Numbers

## Misc
