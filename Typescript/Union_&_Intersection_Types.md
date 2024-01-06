## Union types (OR)

```ts
type OneThroughFive = 1 | 2 | 3 | 4 | 5;
type EvenNumbers = 2 | 4 | 6 | 8 | 10;

let exampleNumber: OneThroughFive = 1; // valid
exampleNumber = 6; // invalid

let exampleNumber2: OneThroughFive | EvenNumbers = 6; // valid
```

## Intersection types (AND)

```ts
type first = {
  sameProperty: string;
  someThing: boolean;
};

type second = {
  sameProperty: string;
  someThingElse: number;
};

// This type will have only the properties that are common to both types
type firstAndSecond = first & second;

let example: firstAndSecond = {
  sameProperty: "same",
};
```
