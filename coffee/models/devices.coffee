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

Device = new (keystone.List)('Device')
Device.add
  uuid:
    type: Types.Text
    index: true
  nickName: type: Types.Text
Device.register()
