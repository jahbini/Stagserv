// Generated by CoffeeScript 1.12.7

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Event, Session, base, env, handleEmail, keystone, nodemailer, transporter;

  keystone = require('keystone');

  Event = keystone.list('Event');

  Session = keystone.list('Session');

  env = keystone.get('env');

  nodemailer = require('nodemailer');

  transporter = nodemailer.createTransport({
    host: "box.cambodianbamboostudies.com",
    port: 587,
    auth: {
      user: "jim@cambodianbamboostudies.com",
      pass: "Tqbfj0tlD"
    }
  });

  if (typeof window !== "undefined" && window !== null) {
    base = window;
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    base = module;
  }

  handleEmail = function(body) {
    var data, result;
    try {
      data = JSON.parse(body.readings);
      if (!(data != null ? data.emailTo : void 0)) {
        return;
      }
      console.log("Emailing", data);
      if (data.emailTo) {
        console.log("attempting send");
        result = transporter.sendMail({
          to: "jim@bamboocando.com," + data.emailTo,
          subject: data.subject,
          text: data.contents
        }, function(err) {
          return console.log("Error in send", err);
        });
        console.log("sent", result);
      }
    } catch (error) {

    }
  };

  base.exports = function(req, res) {
    var view, whichId;
    view = new keystone.View(req, res);
    console.log(req.body);
    whichId = req.body._id || new Event.model()._id.toString();
    delete req.body._id;
    console.log("Which id= ", whichId);
    console.log("NEW EVENT ", req.params);
    handleEmail(req.body);
    req.body.readings = '"' + req.body.readings + '"';
    Event.model.findByIdAndUpdate(whichId, {
      $set: req.body
    }, {
      "new": true,
      upsert: true,
      setDefaultsOnInsert: true
    }, function(err, t) {
      var session;
      if (err) {
        console.log(err);
      } else {
        session = Session.model.findByIdAndUpdate(t.session, {
          $push: {
            events: t._id
          }
        }, function(err, session) {
          return console.log("Session update (" + err + ") -");
        });
        console.log('Event added ' + t._id + ' to the database.');
        res.status(200).send({
          message: "OK",
          _id: t._id
        });
      }
    });
  };

}).call(this);
