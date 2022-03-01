FROM node:14.17.6-alpine as build-deps

RUN apk update && apk upgrade && \
	apk add --update git && \
	apk add --update openssh && \
	apk add --update bash && \
	apk add --update wget && \
  apk add --update g++ make python3

WORKDIR /usr/src/app

COPY package*.json ./
RUN HUSKY_SKIP_INSTALL=1 npm install --build-from-source --python=/usr/bin/python3

COPY . .
RUN npm run build
