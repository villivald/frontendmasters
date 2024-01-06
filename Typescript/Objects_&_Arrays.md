## Objects

```ts
const myCar = {
  make: "Toyota",
  model: "Yaris",
  year: 2005,
};

let car: {
  make: string;
  model: string;
  year: number;
  chargeVoltage?: number; // optional property
};

function printCarData(car: car) {
  console.log(car.make, car.model, car.year);
}

printCarData(myCar);
```

## Index Signatures

```ts
const phones: {
  // k can be anything of type string
  [k: string]: {
    country: string;
    area: string;
    number: string;
  };
} = {
  home: {
    country: "55",
    area: "11",
    number: "12345678",
  },
  work: {
    country: "55",
    area: "11",
    number: "87654321",
  },
};

phones.home.country; // OK
phones.work.someProperty = "someValue"; // OK
```

## Arrays and Tuples

```ts
const fileExtensions: string[] = ["ts", "js", "json"];

const cars: {
  make: string;
  model: string;
  year: number;
}[] = [
  {
    make: "Toyota",
    model: "Yaris",
    year: 2005,
  },
  {
    make: "Honda",
    model: "Civic",
    year: 2001,
  },
];

let car: [string, string, number] = ["Toyota", "Yaris", 2005];

// An immutable array
const immutableArray: readonly [string, string, number] = ["ts", "js", 2005];
immutableArray.push("json"); // Error
```
