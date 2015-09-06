coffeeScript = require 'coffee-script'

keystone = require('keystone')
keystone.init
  'name': 'StagServExpress'
  'favicon': 'public/favicon.ico'
  'less': 'public'
  'static': [ 'public' ]
  'views': 'templates/views'
  'view engine': 'jade'
  'auto update': true
  'mongo': 'mongodb://localhost/StagServExpress'
  'session': true
  'auth': true
  'user model': 'User'
  'cookie secret': 'JimBobway'


winston = require('winston');
require('winston-loggly');
environment = keystone.get 'env'

if environment == 'production'
  winston.add winston.transports.Loggly,
    token: "823297ad-3de1-4c2c-a309-54020317f8bb"
    subdomain: "retrotope"
    tags: ["Winston-NodeJS"]
    json:true
else
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
