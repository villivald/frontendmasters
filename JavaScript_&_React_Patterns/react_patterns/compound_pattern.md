# Compound pattern

Compound pattern is used to create multiple components to work together for a single purpose. In the example below, we have a `FlyOut` component that has `Input`, `List`, and `ListItem` components. `FlyOut` component is the main component that holds the state and provides it to the other components.

We can use this compound `FlyOut` component to create a search input with a list of suggestions:

_FlyOut.js_

```js
const FlyOutContext = React.createContext();

export function FlyOut(props) {
  const [open, setOpen] = React.useState(false);
  const [value, setValue] = React.useState("");
  const toggle = React.useCallback(() => setOpen((state) => !state), []);

  return (
    <FlyOutContext.Provider value={{ open, toggle, value, setValue }}>
      <div>{props.children}</div>
    </FlyOutContext.Provider>
  );
}

function Input(props) {
  const { value, toggle } = React.useContext(FlyOutContext);

  return <input onFocus={toggle} onBlur={toggle} value={value} {...props} />;
}

function List({ children }) {
  const { open } = React.useContext(FlyOutContext);

  return open && <ul>{children}</ul>;
}

function ListItem({ children, value }) {
  const { setValue } = React.useContext(FlyOutContext);

  return <li onMouseDown={() => setValue(value)}>{children}</li>;
}

FlyOut.Input = Input;
FlyOut.List = List;
FlyOut.ListItem = ListItem;
```

_SearchInput.js_

```js
import React from "react";
import { FlyOut } from "./FlyOut";

export default function SearchInput() {
  return (
    <FlyOut>
      <FlyOut.Input placeholder="Enter an address, city, or ZIP code" />
      <FlyOut.List>
        <FlyOut.ListItem value="San Francisco, CA">
          San Francisco, CA
        </FlyOut.ListItem>
        <FlyOut.ListItem value="Seattle, WA">Seattle, WA</FlyOut.ListItem>
        <FlyOut.ListItem value="Austin, TX">Austin, TX</FlyOut.ListItem>
        <FlyOut.ListItem value="Miami, FL">Miami, FL</FlyOut.ListItem>
        <FlyOut.ListItem value="Boulder, CO">Boulder, CO</FlyOut.ListItem>
      </FlyOut.List>
    </FlyOut>
  );
}
```
