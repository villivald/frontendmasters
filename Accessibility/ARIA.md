ARIA - Accessible Rich Internet Applications (specification & standard)

[ARIA on MDN](https://developer.mozilla.org/en-US/docs/Web/Accessibility/ARIA)

[Check ARIA-attributes support](https://a11ysupport.io)

## Roles, States & Properties

```jsx
/* Roles */
<button></button> // implicit
<div role="button"></div> // explicit

/* States */
<div aria-disabled="true"></div>

/* Properties */
<div role="checkbox" aria-label="Subscribe"></div>
```

Chrome Accessibility Inspector in DevTools can be used to inspect which ARIA attributes are being used on a page and which one "win" (i.e. are actually used by the browser).

## Live regions

ARIA live region can be created by using role attributes `role="status"`, `role="log"`, `role="alert"`, or by using property attributes `aria-live="polite"`, `aria-live="assertive"`.

The main purpose of live regions is to announce changes to the user without requiring focus on the region.
