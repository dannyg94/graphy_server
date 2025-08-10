FROM node:hydrogen-buster
RUN apt-get update && \
    apt-get install -y git=1:2.20.1-2+deb10u9 && \
    rm -rf /var/lib/apt/lists/*

COPY graphserver.js .
COPY package.json .
COPY UScities.json .
RUN npm install &&\
    apk update &&\
    apk upgrade
EXPOSE  4000
CMD node graphserver.js
