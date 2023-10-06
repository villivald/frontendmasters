**_App.svelte_**

```html
<script>
 function doSomethingOnHover() {
  console.log('hovered')
 }

 let position = { x: 0, y: 0 }
</script>

<!-- Event handlers -->
<div on:mouseover={doSomethingOnHover}>
  Hover me
</div>

<div on:pointermove={(e) => {
  position = { x: e.clientX, y: e.clientY };
}}>
  <p>Mouse position: {position.x}, {position.y}</p>
</div>

<button on:click={() => console.log('clicked')}>
  Click me
</button>

  <!-- Event modifiers -->
<button on:click|preventDefault={() => console.log('clicked')}>
  Click me
</button>

<button on:click|once={() => console.log('clicked')}>
  Click me
</button>
```
