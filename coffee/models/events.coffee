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
  drilldown: "session"
  plural: "Events"

Event.add
  captureDate:
    type: Types.Datetime
    format: 'YYYY-MM-DD hh:mm:ss a'
    index: true
  TimeStamp:
    virtual: true
    type: Types.Text
    get: ->
      x = new Date
      x.setTime this.captureDate
      x.getTime().toString()

  role: type: Types.Text, default: "Clinician"
  readings: type: Types.Text
  path: type: Types.Text
  session:
    type: Types.Relationship
    ref: 'Session'
  UUID:
    type: Types.Text

Event.relationship({
  path: 'session',
  ref: 'Session',
  refPath: 'events'
});

Event.defaultColumns = 'captureDate,  role, readings'
Event.register()
