**_App.svelte_**

```html
<script>
  import Card from "./Card.svelte";
</script>

<Card>
  <span> xxx </span>

  {#if $$slots.header}
  <span slot="header">Header</span>
  {/if}

  <span slot="footer">Footer</span>

  <!-- Slot with props -->
  <span slot="body" let:item="{bodyText}"> {bodyText} </span>
</Card>
```

**_Card.svelte_**

```html
<script>
  let bodyText = "Body";
</script>

<div class="card">
  <!-- default slot -->
  <slot />

  <!-- Named slot -->
  <slot name="header" />
  <slot name="footer" />

  <!-- Slot with props -->
  <slot name="body" {bodyText} />
</div>
```
