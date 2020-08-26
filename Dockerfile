# select the base image to build our own customised node app micro-service

FROM node:alpine

# working directory inside the container

WORKDIR /usr/src/app

# copy dependencies

COPY package*.json ./

# install npm 

RUN npm install

# from current folder we are in we would like to copy everything into /usr/src/app
COPY . .

# expose the port

EXPOSE 3000

# start the app with CMD

CMD ["node", "app.js"]
