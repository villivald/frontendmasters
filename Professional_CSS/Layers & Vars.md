### Layers

```css
/* from least to most specific */
@layer reset, variables, base;

@layer reset {
  [role="list"] {
    color: red;
  }
}

@layer variables {
  :root {
    /* Colors */
    --clr-blue-400: lightblue;
    --clr-blue-500: blue;
    --clr-blue-600: darkblue;

    /* Fonts */
    --ff-base: "Inter", sans-serif;
    --ff-accent: "Fira Code", monospace;

    /* Font sizes */
    --fs-300: 0.875rem;
    --fs-400: 1rem;
    --fs-500: 1.125rem;

    /* Text colors */
    --text-main: var(--clr-blue-500);
    --text-highlight: var(--clr-blue-400);

    /* Border radius */
    --br-1: 0.125rem;
    --br-2: 0.25rem;
    --br-3: 0.5rem;
  }
}

@layer base {
  ul {
    color: var(--clr-blue-500); /* This wins */
  }
}
```
