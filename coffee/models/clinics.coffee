keystone = require('keystone')
Types = keystone.Field.Types
Clinic = new (keystone.List) 'Clinic', 
   drilldown: "clinicians clients" 
Clinic.add
  name: type: Types.Text
  location:
    type: Types.Key
    required: true
    index: true
    initial: true
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
