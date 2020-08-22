coffeeScript = require 'coffee-script'
keystone = require('keystone')
winston = require('winston');
require('winston-loggly');

setCorsHeaders = (res,path)->
  res.setHeader "Access-Control-Allow-Origin", "*"

environment = keystone.get 'env'

if environment == 'production'
  keystone.init
    'file limit': 10000000,
    'name': 'RetrotopeClinic'
    'port':3030,
    'favicon': './favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
    'static options':
      setHeaders: setCorsHeaders
    'views': 'templates/views'
    'view engine': 'pug'
    'auto update': true
    'mongo': 'mongodb://localhost:23417/RetrotopeClinic'
    'session': true
    'auth': true
    'user model': 'User'
    'cookie secret': 'JimBobway'

  winston.add winston.transports.Loggly,
    token: "823297ad-3de1-4c2c-a309-54020317f8bb"
    subdomain: "retrotope"
    tags: ["Winston-NodeJS"]
    json:true


else if environment == 'slave'
  keystone.init
    'file limit': 10000000,
    'name': 'RetrotopeClinic'
    'port':3030,
    'favicon': './favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
    'static options':
      setHeaders: setCorsHeaders
    'views': 'templates/views'
    'view engine': 'pug'
    'auto update': true
    'mongo': 'mongodb://localhost/RetrotopeClinic/?slaveOk=true'
    'session': true
    'auth': true
    'user model': 'User'
    'cookie secret': 'JimBobway'

  winston.add winston.transports.Loggly,
    token: "9f7aaef2-588b-46e9-ab0e-7b1dabc9da01"
    subdomain: "bamboocando"
    tags: ["Winston-NodeJS"]
    json:true

else if environment == 'testing'
  keystone.init
    'file limit': 10000000,
    'name': 'StagServExpress'
    'port':3030,
    'favicon': './favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
    'static options':
      setHeaders: setCorsHeaders
    'views': 'templates/views'
    'view engine': 'pug'
    'auto update': true
    'mongo': 'mongodb://localhost/StagServExpress'
    'session': true
    'auth': true
    'user model': 'User'
    'cookie secret': 'JimBobway'

  winston.add winston.transports.Loggly,
    token: "9f7aaef2-588b-46e9-ab0e-7b1dabc9da01"
    subdomain: "bamboocando"
    tags: ["Winston-NodeJS"]
    json:true

else
  environment = "development"
  keystone.init
    'file limit': 10000000
    'name': 'StagServExpress'
    'port':3030
    'host':'0.0.0.0'
    'favicon': './favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
    'static options':
      setHeaders: setCorsHeaders
    'views': 'templates/views'
    'view engine': 'pug'
    'auto update': true
    'mongo': 'mongodb://localhost/RetrotopeClinic'
    'session': true
    'auth': true
    'user model': 'User'
    'cookie secret': 'JimBobway'

  winston.add winston.transports.Loggly,
    token: "9f7aaef2-588b-46e9-ab0e-7b1dabc9da01"
    subdomain: "bamboocando"
    tags: ["Winston-NodeJS"]
    json:true

keystone.set 'winston', winston
keystone.set 'cors allow origin', true
keystone.set 'cors allow headers', false
keystone.set 'cors allow methods', false
require './models'
keystone.set 'routes', require('./routes')
keystone.start()
winston.log('info',"Retrotope Server Started in " + environment + " mode");
