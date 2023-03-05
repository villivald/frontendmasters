## Context

```jsx
import { createContext } from "react";

const MyContext = createContext();

export default MyContext;
```

```jsx
import { useState } from "react";
import MyContext from "./MyContext";

const App = () => {
  const [thing, setThing] = useState(null);

  return (
    <MyContext.Provider value={{ thing, setThing }}>
      <Menu />
    </MyContext.Provider>
  );
};
```

```jsx
import { useContext } from "react";
import MyContext from "./MyContext";

const Menu = () => {
  const { thing, setThing } = useContext(MyContext);

  return (
    <div>
      <h1>Menu</h1>
      <p>Thing: {thing}</p>
      <button onClick={() => setThing("new thing")}>Set Thing</button>
    </div>
  );
};
```
