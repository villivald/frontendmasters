## Context API

**_context.tsx_**

```tsx
import { createContext, Dispatch, PropsWithChildren } from "react";

type ColorContextState = {
  hexColor: string;
  dispatch: Dispatch<ColorActions>;
};

export const ColorContext = createContext<ColorContextState>({
  hexColor: "#FFADEF",
} as ColorContextState);

const initialState = {
  hexColor: "#FFADEF",
};

const colorReducer = (state: typeof initialState, action: ColorActions) => {
  switch (action.type) {
    case "update-hex-color":
      return { ...state, hexColor: action.payload };
    default:
      return state;
  }
};

export const ColorProvider = ({ children }: PropsWithChildren) => {
  const [state, dispatch] = useReducer(colorReducer, initialState);
  const hexColor = state.hexColor;

  return (
    <ColorContext.Provider value={{ hexColor, dispatch }}>
      {children}
    </ColorContext.Provider>
  );
};
```

**_App.tsx_**

```tsx
import { useContext } from "react";
import { ColorContext } from "./context";

const App = () => {
  const { hexColor, dispatch } = useContext(ColorContext);

  const handleChangeColor = (color: string) => {
    dispatch({ type: "update-hex-color", payload: color });
  };

  return (
    <div>
      <h1>{hexColor}</h1>
      <button onClick={handleChangeColor("#FFADEF")}>Pink</button>
      <button onClick={handleChangeColor("#FF0000")}>Red</button>
    </div>
  );
};
```

**_index.tsx_**

```tsx
import { ColorProvider } from "./context";

ReactDOM.render(
  <ColorProvider>
    <App />
  </ColorProvider>,
  document.getElementById("root")
);
```
