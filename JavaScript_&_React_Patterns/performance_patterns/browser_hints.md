# Browser Hints

`prefetch` - fetching and caching resources in the background

Can be used in React with Webpack's `prefetch` magic comment:

```js
const About = lazy(() => import(/* webpackPrefetch: true */ "./about"));
```

or in vanilla JS:

```js
<link rel="prefetch" href="./about.bundle.js" />
```

---

`preload` - fetching and caching resources in the background, but with higher priority than `prefetch`. It is more performance intensive in both the good and bad cases.

React:

```js
const About = lazy(() => import(/* webpackPreload: true */ "./about"));
```

Vanilla JS:

```js
<link rel="preload" href="./about.bundle.js" />
```
