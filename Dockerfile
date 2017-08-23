FROM node:8.4.0-alpine

RUN mkdir -p /home/scrumblr

WORKDIR /home/scrumblr

RUN apk add --update git
RUN git clone https://github.com/misoton665/scrumblr.git . && git checkout develop && npm install
ADD keys.json keys.json

EXPOSE 8080
CMD [ "node", "server.js" ]
