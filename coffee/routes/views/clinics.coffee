keystone = require('keystone')
Clinics = keystone.list('Clinic')
_ = require('underscore')

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  Clinics.model.find().exec (err, clinics) ->
    if err
      console.log err
      return
    else
      _.each clinics, (what) ->
        console.log what
        console.log '--------------'
        return
      return
  console.log 'Clinic model queried'
  return
