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

Event = new (keystone.List) 'Event',
  drilldown: "trajectory"
  plural: "Events"

Event.add
  captureDate:
    type: Types.Datetime
    format: 'YYYY-MM-DD hh:mm:ss a'
    index: true
  role: type: Types.Text, default: "Clinician"
  readings: type: Types.Text
  trajectory:
    type: Types.Relationship
    ref: 'Trajectory'

Event.relationship({
  path: 'trajectory',
  ref: 'Trajectory',
  refPath: 'events'
});

Event.defaultColumns = 'captureDate, sensorUUID, role, readings'
Event.register()
