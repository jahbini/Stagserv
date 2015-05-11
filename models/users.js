/*
# vim: et:ts=2:sw=2:sts=2
*/
var keystone = require('keystone'),
    Types = keystone.Field.Types;
 
var User = new keystone.List('User');
 
User.add({
    name: { type: Types.Name, required: true, index: true },
    email: { type: Types.Email, initial: true, required: true, index: true },
    password: { type: Types.Password, initial: true },
    patientOnly: {type: Boolean, initial: false},
    canAccessKeystone: { type: Boolean, initial: true },
    clinic: {type: Types.Relationship, ref: 'Clinic', many: true }
});
User.relationship({path:'clinic',ref:'Clinic', refPath:'location'});  */
User.register();
