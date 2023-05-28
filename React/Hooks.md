## useRef

useRef is used to create a reference to a DOM element

```js
import { useRef } from "react";

const App = () => {
  const renderTarget = useRef();
  renderTarget.current.appendChild(document.createElement("div"));

  return <div ref={renderTarget} />;
};
```

## memo

memo is used to memoize a component. It will only re-render if the props change.

```js
import { memo } from "react";

const App = memo(({ name }) => {
  return <div>{name}</div>;
});
```

## useReducer

useReducer is used to manage state in a component. It is similar to useState, but it allows you to manage more complex state.

```js
import { useReducer } from "react";

const App = () => {
  const [state, dispatch] = useReducer(reducer, initialState);

  const reducer = (state, action) => {
    switch (action.type) {
      case "increment":
        return state + 1;
      case "decrement":
        return state - 1;
      default:
        return state;
    }
  };

  const handleIncrement = () => {
    dispatch({ type: "increment" });
  };

  const handleDecrement = () => {
    dispatch({ type: "decrement" });
  };

  return <div>{state}</div>;
};
```

```js
// Initial state of the form fields
const initialState = {
  publisherName: "",
  publicationName: "",
  publicationSubTitle: "",
  authorName: "",
  contactEmail: "",
};

// State handler for the form fields
const [form, updateForm] = useReducer((prev, next) => {
  return { ...prev, ...next };
}, initialState);

<input
  type="text"
  value={form.publisherName}
  onChange={(event) => updateForm({ publisherName: event.target.value })}
/>;
```

## useMemo

useMemo is used to memoize a value. It will only recompute the value if the dependencies change.

```js
import { useMemo } from "react";

const App = ({ dependency }) => {
  const value = useMemo(() => expensiveComputation(), [dependency]);

  return <div>{value}</div>;
};
```

## useCallback

useCallback is used to memoize a function. It will only recompute the function if the dependencies change.

```js
import { useCallback } from "react";

const App = ({ dependency }) => {
  const callback = useCallback(aUsefulFunction, [dependency]);
  // the same as
  const callback = useMemo(() => aUsefulFunction, [dependency]);

  return <div>{callback()}</div>;
};
```

## useLayoutEffect

useLayoutEffect is used to run a side effect after the DOM has been updated. It is similar to useEffect, but it runs synchronously immediately after the DOM has been updated.

```js
import { useLayoutEffect } from "react";

const App = () => {
  useLayoutEffect(() => {
    // do something
  }, []);

  return <div />;
};
```

## useId

useId is used to generate a unique id for a component. It is useful for creating unique ids for labels and inputs.

```js
import { useId } from "react";

const InputWithLabel = ({ label, ...props }) => {
  const id = useId();

  return (
    <>
      <label htmlFor={id}>{label}</label>
      <input id={id} {...props} />
    </>
  );
};

const App = () => {
  return (
    <>
      <InputWithLabel label="Name" />
      <InputWithLabel label="Address" />
      <InputWithLabel label="Phone" />
    </>
  );
};
```

## useTransition

```js
import { useTransition } from "react";

const App = () => {
  const [isPending, startTransition] = useTransition();

  return (
    <>
      <form
        onSubmit={(event) => {
          event.preventDefault();
          const object = {
            publisherName: form.publisherName,
            publicationName: form.publicationName,
            publicationSubTitle: form.publicationSubTitle,
          };

          startTransition(() => {
            setRequestParams(object);
          });
        }}
        </form>

        {
          isPending ? (
            <div>Loading...</div>
          ) : (
            <button type="submit">Submit</button>
          )
        }
    </form>
  );
};
```
