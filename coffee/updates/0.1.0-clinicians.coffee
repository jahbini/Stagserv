###
# vim: et:ts=2:sw=2:sts=2
###

keystone = require('keystone')
Florida = null
Done = null
User = keystone.list('User')
Clinic = keystone.list('Clinic')
Clinic.relationship
  path: 'clients'
  ref: 'User'
  refPath: 'clients'
Clinic.relationship
  path: 'clinicians'
  ref: 'User'
  refPath: 'clinicians'

responder = (done, florida) ->
  `var i`
  `var i`
  `var l`
  allClinicians = []
  allClients = []
  i = 1
  while i < 9
    allClients.push new (User.model)(
      patientOnly: true
      password: 'Y'
      clinic: florida
      email: 'client' + i.toString() + florida.get('location') + '@kegare.org'
      name:
        first: 'Client '
        last: i.toString())
    i++
  allClients.push new (User.model)(
    patientOnly: true
    password: 'Y'
    clinic: florida
    email: 'client' + '-Other' + florida.get('location') + '@kegare.org'
    name:
      first: 'Other'
      last: '')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Tracy' + 'Jones' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Tracy'
      last: 'Jones, ARNP')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Israt' + 'Jahan' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Israt'
      last: 'Jahan, MD')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Jessica' + 'Shaw' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Jessica'
      last: ' Shaw, MPH')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Kevin' + 'Allison' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Kevin'
      last: 'Allison, BS')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Mary' + 'Freeman' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Mary'
      last: 'Freeman, LPN')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Tanya' + 'Aranca' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Tanya'
      last: 'Aranca, BS')
  allClinicians.push new (User.model)(
    patientOnly: false
    password: 'Y'
    clinic: florida
    email: 'Other' + 'Clinician' + '-' + florida.get('location') + '@kegare.org'
    name:
      first: 'Other'
      last: '')
  i = 0
  l = allClinicians.length
  while i < l
    allClinicians[i].save()
    i++
  i = 0
  l = allClients.length
  while i < l
    allClients[i].save()
    i++
  florida.set 'clinicians', allClinicians
  florida.set 'clients', allClients
  console.log allClients
  florida.save()
  done()

Clinic.model.find().where('location', 'Florida').exec (err, posts) ->
  if !err
    Florida = posts[0]
    if Done
      responder Done, Florida
  return
console.log Florida
exports =
module.exports = (done) ->
  Done = done
  if Florida
    responder done, Florida
  return
