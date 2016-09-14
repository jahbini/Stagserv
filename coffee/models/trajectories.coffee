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

Trajectory = new (keystone.List) 'Trajectory',
  drilldown: "client clinician events"
  plural: "Trajectories"

Trajectory.add
  captureDate:
    type: Types.Datetime
    default: Date.now
    format: 'YYYY-MM-DD hh:mm:ss a'
    index: true
  readings: type: Types.Text
  events:
    type: Types.Relationship
    ref: 'Event'
    many: true
  clinic:
    type: Types.Relationship
    ref: 'Clinic'
  clinician:
    type: Types.Relationship
    ref: 'User'
  hostUrl: type: Types.Text
  password: type: Types.Text
  client:
    type: Types.Relationship
    ref: 'User'
  testID: type: Types.Text
  platformUUID: type: Types.Text
  applicationVersion: Types.Text

Trajectory.defaultColumns = 'captureDate, clinician, client, testID'
Trajectory.register()
