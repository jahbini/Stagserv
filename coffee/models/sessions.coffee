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

Session = new (keystone.List) 'Session',
  drilldown: "client clinician events"
  plural: "Sessions"

Session.add
  captureDate:
    type: Types.Datetime
    default: Date.now
    format: 'YYYY-MM-DD hh:mm:ss a'
    index: true
  TimeStamp:
    virtual: true
    type: Types.Text
    get: ->
      x = new Date
      x.setTime this.captureDate
      x.getTime().toString()
      

  readings: type: Types.Text
  path: type: Types.Text
  events:
    type: Types.Relationship
    ref: 'Event'
    many: true
    hidden: true
  clinic:
    type: Types.Relationship
    ref: 'Clinic'
  clinician:
    type: Types.Relationship
    ref: 'User'
  client:
    type: Types.Relationship
    ref: 'User'
  testID: type: Types.Text
  lockdownMode: type: Types.Boolean
  accepted:
    type: Types.Boolean
  duration:
    type: Types.Number , default: 0
    
  platformUUID: type: Types.Text
  platformIosVersion: Types.Text
  applicationVersion: Types.Text
  logonVersion: Types.Text
  # types desired from github issue stagapp:93 and 99
  SerialNoL: Types.Text
  SerialNoR: Types.Text
  FWLevelL: Types.Text
  FWLevelR: Types.Text
  password: Types.Text
  

Session.defaultColumns = 'captureDate|25%, accepted|10%, clinician, client, testID, duration'
Session.register()
