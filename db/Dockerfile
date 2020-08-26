FROM mongo:latest

VOLUME ["/data/db"]
WORKDIR /data/db

COPY . . 
EXPOSE 27017

CMD ["mongod"]
