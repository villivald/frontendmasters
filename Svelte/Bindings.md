Value binding

```html
<script>
  let a = 1;
</script>

<label>
  <input type="number" bind:value="{a}" min="0" max="10" />
  <input type="range" bind:value="{a}" min="0" max="10" />
</label>
```

Group binding

```html
<script>
  let scoops = 1;
  let flavours = [];
</script>

<label>
  <input type="number" bind:group="{scoops}" min="1" max="3" />
  {scoops === 1 ? 'scoop' : 'scoops'} of
  <select bind:group="{flavours}" multiple>
    <option value="Chocolate">Chocolate</option>
    <option value="Coconut">Coconut</option>
    <option value="Mint">Mint</option>
    <option value="Strawberry">Strawberry</option>
    <option value="Vanilla">Vanilla</option>
  </select>
</label>
```
