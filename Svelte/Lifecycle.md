onMount - used to run code when a component is mounted to the DOM

```html
<script>
  import { onMount } from "svelte";
  import { paint } from "./paint.js";

  onMount(() => {
    const canvas = document.getElementById("canvas");
    const ctx = canvas.getContext("2d");

    let frame = requestAnimationFrame(function loop(t) {
      frame = equestAnimationFrame(loop);
      paint(ctx, t);
    });

    return () => {
      cancelAnimationFrame(frame);
    };
  });
</script>
```

beforeUpdate, afterUpdate - used to run code before and after a component is updated

```html
<script>
  import { beforeUpdate, afterUpdate } from "svelte";

  let count = 0;

  beforeUpdate(() => {
    console.log("beforeUpdate", count);
  });

  afterUpdate(() => {
    console.log("afterUpdate", count);
  });

  function handleClick() {
    count += 1;
  }
</script>

<button on:click="{handleClick}">Click</button>

<p>{count}</p>
```

tick - returns a promise that resolves after the next DOM update

```html
<script>
  import { tick } from "svelte";

  let count = 0;

  async function handleClick() {
    count += 1;
    await tick();
    console.log("count is now", count);
  }
</script>

<button on:click="{handleClick}">Click</button>

<p>{count}</p>
```
