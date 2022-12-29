import { useState } from "react";
import { ThemeProvider } from "styled-components";

import {
  PrimaryButton,
  SecondaryButton,
  TertiaryButton,
} from "./components/Buttons";
import { darkTheme, defaultTheme } from "./utils";

import "./css/fonts.css";

function App() {
  const [useDarkTheme, setUseDarkTheme] = useState(false);

  return (
    <ThemeProvider theme={useDarkTheme ? darkTheme : defaultTheme}>
      <div>
        <button onClick={() => setUseDarkTheme(!useDarkTheme)}>
          Change theme
        </button>
        <div
          style={{
            background: useDarkTheme
              ? darkTheme.primaryDark
              : defaultTheme.white,
            display: "flex",
            flexDirection: "column",
            gap: "2rem",
            padding: "2rem",
          }}
        >
          <PrimaryButton /*disabled*/>Click me</PrimaryButton>
          <SecondaryButton>Click me</SecondaryButton>
          <TertiaryButton>Click me</TertiaryButton>
        </div>
      </div>
    </ThemeProvider>
  );
}

export default App;
