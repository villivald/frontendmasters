## Federated login

### Providers

- Sign in with Google
- Sign in with Apple (requires apple developer account)
- or any other OAuth2 provider (e.g. Facebook, Twitter, Github, etc.)

### Steps (Google)

- [Sign In With Google](https://developers.google.com/identity/gsi/web/guides/overview)
- Create new project for using Google API (Google Cloud Platform)
- Register app in OAuth consent screen (Google Cloud Platform)
- Create credentials for OAuth client ID (Google Cloud Platform)
- Get client id and client secret (Google Cloud Platform)
- Load client library - <script src="https://accounts.google.com/gsi/client" async></script>
- Use [Code generator](https://developers.google.com/identity/gsi/web/tools/configurator) to create sign in button
  - callback function - `loginFromGoogle (data) => { ... }`
- Embed sign in button in your page
- Response from Google is a JWT token and should be decoded for using in app (e.g. with [jwt-decode](https://www.npmjs.com/package/jwt-decode)
  - `jwt.payload.email ...`
