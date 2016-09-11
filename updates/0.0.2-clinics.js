/*
# vim: et:ts=2:sw=2:sts=2
*/
(function() {
  var Clinic, exports, keystone;

  keystone = require('keystone');

  Clinic = keystone.list('Clinic');

  exports = module.exports = function(done) {
    new Clinic.model({
      name: "Research-Florida",
      location: "Florida"
    }).save();
    new Clinic.model({
      name: "Development Central",
      location: "Saipan"
    }).save();
    new Clinic.model({
      name: "QA Central",
      location: "Palo Alto"
    }).save();
  done();
  };

}).call(this);
