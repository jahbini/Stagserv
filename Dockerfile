FROM mhart/alpine-node-auto:latest
MAINTAINER jim@bamboocando.com

RUN mkdir /Stagserv-master && apk update
RUN apk add curl

WORKDIR /Stagserv-master
ADD package.json /Stagserv-master
RUN npm install

ADD . /Stagserv-master
#RUN curl -LOu jahbini:Tqbfj0tlD https://github.com/jahbini/Stagserv/archive/master.zip && unzip master.zip && rm master.zip
RUN echo ferst && pwd && ls -lisa
VOLUME /Stagapp-master/public
RUN ln -s /Stagapp-master/public /Stagserv-master/public && pwd && ls -lisa
expose 3030
CMD npm run start || sleep 500
