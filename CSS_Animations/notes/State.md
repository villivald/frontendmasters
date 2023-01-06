## State

```css
.button {
  appearance: none;
  background: #fb2324;
  color: #fff;
  font-weight: bold;
  padding: 2rem 3rem;
  border: none;
  transition: all 0.3s;
}

.button:hover {
  background: #fff;
  color: #fb2324;
}

.button:active {
  transition-duration: 0.1s;
  transform: scale(0.9);
}
```

![button](images/button.gif)

### Data-state attribute:

```html
<div data-state="loading">Div</div>
```

```css
div[data-state="loading"] {
  opacity: 0.5;
  pointer-events: none;
}
```

### Using `data-state` attribute in React:

```jsx
const Button = ({ loading, children }) => (
  <button data-state={loading ? "loading" : ""}>{children}</button>
);

export default Button;
```

```css
button[data-state="loading"] {
  opacity: 0.5;
  pointer-events: none;
}
```

```jsx
import Button from "./Button";

const App = () => {
  const [loading, setLoading] = React.useState(false);

  const handleClick = () => {
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
    }, 2000);
  };

  return (
    <div>
      <Button loading={loading} onClick={handleClick}>
        Click me
      </Button>
    </div>
  );
};

export default App;
```
