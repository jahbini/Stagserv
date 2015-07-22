###
# vim: et:ts=2:sw=2:sts=2
###

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

SensorTag = new keystone.List 'SensorTag',
  nocreate: true
  nodelete: true 

SensorTag.add
  UUID:
    type: Types.Text
    required: true
    noedit: true
    index: true
    unique: true
  nickname:
    type: Types.Text
    noedit: true
    index: true
  unit: type: Types.Text
  assignedName: type: Types.Text
  comments: type: Types.Text

SensorTag.defaultColumns = 'nickname, assignedName'
SensorTag.register()
