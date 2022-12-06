# Render Props pattern

Thi pattern allows us to pass JSX elements to components through props

_Input.js_

```js
function Input(props) {
  const [value, setValue] = useState("");

  return (
    <>
      <input value={value} onChange={(e) => setValue(e.target.value)} />
      {/* Using props to render the value */}
      {props.renderKelvin({ value: value + 273.15 })}
      {props.renderFahrenheit({ value: (value * 9) / 5 + 32 })}
    </>
  );
}
```

_App.js_

```js
function App() {
  return (
    <Input
      // Tells how exactly to render the value
      renderKelvin={({ value }) => <div className="temp">{value}K</div>}
      renderFahrenheit={({ value }) => <div className="temp">{value}°F</div>}
    />
  );
}
```

---

_TemperatureConverter.js_

```js
export function Kelvin({ value }) {
  return (
    <div className="temp-card">
      The temperature in Kelvin is: <span className="temp">{value}K</span>
    </div>
  );
}

export function Fahrenheit({ value }) {
  return (
    <div className="temp-card">
      The temperature in Fahrenheit is:
      <span className="temp">{value}°F</span>
    </div>
  );
}

export default function TemperatureConverter({
  renderKelvin,
  renderFahrenheit,
}) {
  const [value, setValue] = useState(0);

  return (
    <div className="card">
      <input
        type="number"
        placeholder="Degrees Celcius"
        onChange={(e) => setValue(parseInt(e.target.value))}
      />
      {renderKelvin({ value: value + 273.15 })}
      {renderFahrenheit({ value: (value * 9) / 5 + 32 })}
    </div>
  );
}
```

_App.js_

```js
import TemperatureConverter, {
  Kelvin,
  Fahrenheit,
} from "./TemperatureConverter";

export default function App() {
  return (
    <TemperatureConverter
      renderKelvin={({ value }) => <Kelvin value={value} />}
      renderFahrenheit={({ value }) => <Fahrenheit value={value} />}
    />
  );
}
```
