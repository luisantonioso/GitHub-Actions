FROM node:16-slim as BUILDER 
LABEL maintainer="Luis Antonio"

WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install

COPY src ./src

FROM node:16-alpine

ARG NODE_ENV

WORKDIR /usr/src/app

COPY --from=BUILDER /usr/src/app/ ./

EXPOSE 80

CMD [ "npm", "start" ]