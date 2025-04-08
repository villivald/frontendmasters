Modified version of Andy Bell's [A (more) Modern CSS Reset](https://piccalil.li/blog/a-more-modern-css-reset/)

```css
*,
*::before,
*::after {
  box-sizing: border-box;
}

/* https://kilianvalkhof.com/2022/css-html/your-css-reset-needs-text-size-adjust-probably/ */
html {
  -moz-text-size-adjust: none;
  -webkit-text-size-adjust: none;
  text-size-adjust: none;
}

body,
h1,
h2,
h3,
h4,
p,
figure,
blockquote,
dl,
dd {
  margin: 0;
}

/* https://www.scottohara.me/blog/2019/01/12/lists-and-safari.html */
[role="list"] {
  list-style: none;
  margin: 0;
  padding: 0;
}

body {
  min-block-size: 100vh;
  line-height: 1.6;
}

h1,
h2,
h3,
button,
input,
label {
  line-height: 1.1;
}

h1,
h2,
h3,
h4 {
  text-wrap: balance;
}

p,
li {
  text-wrap: pretty;
}

img,
picture {
  max-inline-size: 100%;
  display: block;
}

input,
button,
textarea,
select {
  font: inherit;
}
```
