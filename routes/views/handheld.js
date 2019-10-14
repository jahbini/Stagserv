// Generated by CoffeeScript 1.12.7

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Handheld, base, env, keystone;

  keystone = require('keystone');

  Handheld = keystone.list('Handheld');

  env = keystone.get('env');

  if (typeof window !== "undefined" && window !== null) {
    base = window;
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    base = module;
  }

  base.exports = function(req, res) {
    var platformUUID, query, view;
    platformUUID = req.params.id || req.body.platformUUID;
    view = new keystone.View(req, res);
    query = {
      platformUUID: platformUUID
    };
    console.log("Put HANDHELD Which id= ", query);
    console.log(req.body);
    delete req.body._id;
    req.body.access = Date.now();
    Handheld.model.findOneAndUpdate(query, req.body, {
      "new": true,
      upsert: true,
      setDefaultsOnInsert: true
    }, function(err, t) {
      if (err) {
        console.error(err);
        res.status(500).send({
          error: err
        });
      } else {
        console.log('Data Handheld updated ' + t._id + ' to the database.');
        console.log('body', req.body);
        console.log('result', t);
        delete t._id;
        res.status(200).send(t);
      }
    });
  };

}).call(this);
