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

h1,
.h1 {
  /* .h1 class can be used to style any element as h1 */
  font-size: var(--h1);
}

h2,
.h2 {
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

```html
<picture>
  <source srcset="https://some.pic/large.webp" media="(min-width: 1200px)" />
  <source srcset="https://some.pic/medium.webp" media="(min-width: 800px)" />
  <img src="https://some.pic/small.webp" alt="Description" />
</picture>
```

## Semantic markup

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
````

## Layers

```css
/* The latest is more specific */
@layer base, header;

@layer base {
  /* ... */
}

@layer header {
  /* ... */
}
```

# Margins vs Paddings

- Margins collapse, paddings don't 👨🏻‍🔬

# Table

```html
<table>
  <!-- Caption should be used in the table for accessibility reasons -->
  <caption>
    This is a descriptive caption that describes the table content and purpose
  </caption>
  <tr>
    <th>Month</th>
    <th>Savings</th>
  </tr>
  <tr>
    <td>January</td>
    <td>$100</td>
  </tr>
  <tr>
    <td>February</td>
    <td>$80</td>
  </tr>
</table>
```

```css
table {
  border-collapse: collapse; /* Remove redundant space between table cells */
}

caption {
  visibility: collapse; /* Hide the caption visually, but keep it for screen readers */
}

th {
  text-align: left;
  border-bottom: 1px solid #ddd;
}
```
