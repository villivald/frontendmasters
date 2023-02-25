## Custom hook

```js
// useCustomHook.js
import { useState, useEffect } from "react";

export default function useCustomHook() {
  const [state, setState] = useState({});

  useEffect(() => {
    // do something
  }, []);

  return state;
}

// Component.js
import useCustomHook from "./useCustomHook";

export default function Component() {
  const state = useCustomHook();

  return <div>{state}</div>;
}
```
