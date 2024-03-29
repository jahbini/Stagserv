// Generated by CoffeeScript 1.12.7

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var HandheldLog, Types, keystone;

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

  HandheldLog = new keystone.List('HandheldLogs', {
    nocreate: true
  });

  HandheldLog.add({
    name: {
      type: Types.Text,
      index: true,
      unique: true,
      noedit: true
    },
    handheld: {
      type: Types.Relationship,
      ref: 'Handheld'
    },
    contents: {
      type: Types.Textarea
    }
  });

  HandheldLog.defaultColumns = 'name,handheld';

  HandheldLog.register();

}).call(this);
