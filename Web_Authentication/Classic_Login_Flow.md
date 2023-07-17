## Content

- Registration
- Login
- Recover Password

## Enhancing

- Connected **labels** for elements
- No **placeholder** as label
- Using HTMl **semantic** elements
- Form name different for registration and login
- Let the user make the password **visible**
- Help password managers with **autocomplete** attributes
  ![autocomplete](/images/autocomplete.png)
- Use **aria-describedby** attribute for instructions
- Use **submit** form event not **click** event
  ![submit](/images/submit.png)

```js
import bcrypt from "bcryptjs";

const salt = bcrypt.genSaltSync(10);
const hashedPass = bcrypt.hashSync(req.body.password, salt);

const user = new User({
  username: req.body.username,
  password: hashedPass,
});
```
