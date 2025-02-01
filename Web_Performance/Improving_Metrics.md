### Improving Time to First Byte (TTFB)

- Compress HTTP Responses

  - reducing the size of html, js, css files that are sent to the client
  - uncompressed > gzip > brotli

- Efficient Ptotoocols

  - HTTP/1, HTTP/2 use TCP (slower), HTTP/3 uses UDP (faster)

- Host Capacity
  - Increase server capacity to handle more requests
  - Put host closer to the user (less network hops) - using CDN

### Improving First Contentful Paint (FCP)

- Removing sequence chains

  - situations where one resource is dependent on another etc.
  - bundling resources together solves the problem

- Preloading resources

  - `<link  rel="preload" href="https://xyz.com"/>` for critical resources (styles, scripts, fonts, images)
  - switch from google fonts to self-hosted fonts for example

- Lazy loading resources
  - JS blocks parsing
  - Prefer defer over async - since it doesn't block parsing in the most cases

### Improving Largest Contentful Paint (LCP)

- Optimizing and lazy loading images

  - lazy load all non-LCP and non-critical images with `loading="lazy"`
  - eager load critical images with `fetchpriority="high"` (`"priority"` in Next.js)
  - choose the right image format, avif, webp or at least something like tinypng processing
  - responsive images with `srcset` and `sizes` attributes

- Caching
  - server caching can be done with CDN
  - browser caching can be improved with cache-control and expires headers

### Improving Cumulative Layout Shift (CLS)

- setting initial sizes for elements with `width` and `height` attributes - browser calculates the aspect ratio and reserves the space

### Improving Interaction To Next Paint (INP)

- Minimize or delay the main thread work (e.g. setTimeout, setInterval, requestAnimationFrame, etc.)
- Optimize event handlers with a immediate response to the user, and defer the rest of the work
