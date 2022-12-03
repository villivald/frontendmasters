# Module pattern

*math.js*
```js
const secret = 'secret';

export const add(a, b) {
  return a + b;
}
```
The add function is exported and can be used in other files.
The ***secret*** variable is accessible within the module, but not outside of it

*app.js*
```js
import { add } from './math.js';

console.log(add(1, 2)); //-> OK
console.log(secret); //-> Error
```
Module can be added to the HTML as follows:

```html
<script type="module" src="app.js"></script>
```

In Node.js, the module can be used as follows:

*index.js*
```js
const { add } = require('./math.js');
```

*package.json*
```json
{
  "type": "module"
}
```