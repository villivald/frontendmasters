## Skip links

```jsx
<a href="#main-content">Skip to main content</a>
< href="#contact">Skip to contact links</a>

<main id="main-content" tabIndex="-1">
  <!-- Main content -->
</main>

<footer id="contact">
  <!-- Contact links -->
</footer>

// [tabIndex="-1"]:focus {outline: 0;}
```

## Active element

Technique to log the currently focused element.

```jsx
document.body.addEventListener("focusin", () =>
  console.log(document.activeElement)
);
```
