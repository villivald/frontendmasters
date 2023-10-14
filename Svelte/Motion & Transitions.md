## Motion

### Tweenes

```html
<script>
  import { tweened } from "svelte/motion";
  import { cubicOut } from "svelte/easing";

  const progress = tweened(0, {
    duration: 1000,
    easing: cubicOut,
  });
</script>

<progress value="{$progress}"></progress>
```

### Springes

```html
<script>
  import { spring } from "svelte/motion";

  let coords = spring(
    { x: 0, y: 0 },
    {
      stiffness: 0.1,
      damping: 0.4,
    }
  );
</script>

<div on:mousemove="{e => coords.set({ x: e.clientX, y: e.clientY })}">zzz</div>
```

### Transition

```html
<script>
  import { fade } from "svelte/transition";
  let visible = true;
</script>

<button on:click="{() => visible = !visible}">
  {#if visible} Hide {:else} Show {/if}
</button>

{#if visible}
<div transition:fade>Hello!</div>
{/if}
```
