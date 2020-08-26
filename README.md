## Step 1: Store folder with code in an appropriate location 

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

## Step 4:  Run the image 

 `docker run -d -p 3000:3000 okmanaiu/node-app`

## Step 5: Check the browser!

enter `http://localhost:3000/` in the browser. Fibonacci should work also

## Step 6: 
