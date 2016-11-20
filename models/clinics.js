// Generated by CoffeeScript 1.11.1

/*
 * vim: et:ts=2:sw=2:sts=2
 */

(function() {
  var Clinic, Types, keystone;

  keystone = require('keystone');

  Types = keystone.Field.Types;

  Clinic = new keystone.List('Clinic', {
    drilldown: "clinicians clients"
  });

  Clinic.add({
    location: {
      type: Types.Key,
      required: true,
      index: true,
      initial: true
    },
    name: {
      type: Types.Text
    },
    clinicians: {
      type: Types.Relationship,
      ref: 'User',
      many: true,
      filters: {
        patientOnly: false
      }
    },
    clients: {
      type: Types.Relationship,
      ref: 'User',
      many: true,
      filters: {
        patientOnly: true
      }
    }
  });

  Clinic.register();

}).call(this);
