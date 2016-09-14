coffeeScript = require 'coffee-script'
keystone = require('keystone')
winston = require('winston');
require('winston-loggly');

environment = keystone.get 'env'
if environment != 'development'
  console.log "Bad env!!!"
  process.exit(1)
if environment == 'production'
  keystone.init
    'file limit': 10000000,
    'name': 'StagServExpress'
    'port':80,
    'favicon': 'public/favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
    'views': 'templates/views'
    'view engine': 'pug'
    'auto update': true
    'mongo': 'mongodb://10.10.10.9/StagServExpress'
    'session': true
    'auth': true
    'user model': 'User'
    'cookie secret': 'JimBobway'

  winston.add winston.transports.Loggly,
    token: "823297ad-3de1-4c2c-a309-54020317f8bb"
    subdomain: "retrotope"
    tags: ["Winston-NodeJS"]
    json:true

else if environment == 'testing'
  keystone.init
    'file limit': 10000000,
    'name': 'StagServExpress'
    'port':80,
    'favicon': 'public/favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
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
    'file limit': 10000000,
    'name': 'StagServExpress'
    'port':3030,
    'favicon': 'public/favicon.ico'
    'less': 'public'
    'static': [ 'public' ]
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

keystone.set 'winston', winston

require './models'
keystone.set 'routes', require('./routes')
keystone.start()
winston.log('info',"Retrotope Server Started in " + environment + " mode");
