// Generated by CoffeeScript 1.9.1

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Protocol, Types, keystone;

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

  Protocol = new keystone.List('Protocol', {
    nocreate: false,
    nodelete: false
  });

  Protocol.add({
    name: {
      type: Types.Text,
      required: true,
      index: true,
      unique: true,
      "default": "Other"
    },
    comments: {
      type: Types.Text
    }
  });

  Protocol.defaultColumns = 'name, comments';

  Protocol.register();

}).call(this);
