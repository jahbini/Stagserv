keystone = require('keystone')
Types = keystone.Field.Types
Clinic = new (keystone.List)('Clinic', {})
Clinic.add
  name: type: Types.Text
  location:
    type: Types.Key
    required: true
    index: true
    initial: false
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
