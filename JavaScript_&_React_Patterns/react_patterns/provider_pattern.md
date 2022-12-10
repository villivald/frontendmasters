# Provider pattern

Provider pattern is a way to share data between components without props drilling.
Provider pattern uses React's Context API for this purpose.

Example of using provider pattern for creating a simple theme switcher:

_context.js_

```js
export const ThemeContext = createContext(null);

export function useThemeContext() {
  const { theme, setTheme } = useContext(ThemeContext);

  return { theme, setTheme };
}

export function ThemeProvider({ children }) {
  const [theme, setTheme] = useState("light");

  return (
    <ThemeContext.Provider value={{ theme, setTheme }}>
      {children}
    </ThemeContext.Provider>
  );
}
```

_App.js_

```js
import { ThemeProvider } from "./context";

const LandingPage = () => {
  <ThemeProvider>
    <TopNav />
    <Main />
  </ThemeProvider>;
};
```

_TopNav.js_

```js
import { useThemeContext } from "./context";

const TopNav = () => {
  const { theme } = useThemeContext();

  return (
    <div style={{ backgroundColor: theme === "light" ? "#fff" : "#000 " }}>
      ...
    </div>
  );
};
```

_Toggle.js_

```js
import { useThemeContext } from "./context";

const Toggle = () => {
  const { theme, setTheme } = useThemeContext();

  return (
    <button
      onClick={() => setTheme(theme === "light" ? "dark" : "light")}
      style={{
        backgroundColor: theme === "light" ? "#fff" : "#000",
        color: theme === "light" ? "#000" : "#fff",
      }}
    >
      Use {theme === "light" ? "Dark" : "Light"} Theme
    </button>
  );
};
```
