## Install

### React

npx storybook init

### Next.js

npx storybook@next init

## Run

npm run storybook

## Structure

**Config**

.storybook

├── main.js <br>
├── preview.js

**Stories**

- src
  - components
    - Button
      - Button.stories.mdx
      - Button.js

## Addons

### Docs

npm i @storybook/addon-docs

npm i @storybook/addon-backgrounds @storybook/addon-contexts

npm i @storybook/addon-knobs

npm i @storybook/addon-a11y

**main.js**

```diff
addons: [
  "@storybook/addon-links",
  "@storybook/addon-essentials",
  "@storybook/addon-interactions",
  "@storybook/preset-create-react-app",
+ "@storybook/addon-knobs",
+ "@storybook/addon-a11y/register",
+ "@storybook/addon-contexts/register",
+ "@storybook/addon-backgrounds/register",
+  {
+   name: "@storybook/addon-docs",
+   options: {
+     configureJSX: true,
+   },
+  },
];
```

**preview.js**

```diff
+ import { addDecorator } from "@storybook/react";
+ import { withKnobs } from "@storybook/addon-knobs";
+ import { withA11y } from "@storybook/addon-a11y";


+ addDecorator(withKnobs);
+ addDecorator(withA11y);
```

## Actions

npm i @storybook/addon-actions

**Button.stories.js**

```diff
+ import { action } from "@storybook/addon-actions";
+ import { withKnobs, boolean } from "@storybook/addon-knobs";

<Preview withToolbar>
  <Story name="primary">
    <PrimaryButton
+       onClick={action("button-click")}
+       disabled={boolean("Disabled", false)}
    >
        Hello world
    </PrimaryButton>
  </Story>
</Preview>
```

## Customization

**manager.js**

```js
import { addons } from "@storybook/addons";
import { themes } from "@storybook/theming";

addons.setConfig({
  theme: themes.dark,
});
```

## Deploy

npm run build-storybook <br>
→ creates a storybook-static folder

Deploying on Netlify:

- build command: npm run build-storybook
- publish directory: storybook-static
- 👍
