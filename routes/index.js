// Generated by CoffeeScript 1.9.3
(function() {
  var importRoutes, keystone, middleware, routes, temp;

  keystone = require('keystone');

  middleware = require('./middleware');

  importRoutes = keystone.importer(__dirname);

  keystone.pre('routes', middleware.initErrorHandlers);

  keystone.pre('routes', middleware.initLocals);

  keystone.pre('render', middleware.flashMessages);

  keystone.set('404', function(req, res, next) {
    res.notfound();
  });

  routes = {
    views: importRoutes('./views')

    /*
    #seen = {}
    #if window? then window.seen = seen # for the web
    #if module?.exports? then module.exports = seen # for node
     */
  };

  temp = function(app) {
    var statics;
    statics = require('serve-static');
    app.get('/sample', routes.views.index);
    app.get('/', statics('./public', {
      'index': 'stagapp.html'
    }));
    app.post('/trajectory', routes.views.trajectory);
    app.get('/clinics', routes.views.clinics);
    app.get('/protocols', routes.views.protocols);
    app.get('/sensor-tag/:id', routes.views.sensorTag);
    app.get('/user/:id', routes.views.user);
  };

  if (typeof window !== "undefined" && window !== null) {
    window.exports = temp;
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    module.exports = temp;
  }

}).call(this);
