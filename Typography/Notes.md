## Responsive Web Typography

### Anatomy of Letterforms

![Anatomy of Letterforms](/images/anatomy.png)

### Type Styles & Classifications

![Type Styles & Classifications](/images/type_styles.png)

## Tips & Tricks

Using max-width to keep text readable (65-75 characters per line)

```css
@media (min-width: 58rem) {
  .p {
    max-width: 38rem; /* 38rem = 65-75 characters */
}
```

## Variable fonts

Single font file that can be used to display different weights, widths, heights, and styles of a typeface.

```css
font-variation-settings: "wght" 400, "wdth" 100, "ital" 0, "opsz" 12, "slnt" 0, "GRAD"
    88, "YOPQ" 10, "XOPQ" 20, "AXIS" 30, "ROT" 40, "TRAK" 50, "CRSV" 60,
  "CRSE" 70;
```

![Variable font anatomy](/images/variable.png)

Collections of variable fonts:

- [Variable Fonts](https://v-fonts.com/)
- [Axis Praxis](https://www.axis-praxis.org/)
- [GitHub's Variable fonts](https://github.com/mona-sans)

Info on variable fonts:

- [A Variable Fonts Primer](https://variablefonts.io/)
- [Typenetwork](https://www.typenetwork.com/brochure/opentype-font-variations/#introduction)
- [Monotype](https://www.monotype.com/resources/expertise/variable-fonts-101)

## Importing fonts

For fonts hosted on own server:

```css
@font-face {
  font-family: "MyWebFont";
  font-style: normal;
  font-weight: normal;
  src: url("myfont.woff2") format("woff2"), url("myfont.woff") format("woff");
  font-display: swap;
}

body {
  font-family: "MyWebFont", Fallback, sans-serif;
}
```

For fonts hosted on Google Fonts (or other CDN):

```css
@import url(//fonts.googleapis.com/css?family=Open+Sans); /* imports whole font family */

body {
  font-family: "Open Sans", Fallback, sans-serif;
}
```

## Breakpoints

Example of setting breakpoints for font sizes:
![Breakpoints](/images/breakpoints.png)
![Media queries](/images/media_queries.png)
