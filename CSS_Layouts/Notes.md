## Em vs Rem

- Rem - relative to the root font size, more consistent (1rem = 16px by default, unless it is changed explicitly)
- Em - relative to the parent font size

## Type size scale

https://typescale.com

```css
:root {
  --base-size: 1rem;
  --scale: 1.25; /* Major third */
  --h5: calc(var(--base-size) * var(--scale));
  --h4: calc(var(--h5) * var(--scale));
  --h3: calc(var(--h4) * var(--scale));
  --h2: calc(var(--h3) * var(--scale));
  --h1: calc(var(--h2) * var(--scale));
}

body {
  font-size: var(--base-size);
}

h1 {
  font-size: var(--h1);
}

h2 {
  font-size: var(--h2);
}

.text_small {
  font-size: calc(var(--base-size) / var(--scale));
}
```

## Responsive image

```css
img {
  width: 100%;
  max-width: 100%;
}
```

## Markup

```html
<div class="wrapper">
  <main>
    <h1>Heading</h1>
    <p>Paragraph</p>
  </main>
  <aside>
    <div class="imggroup">
      <img src="img/1.jpg" alt="Description" />
      <figure>
        <blockquote>
          Hello world
          <img src="img/2.jpg" alt="Description" />
          <img src="img/3.jpg" alt="" />
          <img src="img/4.jpg" alt="" />
        </blockquote>
        <figcaption>
          <cite>Author</cite>
        </figcaption>
      </figure>
    </div>
  </aside>
  <footer>
    <p>Footer</p>
    <address>New York, NY 10012</address>
  </footer>
</div>
```

## Layers

```css
@layer base {
  /* ... */
}

@layer header {
  /* ... */
}
```
