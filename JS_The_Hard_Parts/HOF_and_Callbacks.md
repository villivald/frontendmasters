### High Order Functions

- Takes in a function or passes out a function

```javascript
function copyArrayAndManipulate(array, instructions) {
  const output = [];
  for (let i = 0; i < array.length; i++) {
    output.push(instructions(array[i]));
  }
  return output;
}
```

### Callback Functions

- A function that is passed into another function as an argument

```javascript
function multiplyBy2(input) {
  return input * 2;
}

const result = copyArrayAndManipulate([1, 2, 3], multiplyBy2);
```

### Declarative version of the code above

```javascript
const multiplyBy2 = (input) => input * 2;
const result = [1, 2, 3].map(multiplyBy2);

// or

const result = [1, 2, 3].map((input) => input * 2);
```
