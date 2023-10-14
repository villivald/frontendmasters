## Class directive

```html
<script>
    let flipped = false;
</script>

Flip the card
<button
    class="card"
    class:flipped
    on:click={() => flipped = !flipped}
>
  <div class="front">front</div>
  <div class="back">back</div>
</button>
```

## Styles as "props"

**_Container.svelte_**

```html
<script>
  import Box from "./Box.svelte";
</script>

<div class="container">
  <Box --color="red" />
  <Box --color="blue" />
  <Box --color="green" />
</div>
```

**_Box.svelte_**

```html
<style>
  .box {
    width: 100px;
    height: 100px;
    background-color: var(--color, #ddd);
  }
</style>

<div class="box"></div>
```
