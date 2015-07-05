keystone = require('keystone')
Types = keystone.Field.Types
Clinic = new (keystone.List)('Clinic', {})
Clinic.add
  location:
    type: Types.Key
    required: true
    index: true
    initial: false
  name: type: Types.Text
  clinicians:
    type: Types.Relationship
    ref: 'User'
    many: true
    filters: patientOnly: false
  clients:
    type: Types.Relationship
    ref: 'User'
    many: true
    filters: patientOnly: true
Clinic.register()
