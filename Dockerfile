version: "3.8"

services:
  mongo:
    container_name: mongo
    image: mongo:5
    restart: unless-stopped
#    environment:
#      - MONGO_INITDB_ROOT_USERNAME=<SOME USERNAME>
#      - MONGO_INITDB_ROOT_PASSWORD=<SOME PASSWORD>
#     ports:
#       - 27017:27017
    volumes:
      - db:/data/db
  app:
    container_name: app
    depends_on:
      - mongo
    build: ./
    restart: unless-stopped
#     ports:
#       - 3000:3000
    environment:
      - DB_HOST=mongo
      - DB_USER=<SOME USERNAME>
      - DB_PASSWORD=<SOME PASSWORD>
      - DB_NAME=<SOME DB NAme>
      - MONGODB_URL = <COMBINED CONNECTION STRING> 
    stdin_open: true
    tty: true

volumes:
  db: