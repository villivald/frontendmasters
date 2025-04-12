The method to ensure that the link has a meaningful alternative text for screen readers

```css
@layer utilities {
  .visually-hidden {
    clip: rect(0 0 0 0);
    clip-path: inset(50%);
    height: 1px;
    overflow: hidden;
    position: absolute;
    white-space: nowrap;
    width: 1px;
  }
}
```

```html
<a href="#" class="button">
  Learn more
  <span class="visually-hidden">
    about mushrooms with our helpful reference guide
  </span>
</a>
```
