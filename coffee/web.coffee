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
require './models'
keystone.set 'routes', require('./routes')
keystone.start()