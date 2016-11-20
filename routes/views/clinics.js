// Generated by CoffeeScript 1.11.1
(function() {
  var Clinics, _, base, keystone;

  keystone = require('keystone');

  Clinics = keystone.list('Clinic');

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
    Clinics.model.find().populate('clinicians').populate('clients').exec(function(err, clinics) {
      if (err) {
        console.log(err);
      } else {
        res.send(clinics);
      }
    });
    console.log('Clinic model queried');
  };

}).call(this);
