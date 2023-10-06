**_App.svelte_**

```html
<script>
  import { getRandomNumber } from "./utils.js";

  let promise = getRandomNumber();

  function handleClick() {
    promise = getRandomNumber();
  }
</script>

<style>
  .error {
    color: red;
  }
</style>

<button on:click="{handleCLick}">Generate random number</button>

<!-- await blocks display different content while a promise is pending, resolved or rejected -->

{#await promise}
<!-- while promise is pending -->
<p>...waiting</p>
{:then number}
<!-- when promise resolves successfully -->
<p>The number is {number}</p>
{:catch error}
<!-- when promise is rejected -->
<p class="error">{error.message}</p>
{/await}

<!-- or as a shorthand  -->

{#await promise then number}
<p>The number is {number}</p>
{/await}
```

**_utils.js_**

```js
export function getRandomNumber() {
    const res = await fetch('/random-number');

    if (res.ok) {
        return res.text();
    } else {
        throw new Error(res.status);
    }
}
```
