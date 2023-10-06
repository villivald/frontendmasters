[Svelte Official Interactive Tutorial](https://learn.svelte.dev)

**_App.svelte_**

```html
<script>
  import NestedComponent from "./NestedComponent.svelte";
  import AnotherComponent from "./AnotherComponent.svelte";

  // Assignments and declarations
  let name = "world";
  let src = "https://picsum.photos/200";

  let string = `This is a string with <strong>HTML!!!</strong>`;

  let count = 0;
  $: doubled = count * 2; // reactive declaration

  function handleClick() {
    count += 1;
  }

  // Statements
  $: {
    console.log(`the count is ${count}`);

    if (count >= 10) {
      alert(`count is dangerously high!`);
      count = 9;
    }
  }

  // Arrays
  let numbers = [1, 2, 3];

  let things = [
    { name: "foo", id: 1 },
    { name: "bar", id: 2 },
    { name: "baz", id: 3 },
  ];

  function addNumber() {
    numbers = [...numbers, numbers.length + 1];
    //or
    //numbers.push(numbers.length + 1);
    //numbers = numbers;
  }

  $: sum = numbers.reduce((t, n) => t + n, 0);
</script>

<!-- styles are scoped to the component by default -->
<style>
  h1 {
    color: peru;
  }
</style>

<h1>Hello {name}!</h1>

<p>{@html string}</p>

<!-- components can be nested -->
<!-- props are passed as attributes -->
<NestedComponent someNumber="{42}" />

<!-- props can be also be passed with spread syntax -->
const props = { name: "world", age: 42, location: "London" };
<AnotherComponent {...props} />

<!-- svelte supports shorthands - like this: {src} === src={src} -->
<img {src} alt="random image" />

<button on:click="{handleClick}">
  Clicked {count} {count === 1 ? "time" : "times"}
</button>

<p>{count} doubled is {doubled}</p>

<!-- Logics -->
{#if count > 5}
<!-- # means start of block -->
<p>Count is greater than 5</p>
{:else if count < 5}
<p>Count is less than 5</p>
{:else}
<!-- : means continuation of block -->
<p>Count is 5</p>
{/if}
<!-- / means end of block -->

<!-- Loops -->
{#each numbers as number, i}
<!-- i is the index -->
<p>The number is {number} and the index is {i}</p>
{/each}

<!-- Keyed each blocks -->
{#each things as thing (thing.id)}
<!-- (thing.id) is the key -->
<p>The thing is {thing.name}</p>
{/each}
```

**_NestedComponent.svelte_**

```html
<script>
  // props are declared in the script tag using export
  // prop can also have a default value
  export let someNumber = 0;
</script>

<p>The number is {someNumber}</p>
```

**_AnotherComponent.svelte_**

```html
<script>
  export let name;
  export let age;
  export let location;
</script>

<p>{name} is {age} years old and lives in {location}</p>
```
