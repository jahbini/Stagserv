###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
Trajectory = keystone.list('Trajectory')
User = keystone.list 'User'
Clinic = keystone.list 'Clinic'

winston = keystone.get 'winston'

env =  keystone.get 'env'

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  clinic = clinician = client = false
  # bodyCheck is invoked async fashion as the clinics, clinicians, and clients
  # are found and bound to the saved trajectory
  # when all three are found, the trajecotyr summary is sent off to Loggly via winston
  bodyCheck = (body)->
    summary = {}
    return unless clinician
    return unless client
    return unless clinic
    summary.clinic = clinic.name
    summary.client = client.first+" "+client.last
    summary.clinician = clinician.first+" "+clinician.last
    if env == 'production'
      summary.readings = "http://sensor.retrotope.com/keystone/trajectory/"+body.id
    else
      summary.readings = "http://DEVELOPMENT.ONLY/keystone/trajectory/"+body.id
    summary.testID = body.testID
    summary.platformUUID = body.platformUUID
    summary.platformIosVersion = body.platformIosVersion
    summary.captureDate = body.captureDate

    console.log summary
    winston.log('info',summary, "Trajectory upload")
    return

  view = new (keystone.View)(req, res)
  req.body.clinic = req.body.clinic._id if req.body.clinic?._id
  req.body.readings = JSON.stringify(req.body.readings)
  whichId = req.body._id || new Trajectory.model()._id.toString()
  delete req.body._id
  console.log "Which id= ",whichId
  console.log req.body
  debugger
  Trajectory.model.findByIdAndUpdate whichId,
    {$set: req.body},
    {new: true, upsert: true,setDefaultsOnInsert:true},
    (err,t)->
      if err
        console.error err
        res.status 500
          .send error: err
      else
        User.model.findById(t.client).exec (err,u)->
          if err
            console.error err
            return
          client =u.name
          bodyCheck t
          return
        User.model.findById(t.clinician).exec (err,u)->
          if err
            console.error err
            return
          clinician = u.name
          bodyCheck t
          return
        Clinic.model.findById(t.clinic).exec (err,u)->
          if err
            console.error err
            return
          clinic = u
          bodyCheck t
          return
        console.log 'Data Trajectory updated ' + t._id + ' to the database.'
        res.status 200
          .send message: "OK", _id:t._id
      return
  return
