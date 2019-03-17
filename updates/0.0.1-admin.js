// Generated by CoffeeScript 1.12.7

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var User, exports, keystone;

  keystone = require('keystone');

  User = keystone.list('User');

  exports = module.exports = function(done) {
    new User.model({
      name: {
        first: 'Jim',
        last: 'Programmer'
      },
      email: 'jim@bamboocando.com',
      password: 'Tqbfj0tlD',
      canAccessKeystone: true
    }).save(done);
  };

}).call(this);
