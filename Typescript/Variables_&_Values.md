```ts
let temperature = 30; // inferred type
temperature = "warm"; // Error: "warm" is not of type number

const humidity = 80; // literal type
humidity = 80; // OK
humidity = 90; // Error: 90 is not of type 80

let isRaining = false as boolean; // type casting - OK
let isSunny = false as Date; // Error: Date is not of type boolean
let isCloudy = false as any as Date; // OK, but not recommended

let date: Date = new Date(); // explicit type
```

## Function

```ts
function add(a: number, b: number): number {
  return a + b;
}

add(1, 2); // OK
add(1, "2"); // Error: "2" is not of type number
```
