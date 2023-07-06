## Testing React app with Testing Library & Vitetest

npm i -D vitest @testing-library/react
npm i -D happy-dom
npm i -D vitest-fetch-mock (for mocking fetch requests)

install vitest VSCode extension - ZixuanChen.vitest-explorer

**_package.json_**

```json
"test": "vitest --run", // run test (npm t)
"test:watch": "vitest", // watch mode
"test:coverage": "vitest --coverage" // show test coverage
```

**_vite.config.js_**

```js
test: {
    environment: "happy-dom",
    setupFiles: ["./setupVitest.js"],
}
```

**_setupVitest.js_**

```js
import createFetchMock from "vitest-fetch-mock";
import { vi } from "vitest";

const fetchMock = createFetchMock(vi);
fetchMoch.enableMocks();
```

**\_/src/\_\_tests\_\_/Example.test.js\_**

```js
import { expect, test } from "vitest";
import { render } from "@testing-library/react";
import { StaticRouter } from "react-router-dom/server";

import Example from "../Example";
import Carousel from "../Carousel";

test("displays a default content", async () => {
  const example = render(
    {/* Needed for Link */}
    <StaticRouter>
      <Example />
    </StaticRouter>
  );

  const content = await example.findByTestId("exampleImage");
  expect(content.src).toContain("example.png");
  example.unmount();
});

test("test user click on image", async () => {
    const images = [
        "example1.png",
        "example2.png",
        "example3.png",
    ];

    const carousel = render(
        <StaticRouter>
            <Carousel images={images} />
        </StaticRouter>
    );

    const hero = await carousel.findByTestId("exampleImage");

    for(let i = 0; i < images.length; i++) {
        const image = images[i];

        const element = await carousel.findByTestId(`exampleImage-${i}`);
        await element.click();

        expect(hero.src).toContain(image);
        expect(Array.from(element.classList)).toContain("active");
    }
});

test("renders correct with no data", async () => {
  const {asFragment} = render(<Results data={[]} />);
  expect(asFragment()).toMatchSnapshot(); // Snapshot testing
});
```

**_Example.jsx_**

```jsx
import React from "react";
import { Link } from "react-router-dom";

export default function Example() {
  return (
    <>
      <Link>
        <img src="example.png" alt="example" data-testid="exampleImage" />
      </Link>
    </>
  );
}
```

**_Carousel.jsx_**

```jsx
import React, { useState } from "react";
import { Link } from "react-router-dom";

export default function Carousel({ images }) {
  const [active, setActive] = useState(0);

  return (
    <>
      {images.map((image, index) => (
        <Link key={index}>
          <img
            src={image}
            alt="example"
            data-testid={`exampleImage-${index}`}
            className={index === active ? "active" : ""}
            onClick={() => setActive(index)}
          />
        </Link>
      ))}
    </>
  );
}
```
