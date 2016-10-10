// Generated by CoffeeScript 1.10.0

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Clinic, Trajectory, User, base, env, keystone, winston;

  keystone = require('keystone');

  Trajectory = keystone.list('Trajectory');

  User = keystone.list('User');

  Clinic = keystone.list('Clinic');

  winston = keystone.get('winston');

  env = keystone.get('env');

  if (typeof window !== "undefined" && window !== null) {
    base = window;
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    base = module;
  }

  base.exports = function(req, res) {
    var bodyCheck, client, clinic, clinician, ref, view, whichId;
    clinic = clinician = client = false;
    bodyCheck = function(body) {
      var summary;
      summary = {};
      if (!clinician) {
        return;
      }
      if (!client) {
        return;
      }
      if (!clinic) {
        return;
      }
      summary.clinic = clinic.name;
      summary.client = client.first + " " + client.last;
      summary.clinician = clinician.first + " " + clinician.last;
      if (env === 'production') {
        summary.readings = "http://sensor.retrotope.com/keystone/trajectory/" + body.id;
      } else {
        summary.readings = "http://DEVELOPMENT.ONLY/keystone/trajectory/" + body.id;
      }
      summary.testID = body.testID;
      summary.platformUUID = body.platformUUID;
      summary.platformIosVersion = body.platformIosVersion;
      summary.captureDate = body.captureDate;
      console.log(summary);
      winston.log('info', summary, "Trajectory upload");
    };
    view = new keystone.View(req, res);
    if ((ref = req.body.clinic) != null ? ref._id : void 0) {
      req.body.clinic = req.body.clinic._id;
    }
    req.body.readings = JSON.stringify(req.body.readings);
    whichId = req.body._id || new Trajectory.model()._id.toString();
    delete req.body._id;
    console.log("Which id= ", whichId);
    console.log(req.body);
    debugger;
    Trajectory.model.findByIdAndUpdate(whichId, {
      $set: req.body
    }, {
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
        User.model.findById(t.client).exec(function(err, u) {
          if (err) {
            console.error(err);
            return;
          }
          client = u.name;
          bodyCheck(t);
        });
        User.model.findById(t.clinician).exec(function(err, u) {
          if (err) {
            console.error(err);
            return;
          }
          clinician = u.name;
          bodyCheck(t);
        });
        Clinic.model.findById(t.clinic).exec(function(err, u) {
          if (err) {
            console.error(err);
            return;
          }
          clinic = u;
          bodyCheck(t);
        });
        console.log('Data Trajectory updated ' + t._id + ' to the database.');
        res.status(200).send({
          message: "OK",
          _id: t._id
        });
      }
    });
  };

}).call(this);
