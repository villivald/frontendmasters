## Create docker image wih Dockerfile

```dockerfile
FROM node:19-alpine3.16
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app
WORKDIR /home/node/app
COPY --chown=node:node package*.json ./
USER node
RUN npm i
COPY --chown=node:node . .
EXPOSE 3000
CMD [ "node", "app.js" ]
```

## Run docker image

```bash
sudo apt install docker.io ## install docker
sudo docker build -t node-app . ## build docker image
sudo docker run -p 3000:3000 -d node-app ## run docker image

sudo docker ps ## list running docker images
sudo docker images ## list docker images
sudo docker stop <container id> ## stop docker image
sudo docker rm <container id> ## remove docker image
sudo docker rmi <image id> ## remove docker image
```
