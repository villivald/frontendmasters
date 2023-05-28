## Migrating from Javascript to Typescript

- npm i -D typescript
- npx tsc --init
- npm i -D @types/react @types/react-dom
- npm i -D eslint-import-resolver-typescript @typescript-eslint/eslint-plugin @typescript-eslint/parser
- .jsx -> .tsx
- tsconfig.json

```json
{
  "compilerOptions": {
    "target": "ES2022",
    "jsx": "react-jsx",
    "module": "ES2022",
    "moduleResolution": "node",
    "esModuleInterop": true,
    "forceConsistentCasingInFileNames": true,
    "strict": true,
    "skipLibCheck": true
  }
}
```

- eslintrc.json

```json
"extends": [
    "plugin:@typescript-eslint/recommended",
    "plugin:@typescript-eslint/recommended-requiring-type-checking",
],
"plugins": ["@typescript-eslint"],
"parser": "@typescript-eslint/parser",
"parserOptions": {
    "project": "./tsconfig.json"
},
"settings": {
    "import/parsers": {
        "@typescript-eslint/parser": [".ts", ".tsx"]
    },
    "import/resolver": {
        "typescript": {
            "alwaysTryTypes": true
        }
    }
}
```

[More about typing React components](https://github.com/villivald/frontendmasters/tree/main/React_With_TypeScript)
