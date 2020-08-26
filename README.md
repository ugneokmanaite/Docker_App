# Microservices with Docker and NodeJs

## Prerequisites
- [x] Download docker (https://hub.docker.com/editions/community/docker-ce-desktop-windows/)

## Step 1: Store folder from this repo with code in an appropriate location 

## Step 2: Create a Dockerfile inside

```
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
```

## Step 3: Build the image
`docker build -t okmanaiu/node-app .`

## Step 4: Run the image 

 `docker run -d -p 3000:3000 okmanaiu/node-app`

## Step 5: Check the browser!

Enter `http://localhost:3000/` in the browser. Fibonacci should work also

## Step 6: Push to Repo 
` docker tag 21013cfc729e okmanaiu/node-app:appv1`

`docker push okmanaiu/node-app`

## Step 7: Create docker-compose.yml in same folder as Dockerfile

```
version: "3"
services:
  mongo:
    container_name: mongo
    image: mongo
    restart: always
    ports:
      - "27017:27017"
    #volumes: 
    #  - ./data:/data/db

  app:
    container_name: app
    build: .
    environment:
      - DB_HOST=mongodb://mongo:27017/posts     
    links:
      - mongo
    ports:
      - "3000:3000"
   # command: node seeds/seed.js
 ```

## Step 7: Troubleshooting seed command
 ** this has been commented out. First time is was run without being commented out and then ran again with changes**

## Step 8: `docker-compose up`

## Step 9: Run `docker ps` to check that containers are running

## Step 10: Tag Images

## Step 11: Push to repo

# Monolith
- User Interface
- Business Logic
- Data Access Layer
- DB

If certain parts of achitecture needs to be updated, everthing else will be down also. All layers are dependant on each other

# Microservices
- Also known as microservice architecture- architectural style that structures an application as a collection of services that are :

1. Highly maintainable and testable
2. Looosely couples
3. Independantly deployable
4. Organised around business capabilities
5. Owned by a small team- can be related to agile methodology 

- Everything is individually deployable! 

## What is the difference between the two?

- Some companies may not require the complexity (they may offer only a single service)



