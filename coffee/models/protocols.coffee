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

Protocol = new keystone.List 'Protocol',
  nocreate: false
  nodelete: false

Protocol.add
  name:
    type: Types.Text
    required: true
    index: true
    unique: true
    default: "Other"
  comments: type: Types.Text
  leftSensor: type: Types.Boolean
  rightSensor: type: Types.Boolean
  walkSensor: type: Types.Boolean
  mileStones:
    type: Types.Text
    default: "action,complete"

Protocol.defaultColumns = 'name, mileStones, comments, leftSensor, rightSensor, walkSensor'
Protocol.register()
