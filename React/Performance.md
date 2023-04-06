## Code splitting

```jsx
import { useState, lazy, Suspense } from "react";

const OtherComponent = lazy(() => import("./OtherComponent"));
const AnotherComponent = lazy(() => import("./AnotherComponent"));

function MyComponent() {
  const [showOtherComponent, setShowOtherComponent] = useState(false);
  const [showAnotherComponent, setShowAnotherComponent] = useState(false);

  return (
    <div>
      <Suspense fallback={<div>Loading...</div>}>
        {showOtherComponent && <OtherComponent />}
        {showAnotherComponent && <AnotherComponent />}
      </Suspense>
      <button onClick={() => setShowOtherComponent(true)}>
        Show other component
      </button>
      <button onClick={() => setShowAnotherComponent(true)}>
        Show another component
      </button>

      {/* or */}
      <Suspense fallback={<div>Loading...</div>}>
        <Switch>
          <Route path="/other" component={OtherComponent} />
          <Route path="/another" component={AnotherComponent} />
        </Switch>
      </Suspense>
    </div>
  );
}
```

## Server Side Rendering

**_ClientApp.js_**

```jsx
import { hydrateRoot } from "react-dom/client";
import { BrowserRouter } from "react-router-dom";
import App from "./App";

hydrateRoot(
  document.getElementById("root"),
  <BrowserRouter>
    <App />
  </BrowserRouter>
);
```

**_ServerApp.js_**

```jsx
import { renderToPipeableStrwM } from "react-dom/server";
import { StaticRouter } from "react-router-dom/server";
import App from "./App";

export default function render(url, options) {
  const stream = renderToPipeableStream(
    <StaticRouter location={url}>
      <App />
    </StaticRouter>,
    options
  );

  return stream;
}
```

**_index.html_**

```html
<body>
  <div id="root"><!--SPLIT-POINT--></div>
  <script src="./ClientApp.js"></script>
</body>
```

**_App.js_**

```jsx
// remove
const container = document.getElementById("root");
const root createRoot(container);
root.render(<App />);

// add
export default App;
```

**_package.json_**

```json
{
  "type": "module",
  "scripts": {
    "build:client": "vite build --outDir ../dist/client",
    "build:server": "vite build --outDir ../dist/server --ssr ServerApp.jsx",
    "build": "npm run build:client && npm run build:server",
    "start": "node server.js"
  }
}
```

**_server.js_**

```js
import express from "express";
import fs from "fs";
import path from "path";
import { fileURLToPath } from "url";
import { renderApp } from "./dist/server/ServerApp.js";

const __dirname = path.dirname(fileURLToPath(import.meta.url));

const PORT = process.env.PORT || 3000;

const html = fs
  .readFileSync(path.resolve(__dirname, "./dist/client/index.html"))
  .toString();

const parts = html.split("<!--SPLIT-POINT-->");

const app = express();
app.use(
  "/assets",
  express.static(path.resolve(__dirname, "./dist/client/assets"))
);

app.use((req, res) => {
  res.write(parts[0]);

  const stream = renderApp(req.url, {
    onSheetReady() {
      stream.pipe(res);
    },
    onShellError() {
      // handle error
    },
    onAllReady() {
      res.write(parts[1]);
      res.end();
    },
    onError(err) {
      console.error(err);
    },
  });
});

console.log(`Listening on port ${PORT}`);
app.listen(PORT);
```

## Server Side Fetching

[More on react-query](./ReactQuery.md)

```jsx
import {
  QueryClient,
  QueryClientProvider,
  useQuery,
} from "@tanstack/react-query";
import fetchPerson from "./fetchPerson";

const queryClient = new QueryClient({
  defaultOptions: {
    queries: {
      staleTime: Infinity,
      cacheTime: Infinity,
      suspense: true, // enable suspense mode
    },
  },
});

function App() {
  const result = useQuery(["person", id], fetchPerson);

  if (result.isLoading) {
    return <h1>Loading...</h1>;
  }

  const person = result.data;

  return (
    <QueryClientProvider client={queryClient}>
      <p>{person.name}</p>
      <p>{person.email}</p>
    </QueryClientProvider>
  );
}
```
