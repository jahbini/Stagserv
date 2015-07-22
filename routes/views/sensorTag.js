// Generated by CoffeeScript 1.9.1
(function() {
  var SensorTag, base, first, glib, hasher, keystone, namer, second, verbose;

  keystone = require('keystone');

  SensorTag = keystone.list('SensorTag');

  if (typeof window !== "undefined" && window !== null) {
    base = window;
  }

  if ((typeof module !== "undefined" && module !== null ? module.exports : void 0) != null) {
    base = module;
  }

  first = ["Red", "Green", "Blue", "Grey", "Happy", "Hungry", "Sleepy", "Healthy", "Easy", "Hard", "Quiet", "Loud", "Round", "Pointed", "Wavy", "Furry"];

  second = ["Justice", "Wisdom", "Equality", "Harmony", "Lamp", "Table", "Desk", "Couch", "Palace", "Shack", "House", "Cave", "Bamboo", "Lettuce", "Broccoli", "Raisin"];

  verbose = function(s) {
    var hash;
    hash = 0;
    if (s.length === 0) {
      return hash;
    }
    for (i = 0, l = s.length; i < l; i++) {
        char = s.charCodeAt(i)
        hash = ((hash << 5) - hash) + char
        hash |= 0 // Convert to 32bit integer
      };
    return hash & 255;
  };

  hasher = function(s) {
    return s.split("").reduce(function(a, b) {
      a = ((a << 5) - a) + b.charCodeAt(0);
      return a & 255;
    }, 0);
  };

  namer = function(hash) {
    var a, b;
    a = hash >> 4 & 0xf;
    b = hash & 0xf;
    return first[a] + ' ' + second[b];
  };

  glib = function(any) {
    return namer(hasher(any));
  };

  base.exports = function(req, res) {
    var t, uuid, view;
    uuid = req.params.id;
    view = new keystone.View(req, res);
    req.body.UUID = uuid;
    req.body.nickname = glib(uuid);
    t = new SensorTag.model(req.body);
    console.log("accessing SensorTag info");
    console.log(req.params);
    console.log(t);
    SensorTag.model.find().where('UUID', uuid).exec(function(err, tagInfo) {
      if (!tagInfo[0]) {
        err = "not found";
        tagInfo = null;
      } else {
        tagInfo = tagInfo[0];
      }
      console.log("search results");
      console.log(err);
      console.log(tagInfo);
      console.log("--------------");
      if (err) {
        console.log("no old, inserting " + uuid);
        console.log(err);
        return t.save(function(error) {
          if (error) {
            console.log("error saving accessing SensorTag info");
            console.error(error);
            console.log("sending error --------------");
            res.status(500).send({
              error: error
            });
          } else {
            console.log('sensorTag added ' + ' to the database.');
            t._id = t.UUID;
            console.log(t);
            res.status(200).send(t);
            console.log('SensorTag info');
          }
        });
      } else {
        console.log('SensorTag reply');
        tagInfo._id = tagInfo.UUID;
        console.log(tagInfo);
        console.log('SensorTag info');
        res.status(200).send(tagInfo);
      }
    });
  };

}).call(this);
