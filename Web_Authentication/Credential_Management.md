## Credential management

Credential management API let us to save and retrieve credentials via browser's password manager:

- username and password
- federated credentials (token, metadata, etc.)
- public/private keys

```js
const credentials = new PasswordCredential({
  id: "admin",
  password: "admin",
});

await navigator.credentials.store(credentials);

const userPassword = await navigator.credentials.get({
  password: true,
});

// Post login - add credentials to password manager
if (window.PasswordCredential && user.password) {
  const credentials = new PasswordCredential({
    id: "admin",
    password: "admin",
    name: user.name,
  });

  navigator.credentials.store(credentials);
}

// Auto login - get credentials from password manager
if (window.PasswordCredential) {
  const credentials = await navigator.credentials.get({
    password: true,
  });

  if (credentials) {
    const { id, password } = credentials;
    // login with id and password
    // NB! password is now available in the credentials object as a plain text
  }
}
```
