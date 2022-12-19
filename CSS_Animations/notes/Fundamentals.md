## Fundamentals

### Easing

- Iteration
- Delay
- Timing function
  - cubic-bezier(0.5, 0, 0.5, 1) - point1: x(0.5), y(0), point2: x(0.5), y(1)
  - can be visually tested in devtools

### CSS variables

```css
:root {
  --color: red;
  --duration: 10s;
  --easing: cubic-bezier(0.5, 0.1, 0.5, 1);
}
.thing {
  color: var(--color);
  animation: slide-right var(--duration) var(--easing) infinite;
}

@keyframes slide-right {
  0% {
    transform: translateX(0) scale(0.5) translateY(0);
  }
  100% {
    transform: translateX(30vw) scale(1.5) translateY(10vh);
  }
}
```

### What to animate

✅ - transform, opasity

👍 - color, background

❌ - height, width, left, right (layout)

[csstriggers.com](https://csstriggers.com/)
