# Eslint config

**_.elintrc.json_**

```json
{
  "extends": [
    "eslint:recommended",
    "plugin:import/errors",
    "plugin:react/recommended",
    "plugin:jsx-a11y/recommended",
    "plugin:prettier/recommended",
    "plugin:react-hooks/recommended",
    "prettier"
  ],
  "rules": {
    "react/prop-types": 0,
    "react/react-in-jsx-scope": 0
  },
  "plugins": ["react", "import", "jsx-a11y", "prettier", "react-hooks"],
  "parserOptions": {
    "ecmaVersion": 2022,
    "sourceType": "module",
    "ecmaFeatures": {
      "jsx": true
    }
  },
  "env": {
    "browser": true,
    "node": true,
    "es6": true
  },
  "settings": {
    "react": {
      "version": "detect"
    },
    "import/resolver": {
      "node": {
        "extensions": [".js", ".jsx", ".ts", ".tsx"]
      }
    }
  }
}
```

**_vite.config.js_**

```js
import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

export default defineConfig({
  plugins: [react()],
  root: "src",
});
```

```html
<script type="module" src"./App.js"></script>
```
