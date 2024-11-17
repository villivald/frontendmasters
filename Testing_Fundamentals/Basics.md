## Vitest

### Install & Run

```zsh
npm install -D vitest
```

```json
{
  "scripts": {
    "test": "vitest"
  }
}
```

```zsh
npm run test
```

[Guide](https://vitest.dev/guide/)

### Anatomy of a vitest test

```js
import { describe, test, expect } from "vitest";

// Single test
test("should pass", () => {
  expect(1).toBe(1);
});

// Group of tests
describe("nested", () => {
  test("should pass", () => {
    expect(1).toBe(1);
  });

  test("should fail", () => {
    expect(1).toBe(2);
  });
});

// Test for invalid input
const add = (a, b) => a + b;

describe("add", ()json => {
  test("should add two numbers", () => {
    expect(add(1, 2)).toBe(3);
  });

  test("should throw on invalid input", () => {
    expect(() => add(1, "2")).toThrow();
  });
});
```
