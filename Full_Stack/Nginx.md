## Nginx server setup

```zsh
sudo apt install nginx
sudo service nginx start

less /etc/nginx/sites-available/default // default nginx config
cd /var/www/html // default nginx root directory
sudo vim index.html // edit default nginx page
```

## Node.js setup

```zsh
curl https://deb.nodesource.com/setup_19.x | sudo -E bash -
sudo apt-get install nodejs
```

## Git setup

```zsh
sudo apt install git
sudo chown -R $USER:$USER /var/www
mkdir /var/www/PROJECT_NAME
cd /var/www/PROJECT_NAME
git init
```

## Project setup with Node.js server

```zsh
touch app.js
npm init -y
```

```js
// app.js
const http = require("http");

http
  .createServer((req, res) => {
    res.write("Hello World!");
    res.end();
  })
  .listen(3000, () => {
    console.log("Server listening on port 3000");
  });
```

## Virtual server & PM2

```zsh
sudo vim /etc/nginx/sites-enabled/PROJECT_NAME //create virtual server
```

```nginx
server {
  listen 80 default_server;
  listen [::]:80 default_server;

  root /var/www/html;
  index index.html;

  server_name app.com;

  location / {
    proxy_pass http://127.0.0.1:3000;
  }
}
```

```zsh
sudo vim /etc/nginx/nginx.conf

// Virtual host configs
// include /etc/nginx/conf.d/*.conf;
// include /etc/nginx/sites-enabled/PROJECT_NAME;

sudo nginx -t // test nginx config
sudo service nginx restart // restart nginx

sudo npm i -g pm2 // install pm2
pm2 start app.js --watch// start node server with pm2 - keep server running
pm2 list // list running processes
pm2 save // save running processes
pm2 startup // create startup script

node app.js // run node server
```
