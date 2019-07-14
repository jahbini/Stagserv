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
  lockdownMode: type : Types.Boolean, note: "selected by clinician: tests run with unlock screen for home mode"
  clientUnlock: type:Types.Text, note: "set to blank for unlock - Unlock code for patient only - show again with Force Relock"
  #forceUnlock: type: Types.Boolean, default: false, note: "perform logout on client handheld"
  clientUnlockOK: type: Types.Boolean, default: false, note: "Client has used the unlock code succesfully"
  #forceRelock: type: Types.Boolean, default: false, note: "Force Relock restarts app in lockdown with Client Unlock, or quits lockdown mode when Client Unlock code is blank"

  loadLogFiles: type: Types.Boolean , note: "Load Log Files will upload five days of app activity."
  debugString: type:  Types.Text, default: '', note: "modules in iOS app to monitor in the log files - Possible values: 'TIhandler,app,logon,hand,state,sensor,statistics,capture-log,network,uploader,sanity,view,admin,intro' "

  lastSession:
    type: Types.Relationship
    ref: 'Session'

Handhelds.defaultColumns = 'platformUUID, clinician,clientUnlock,clientUnlockOK,testID'
Handhelds.register()
