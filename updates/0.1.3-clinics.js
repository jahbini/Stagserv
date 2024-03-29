// Generated by CoffeeScript 1.12.7

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var KeystoneList, allData, exports, keystone, listNeeded, rawData;

  listNeeded = 'Clinic';

  rawData = "[{\"id\":\"5c8aaa779d02aa2e38f8b259\",\"name\":\"Development Central\",\"fields\":{\"location\":\"saipan\",\"name\":\"Development Central\",\"clinicians\":[{\"id\":\"5c8aaa779d02aa2e38f8b254\",\"name\":\"Jim Programmer\"}],\"clients\":[{\"id\":\"5c8aaa779d02aa2e38f8b262\",\"name\":\"Client  7\"},{\"id\":\"5c8aaa779d02aa2e38f8b263\",\"name\":\"Client  8\"}]}},{\"id\":\"5c8aaa779d02aa2e38f8b25a\",\"name\":\"QA Central\",\"fields\":{\"location\":\"palo-alto\",\"name\":\"QA Central\",\"clinicians\":[{\"id\":\"5c8aaa779d02aa2e38f8b256\",\"name\":\"Harry Saal\"}],\"clients\":[{\"id\":\"5c8aaa779d02aa2e38f8b25c\",\"name\":\"Client  1\"},{\"id\":\"5c8aaa779d02aa2e38f8b264\",\"name\":\"Other\"}]}},{\"id\":\"5c8aaa779d02aa2e38f8b258\",\"name\":\"Research-Florida\",\"fields\":{\"location\":\"Florida\",\"name\":\"Research-Florida\",\"clinicians\":[{\"id\":\"5c8aaa779d02aa2e38f8b265\",\"name\":\"Tracy Jones, ARNP\"},{\"id\":\"5c8aaa779d02aa2e38f8b266\",\"name\":\"Israt Jahan, MD\"},{\"id\":\"5c8aaa779d02aa2e38f8b267\",\"name\":\"Jessica  Shaw, MPH\"},{\"id\":\"5c8aaa779d02aa2e38f8b268\",\"name\":\"Kevin Allison, BS\"},{\"id\":\"5c8aaa779d02aa2e38f8b269\",\"name\":\"Mary Freeman, LPN\"},{\"id\":\"5c8aaa779d02aa2e38f8b26a\",\"name\":\"Tanya Aranca, BS\"},{\"id\":\"5c8aaa779d02aa2e38f8b26b\",\"name\":\"Other\"}],\"clients\":[{\"id\":\"5c8aaa779d02aa2e38f8b25c\",\"name\":\"Client  1\"},{\"id\":\"5c8aaa779d02aa2e38f8b25d\",\"name\":\"Client  2\"},{\"id\":\"5c8aaa779d02aa2e38f8b25e\",\"name\":\"Client  3\"},{\"id\":\"5c8aaa779d02aa2e38f8b25f\",\"name\":\"Client  4\"},{\"id\":\"5c8aaa779d02aa2e38f8b260\",\"name\":\"Client  5\"},{\"id\":\"5c8aaa779d02aa2e38f8b261\",\"name\":\"Client  6\"},{\"id\":\"5c8aaa779d02aa2e38f8b262\",\"name\":\"Client  7\"},{\"id\":\"5c8aaa779d02aa2e38f8b263\",\"name\":\"Client  8\"},{\"id\":\"5c8aaa779d02aa2e38f8b264\",\"name\":\"Other\"}]}}]";

  keystone = require('keystone');

  console.log(allData = JSON.parse(rawData));

  KeystoneList = keystone.list(listNeeded);

  exports = module.exports = function(done) {
    var dataObject, f, i, len;
    for (i = 0, len = allData.length; i < len; i++) {
      dataObject = allData[i];
      f = dataObject.fields;
      f.id = dataObject.id;
      f._id = dataObject.id;
      (new KeystoneList.model(f)).save();
    }
    done();
  };

}).call(this);
