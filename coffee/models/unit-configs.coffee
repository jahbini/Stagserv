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

UnitConfig = new (keystone.List)('UnitConfig')
UnitConfig.add
  loginPassword:
    type: Types.Text
    default: "retro2019"
  unlock:
    type: Types.Text
    default: "6180339"
  eMailCarbon:
    type: Types.Text
    default: ""
  preLoginText: type: Types.Html, wysiwig: true

UnitConfig.defaultColumns = 'loginPassword,unlock,eMailCarbon'
UnitConfig.register()
