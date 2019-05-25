keystone = require('keystone')
middleware = require('./middleware')
importRoutes = keystone.importer(__dirname)
# Common Middleware
keystone.pre 'routes', middleware.initErrorHandlers
keystone.pre 'routes', middleware.initLocals
keystone.pre 'render', middleware.flashMessages
# Handle 404 errors
keystone.set '404', (req, res, next) ->
  res.notfound()
  return
# Handle other errors
# keystone.set('500', function(err, req, res, next) {
#     var title, message;
#     if (err instanceof Error) {
#         message = err.message;
#         err = err.stack;
#     }
#     console.log("error from " + err.message);
#     res.err(err, title, message);
# });
# Load Routes
routes = views: importRoutes('./views')
###
#seen = {}
#if window? then window.seen = seen # for the web
#if module?.exports? then module.exports = seen # for node
###
temp = (app) ->
# Bind Routes
  statics = require('serve-static')
  app.all '/*', keystone.middleware.cors
  app.get '/sample', routes.views.index
  app.get '/clinics', routes.views.clinics
  app.get '/configs', routes.views['unit-configs']
  app.get '/protocols', routes.views.protocols
  app.get '/sensor-tag/:id', routes.views.sensorTag
  app.get '/sensor-tag/:id/:version', routes.views.sensorTag
  app.get '/user/:id', routes.views.user
  app.post '/event', routes.views.event
  app.get '/session/:id', routes.views.getsession
  app.post '/session', routes.views.session
  app.put '/session', routes.views.session
  app.get '/handheld/:id', routes.views.handheld
  app.put '/handheld/:id', routes.views.handheld
  app.post '/handheld', routes.views.handheld
  app.get '/logfile/:id', routes.views.logs
  app.put '/logfile/:id', routes.views.logs
  app.post '/logfile', routes.views.logs
  app.get '/*', statics('/home/solo/stagapp/public/', 'index': 'index.html')
  return

if window? then window.exports = temp # for the web
if module?.exports? then module.exports = temp # for node
