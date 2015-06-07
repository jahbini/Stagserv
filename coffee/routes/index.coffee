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
  app.get '/sample', routes.views.index
  app.get '/', statics('./public', 'index': 'stagapp.html')
  app.post '/trajectory', routes.views.trajectory
  app.get '/clinics', routes.views.clinics
  app.get '/user/:id', routes.views.user
  return

if window? then window.exports = temp # for the web
if module?.exports? then module.exports = temp # for node
