## Function

```tsx
const addNumbers = (a: number, b: number): number => {
  return a + b;
};
```

## React Component

```tsx
const MyComponent = ({ name }: { name: string }): JSX.Element => {
  return <div>My name is {name}</div>;
};
```

_or_

```tsx
const MyComponent = (props: { name: string }): JSX.Element => {
  return <div>My name is {props.name}</div>;
};
```

## Custom type for props

```tsx
type ComponentProps = {
  name: string;
  onChange: React.ChangeEventHandler<HTMLInputElement>;
  something?: boolean; // optional
};

// type can be extended
type ComponentWithSpecialNeeds = ComponentProps & {
  special: boolean;
};

const MyComponent = ({ name, onChange }: ComponentProps) => {
  return <div>My name is {name}</div>;
};

const MyComponentWithSpecialNeeds = ({
  name,
  onChange,
  special,
}: ComponentWithSpecialNeeds) => {
  return (
    <div>
      My name is {name}
      {special && <div>Special</div>}
    </div>
  );
};
```

## The same with an interface

```tsx
interface ComponentProps {
  name: string;
  onChange: React.ChangeEventHandler<HTMLInputElement>;
}

// interface can be extended
interface ComponentWithSpecialNeeds extends ComponentProps {
  special: boolean;
}

const MyComponent = ({
  name,
  onChange,
  special,
}: ComponentWithSpecialNeeds) => {
  return (
    <div>
      My name is {name}
      {special && <div>Special</div>}
    </div>
  );
};
```

## Typing children

```tsx
import { PropsWithChildren } from "react";
type BoxProps = PropsWithChildren<{}>;

// or

const Box = ({ children }: { children: React.ReactNode }) => {
  return <div>{children}</div>;
};

const App = () => {
  return (
    <Box>
      <div>Child</div>
    </Box>
  );
};
```
