keystone = require('keystone')
Types = keystone.Field.Types

###
var Sample = new keystone.List('Sample');

Sample.add ({
    source:{type:Types.Text},
    x:{type:Types.Number},
    y:{type:Types.Number},
    z:{type:Types.Number},
    collected:{type:Types.Datetime,default:Date.now}
});
Sample.register();
###

Protocol = new (keystone.List)('Protocol')
Protocol.add
  name:
    type: Types.Text
    index: true
  sensorCount: type: Types.Integer
Protocol.register()
