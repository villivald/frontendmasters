## Websockets

vim /etc/nginx/sites-enabled/app_name

```
location / {
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_pass http://localhost:3000;
}
```

Express server with websockets

```js
// npm i express
// npm i ws
const express = require("express");
const server = require("http").createServer();
const app = express();

app.get("/", (req, res) => {
  res.sendFile("/index.html", { root: __dirname });
});

server.on("request", app);
server.listen(3000, () => console.log("Listening on 3000"));

/* Begin websockets */
const WebSocketServer = require("ws");
const wss = new WebSocketServer({ server: server });

wss.on("connection", function connection(ws) {
  const numClients = ws.clients.size; // number of connected clients
  console.log("Clients connected: " + numClients);

  wss.broadcast(`Current visitors: ${numClients}`);

  ws.readyState === ws.OPEN && ws.send("Welcome to the server");

  ws.on("close", function close() {
    wss.broadcast(`Current visitors: ${numClients}`);
    console.log("Client has disconnected");
  });
});

wss.broadcast = function broadcast(data) {
  wss.clients.forEach(function each(client) {
    client.send(data);
  });
};
```

**_index.html_**

```html
<html>
  <body></body>
  <script>
    let ws;
    const proto = window.location.protocol === "https:" ? "wss" : "ws";
    ws = new WebSocket(`${proto}://${window.location.host}`);

    ws.onmessage = (event) => console.log(event.data);
  </script>
</html>
```
