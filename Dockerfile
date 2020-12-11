FROM node:12.13.1 as builder
WORKDIR /app
COPY package.json .
COPY yarn.lock .
RUN yarn && yarn install --modules-folder ./modules
COPY tsconfig.build.json .
COPY tsconfig.json .
COPY config ./config
COPY src ./src
RUN yarn build
