```html
<a href="#main-content">Skip to content</a>

/* other content */

<main id="#main-content">...</main>
```

```css
.skip-to-main {
  background: var(--clr-green-500);
  font-size: var(--fs-600);
  padding: 1rem;
  position: absolute;
  top: 1rem;
  left: 1rem;
  border-radius: var(--border-radius-3);
  color: white;
}

.skip-to-main:not(:focus) {
  clip: rect(0 0 0 0);
  clip-path: inset(50%);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}
```
