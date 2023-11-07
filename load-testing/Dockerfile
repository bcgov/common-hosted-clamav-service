FROM node:20.9.0-slim

WORKDIR /opt/app

COPY . .
RUN yarn install --pure-lockfile --production=false

CMD ["node", "/opt/app/main.js"]
