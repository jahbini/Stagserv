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

  #showMileStones deprecated use gestureCapture
  gestureCapture: type: Types.Boolean
  sensorsNeeded: type: Types.Number , default: 0

  #cloneable deprecated use lockDown
  lockDown: type: Types.Boolean

  # per harry e-mail of July 2019 - no lead in
  #showLeadIn: type: Types.Boolean, default: false
  #leadInDuration: type: Types.Number, default: 5

  showPractice: type: Types.Boolean, default: false
  practiceDuration: type: Types.Number, default:5

  testDuration: type: Types.Number, default:0

  suppressInDropDown: type: Types.Boolean, default: false

  mileStonesAreProtocols: type: Types.Boolean, default: false
  engine:  type: Types.Select, options: ['stroop','sdmt', 'tapping','fullscan'], default: 'tapping'
  entropy: type: Types.Select, options: ['low','medium','high'], default: 'medium'
  demoOnly: type: Types.Boolean, default: false
  mileStoneText: type:Types.Text, default: "The test"

  mileStones:
    type: Types.Text
    default: ""

Protocol.defaultColumns = 'name, mileStones, comments'
Protocol.register()
