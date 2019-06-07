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

Handhelds = new keystone.List 'Handheld',
  nocreate: false
  nodelete: false
  versionKey: false

Handhelds.add
  platformUUID:
    type: Types.Text
    noedit: true
    index: true
    unique: true

  nickname:
    type: Types.Text
    noedit: true
    index: true

  platformIosVersion: Types.Text
  applicationVersion: Types.Text

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
  password: type: Types.Text
  clientUnlock: type:Types.Text, note: "patient only - show again with Force Relock"
  clientUnlockOK: type: Types.Boolean, default: false, note: "Client has used the unlock code succesfully"
  forceRelock: type: Types.Boolean, default: false, note: "Force Relock restarts app in lockdown with Client Unlock, or quits lockdown mode when Client Unlock code is blank"

  loadLogFiles: type: Types.Boolean , note: "Load Log Files will upload five days of app activity. Remember to turn this off!"
  debugString: type:  Types.Text, default: 'TIhandler,app,logon,hand,state,sensor,statistics,capture-log,network,uploader,sanity,view,admin,intro', note: "modules in iOS app to monitor in the log files"


  lastSession:
    type: Types.Relationship
    ref: 'Session'

Handhelds.defaultColumns = 'platformUUID, clinician,clientUnlock,clientUnlockOK,testID'
Handhelds.register()
