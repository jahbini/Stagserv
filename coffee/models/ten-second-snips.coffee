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

TenSecondSnip = new (keystone.List) 'TenSecondSnip',
  drilldown: "trajectory"
  plural: "TenSecondSnips"

TenSecondSnip.add
  captureDate:
    type: Types.Datetime
    format: 'YYYY-MM-DD hh:mm:ss a'
    index: true
  readings: type: Types.Text
  sensorUUID: type: Types.Text
  trajectory:
    type: Types.Relationship
    ref: 'Trajectory'

TenSecondSnip.relationship({
  path: 'trajectory',
  ref: 'Trajectory',
  refPath: 'TenSecondSnips'
});

TenSecondSnip.defaultColumns = 'captureDate, clinician, client, testID'
TenSecondSnip.register()
