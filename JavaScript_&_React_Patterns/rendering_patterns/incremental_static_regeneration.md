# Incremental Static Regeneration

Pre-render only the most important pages and render the rest on demand.

Implementation in Next.js:
![Incremental Static Regeneration](./images/isr1.png)

![Incremental Static Regeneration](./images/isr2.png)

Tradeoffs:

- Longer build times
- All static rendering benefits + FCP is faster for the most important pages
