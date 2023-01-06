## Layout animation

### Flip animation technique

```html
<body>
  <div id="app" data-state="collapsed">
    <figure class="ui-figure" data-flip-bg>
      <figcaption class="ui-caption">Animation</figcaption>
    </figure>
    <div class="ui-content">
      <p>
        Lorem ipsum dolor sit amet consectetur adipisicing elit. Inventore ullam
        hic consectetur ducimus neque ipsam incidunt voluptatem voluptatum eos.
        Voluptatum minus omnis provident sit architecto, mollitia nihil
        aspernatur sed praesentium.
      </p>
    </div>
  </div>
</body>

<script>
  const figureEl = document.querySelector(".ui-figure");
  const captionEl = document.querySelector(".ui-caption");
  const appEl = document.querySelector("#app");

  appEl.addEventListener("click", () => {
    flip(() => {
      app.dataset.state =
        app.dataset.state === "collapsed" ? "expanded" : "collapsed";
    }, [figureEl, captionEl]);
  });

  function flip(fn, firstEls, lastEls = firstEls) {
    const firstRects = firstEls.map((el) => el.getBoundingClientRect());

    fn();

    requestAnimationFrame(() => {
      const lastRects = lastEls.map((el) => el.getBoundingClientRect());

      lastRects.forEach((lastRect, i) => {
        const firstRect = firstRects[i];
        const lastEl = lastEls[i];

        if (!firstRect) {
          return;
        }

        const dx = firstRect.x - lastRect.x;
        const dy = firstRect.y - lastRect.y;
        const dw = firstRect.width / lastRect.width;
        const dh = firstRect.height / lastRect.height;

        lastEl.style.setProperty("--dx", dx);
        lastEl.style.setProperty("--dy", dy);
        lastEl.style.setProperty("--dw", dw);
        lastEl.style.setProperty("--dh", dh);
        lastEl.dataset.flip = "invert";

        requestAnimationFrame(() => {
          lastEl.dataset.flip = "play";
        });
      });
    });
  }
</script>
```

```css
[data-flip] {
  &[data-flip-bg][data-flip="invert"]:before,
  &:not([data-flip-bg])[data-flip="invert"] {
    transform: translate(calc(var(--dx) * 1px), calc(var(--dy) * 1px)) scale(
        var(--dw),
        var(--dh)
      );
  }

  &[data-flip-bg][data-flip="play"]:before,
  &:not([data-flip-bg])[data-flip="play"] {
    transition: transform 0.3s;
    transform: none;
  }
}
```
