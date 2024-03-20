### Headings

- `h1-h6`
- semantic headings in a meaningful order

### Landmarks

- semantic page structure
- `nav, main, section, header, footer, aside`, etc.
- `aria-label` and `aria-labelledby` can be used to give unique labels to landmarks

### Forms

- labels for inputs/textarea/select elements
- explicit labels use `for` and `id` attributes
- implicit labels wrap the input element in a `label` element
- `fieldset` and `legend` for grouping related inputs

### Buttons and Links

- buttons toggle things, links navigate

### Details and Summary

- kind of a built-in accordion component

### Modals

- `dialog` element should be used for modals

### Language

```html
<html lang="en">
  <body>
    <p lang="fr">Le Chat</p>
  </body>
</html>
```

### Hiding Content

- `inert` attribute can be used to [ignore](https://developer.mozilla.org/en-US/docs/Web/HTML/Global_attributes/inert) content in browser
- `hidden` attribute can be used to hide content completely
- `aria-hidden` attribute can be used to hide content from screen readers
