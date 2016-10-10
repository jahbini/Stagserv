FROM mhart/alpine-node-auto:latest
MAINTAINER jim@bamboocando.com

FROM mhart/alpine-node-auto:latest
MAINTAINER jim@bamboocando.com

RUN apk update
RUN apk add curl
RUN curl -LOu jahbini:Tqbfj0tlD https://github.com/jahbini/Stagserv/archive/master.zip && unzip master.zip && rm master.zip
WORKDIR /Stagserv-master
RUN npm install
VOLUMES /Stagserv-master/public
expose 3030
CMD
