## Generics

```ts
type LinkNode<T> = {
  value: T;
  next?: LinkNode<T>;
};

const TextNode: LinkNode<string> = {
  value: "Hello",
  next: {
    value: "World",
  },
};

const createLink = <T>(value: T): LinkNode<T> => {
  return {
    value,
  };
};

const stringNode = createLink("Hello");
const numberNode = createLink(123);
```

## Context with generics

```ts
// Custom createContext
export const createContext = <T extends {}>() => {
  const Context = createContext<T | undefined>(undefined);

  const useContext = () => {
    const ctx = React.useContext(Context);

    if (ctx === undefined) {
      throw new Error(`useContext must be inside a Provider with a value`);
    }

    return ctx;
  };

  return [useContext, Context.Provider] as const;
};

// Usage
type ContextState = {
  name: string;
  age: number;
};
export const [useContext, ContextProvider] = createContext<ContextState>();

// useContext
const context = useContext();
const { name, age } = context;
```
