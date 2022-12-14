# Static import

'Normal' way of importing modules.

```js
import module1 from "./module1";
import module2 from "./module2";

module1();
module2();
```

Good: Statically imported components are instantly available to the user. Can be statically analyzed and tree-shaken.

Bad: Importing even unnecessary modules, which increases the bundle size.

---

# Dynamic import

Importing code 'on demand'.

In React this can be done by using `React.Suspense` with `React.lazy`.

```js
import React, { Suspense, lazy } from "react";

const DynamicComponent = lazy(() => import("./DynamicComponent"));

const App = () => {
  return (
    <Suspense fallback={<div>Loading...</div>}>
      <DynamicComponent />
    </Suspense>
  );
};
```

Good: faster initial load, reduced bundle size.

Bad: layout shift, longer load time.

---

# Import on visibility

Load components when they are visible in the viewport.
Can be used in React with `react-intersection-observer`.

```js
import { Suspense, lazy } from "react";
import { useInView } from "react-intersection-observer";
const Listing = lazy(() => import("./components/Listing"));

function ListingCard(props) {
  const { ref, inView } = useInView();

  return (
    <div ref={ref}>
      <Suspense fallback={<div />}>{inView && <Listing />}</Suspense>
    </div>
  );
}
```

The same pros and cons as with dynamic import.

---

# Route-based code splitting

Dynamically load components based on the current route.
Example of using this kind of code splitting with React Router:

```js
import React, { lazy, Suspense } from "react";
import { Switch, Route, BrowserRouter as Router } from "react-router-dom";

const App = lazy(() => import("./App"));
const About = lazy(() => import("./About"));
const Contact = lazy(() => import("./Contact"));

ReactDOM.render(
  <Router>
    <Suspense fallback={<div>Loading...</div>}>
      <Switch>
        <Route exact path="/">
          <App />
        </Route>
        <Route path="/about">
          <About />
        </Route>
        <Route path="/contact">
          <Contact />
        </Route>
      </Switch>
    </Suspense>
  </Router>,
  document.getElementById("root")
);
```
