## Authentication vs Authorization

- Authentication: Who are you? - User
- Authorization: What are you allowed to do? - Permissions

## Main concepts

- Credentials: Username and Password
- Single Sign On (SSO): Login once, access multiple applications
- 2FA (Two Factor Authentication): Password + OTP (One Time Password)
- MFA (Multi Factor Authentication): Password + OTP + Fingerprint (or any other factor, e.g. Face ID)
- OAuth 2.0: Authorization flow for 3rd party applications
- JWT (JSON Web Token): Authorization token (metadata)
- Public Key Cryptography: Asymmetric encryption (public key + private key)

## Security risks

- Main in the middle attack: Attacker intercepts communication between two parties
- Keylogger: Attacker records keystrokes
- Easy to guess passwords: Attacker guesses password
- Web servers and DBs attacks: Attacker exploits vulnerabilities in web servers and DBs
- Phishing and Social Engineering: Attacker tricks user into revealing sensitive information

https://haveibeenpwned.com/

## Strategies - from least secure to most secure

- Form-based authentication
- Multi-factor authentication
- WebAuthn
- Passwordless authentication
