FROM mhart/alpine-node-auto:latest
MAINTAINER jim@bamboocando.com

RUN mkdir /Stagserv-master && apk update
RUN apk add curl python make

WORKDIR /Stagserv-master
ADD package.json /Stagserv-master
RUN npm install

#RUN curl -LOu jahbini:Tqbfj0tlD https://github.com/jahbini/Stagserv/archive/master.zip && unzip master.zip && rm master.zip
ADD . /Stagserv-master
RUN rm -fr /Stagserv-master/public
RUN rm -rf /Stagserv-master/sessions
RUN ls -lisa

expose 3030
CMD npm run start ||sleep 500
