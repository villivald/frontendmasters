**_App.svelte_**

```html
<script>
  import { count, time } from "./stores.js";
  import Incrementer from "./Incrementer.svelte";
  import Decrementer from "./Decrementer.svelte";
  import Resetter from "./Resetter.svelte";
</script>

<!-- $count is a shorthand for {subscribe(count => ...)} -->
<h1>Count: {$count}</h1>

<Incrementer />
<Decrementer />
<Resetter />

<h1>The time is {$time.toLocaleTimeString()}.</h1>
```

**_Incrementer.svelte_**

```html
<script>
  import { count } from "./stores.js";

  function increment() {
    count.update((n) => n + 1);
  }
</script>

<button on:click="{increment}">+</button>
```

**_Decrementer.svelte_**

```html
<script>
  import { count } from "./stores.js";

  function decrement() {
    count.update((n) => n - 1);
  }
</script>

<button on:click="{decrement}">-</button>
```

**_Resetter.svelte_**

```html
<script>
  import { count } from "./stores.js";

  function reset() {
    count.set(0);
  }
</script>

<button on:click="{reset}">Reset</button>
```

**_stores.js_**

```js
import { writable, readable } from "svelte/store";

export const count = writable(0);

export const time = readable(new Date(), function start(set) {
  const interval = setInterval(() => {
    set(new Date());
  }, 1000);

  return function stop() {
    clearInterval(interval);
  };
});
```

**_customStores.js_**

```js
import { writable } from "svelte/store";

function createCount() {
  const { subscribe, set, update } = writable(0);

  return {
    subscribe,
    increment: () => update((n) => n + 1),
    decrement: () => update((n) => n - 1),
    reset: () => set(0),
  };
}

export const count = createCount();
```
