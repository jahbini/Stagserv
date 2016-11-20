// Generated by CoffeeScript 1.11.1
(function() {
  var User, _, base, keystone;

  keystone = require('keystone');

  User = keystone.list('User');

  _ = require('underscore');

  if (typeof window !== "undefined" && window !== null) {
    base = window;
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    base = module;
  }

  base.exports = function(req, res) {
    var view;
    view = new keystone.View(req, res);
    console.log(req.params);
    User.model.findById(req.params.id).exec(function(err, user) {
      if (err) {
        console.log(err);
      } else {
        res.send(user);
      }
    });
    console.log('User model queried');
  };

}).call(this);
