## Template literal types

```ts
type HexColor = `#${string}`;

const isHexColor = (color: string): color is HexColor => {
  return color.startsWith("#");
};

type RGBString = `rgb(${number}, ${number}, ${number})`;

type ColorFormats = "rgb" | "hex" | "hsl" | "hsv";
type ActionTypes = `update-${ColorFormats}-color`;
```
