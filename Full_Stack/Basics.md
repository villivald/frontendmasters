## Vim

[Vim Wiki](https://vim.fandom.com/wiki/All_the_right_moves)
[Vim Cheatsheet](https://linuxmoz.com/vi-commands-cheat-sheet/)
[Vim Tutorial](https://www.openvim.com/)

## Server

```js
const http = require("http");
const fs = require("fs");
const PORT = 3000;

const server = http.createServer((req, res) => {
  res.writeHead(200, { "Content-Type": "text/html" });
  fs.createReadStream("index.html").pipe(res);
});

server.listen(PORT, () => {
  console.log(`Server listening on port ${PORT}`);
});
```

## Security & Hashing

MD5 - `openssl md5 <file>` - 128 bit hash (32 digits)
SHA1 - `openssl sha1 <file>` - 160 bit hash (40 digits)
SHA256 - `openssl sha256 <file>` - 256 bit hash (64 digits)

Salt - random piece of data added to the password before hashing

Input + Salt + Hashing Algorithm -> Secure hashed password

## SSH

Secure socket shell

Public key (public)
Private key (secret)

```zsh
cd ~/.ssh /* go to ssh directory where keys are stored
ssh-keygen // generate public/private key pair
cat newKey.pub // show public key
cat newKey // show private key

ssh -i newKey root@HOST_ADDRESS // connect to host with private key
```

## Network

```zsh
ping google.com
traceroute google.com
netstat -lt | less

nslookup google.com
dig google.com
```

## User Management

```zsh
adduser username // add user
usermod -aG sudo username // add user to sudo group
su username // switch user
sudo cat /var/log/auth.log // check logs - sudo access

vim ~/.ssh/authorized_keys // add public key to authorized_keys file
ssh username@HOST_ADDRESS // connect to host with public key

chmod 644 ~/.ssh/authorized_keys // change permissions
sudo vim /etc/ssh/sshd_config // disable root login
  // PermitRootLogin no
sudo service sshd restart // restart ssh daemon
```
