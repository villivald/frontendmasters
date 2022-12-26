import {
  PrimaryButton,
  SecondaryButton,
  TertiaryButton,
} from "./components/Buttons";

import "./css/fonts.css";

function App() {
  return (
    <div
      style={{
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
  );
}

export default App;
