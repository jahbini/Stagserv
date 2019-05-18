// Generated by CoffeeScript 1.12.7

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Handhelds, Types, keystone;

  keystone = require('keystone');

  Types = keystone.Field.Types;


  /*
  var Sample = new keystone.List('Sample');
  
  Sample.add ({
      source:{type:Types.Text},
      x:{type:Types.Number},
      y:{type:Types.Number},
      z:{type:Types.Number},
      collected:{type:Types.Datetime,default:Date.now}
  });
  Sample.register();
   */

  Handhelds = new keystone.List('Handheld', {
    nocreate: false,
    nodelete: false,
    versionKey: false
  });

  Handhelds.add({
    platformUUID: {
      type: Types.Text,
      noedit: true,
      index: true,
      unique: true
    },
    nickname: {
      type: Types.Text,
      noedit: true,
      index: true
    },
    platformIosVersion: Types.Text,
    applicationVersion: Types.Text,
    clinic: {
      type: Types.Relationship,
      ref: 'Clinic'
    },
    clinician: {
      type: Types.Relationship,
      ref: 'User'
    },
    client: {
      type: Types.Relationship,
      ref: 'User'
    },
    testID: {
      type: Types.Text
    },
    password: {
      type: Types.Text
    },
    clientUnlock: {
      type: Types.Text
    },
    clientUnlockOK: {
      type: Types.Boolean,
      "default": false
    },
    lastSession: {
      type: Types.Relationship,
      ref: 'Session'
    }
  });

  Handhelds.defaultColumns = 'platformUUID, clinician,clientUnlock,clientUnlockOK,testID';

  Handhelds.register();

}).call(this);