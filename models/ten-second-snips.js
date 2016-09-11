// Generated by CoffeeScript 1.10.0

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Event, Types, keystone;

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

  Event = new keystone.List('Event', {
    drilldown: "trajectory",
    plural: "Events"
  });

  Event.add({
    captureDate: {
      type: Types.Datetime,
      format: 'YYYY-MM-DD hh:mm:ss a',
      index: true
    },
    readings: {
      type: Types.Text
    },
    sensorUUID: {
      type: Types.Text
    },
    trajectory: {
      type: Types.Relationship,
      ref: 'Trajectory'
    }
  });

  Event.relationship({
    path: 'trajectory',
    ref: 'Trajectory',
    refPath: 'Events'
  });

  Event.defaultColumns = 'captureDate, clinician, client, testID';

  Event.register();

}).call(this);
