###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
Session = keystone.list('Session')
User = keystone.list 'User'
Clinic = keystone.list 'Clinic'

winston = keystone.get 'winston'

env =  keystone.get 'env'

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  clinic = clinician = client = false
  # bodyCheck is invoked async fashion as the clinics, clinicians, and clients
  # are found and bound to the saved Session
  # when all three are found, the trajecotyr summary is sent off to Loggly via winston
  bodyCheck = (body)->
    summary = {}
    return unless clinician
    return unless client
    return unless clinic
    summary.clinic = clinic.name
    summary.client = client.first+" "+client.last
    summary.clinician = clinician.first+" "+clinician.last
    req.hostname
    if env == 'production'
      summary.readings = "http://#{req.hostname}/keystone/Session/"+body.id
      console.log "Session URL",summary.readings
    else
      summary.readings = "http://DEVELOPMENT.ONLY/keystone/Session/"+body.id
    summary.testID = body.testID
    summary.platformUUID = body.platformUUID
    summary.platformIosVersion = body.platformIosVersion
    summary.captureDate = body.captureDate
    summary.applicationVersion = body.applicationVersion

    completion = 'INCOMPLETE' if req.body.accepted == undefined
    completion = 'ACCEPTED' if req.body.accepted  == true
    completion = 'REJECTED' if req.body.accepted  == false
    winston.log('info',summary, "Session upload #{completion}")
    console.log('info',summary, "Session upload #{completion}")
    return

  view = new (keystone.View)(req, res)
  req.body.clinic = req.body.clinic._id if req.body.clinic?._id
  req.body.readings = JSON.stringify(req.body.readings)
  whichId = req.body._id || new Session.model()._id.toString()
  delete req.body._id
  Session.model.findByIdAndUpdate whichId,
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
        console.log 'Data Session updated ' + t._id + ' to the database.'
        res.status 200
          .send message: "OK", _id:t._id
      return
  return
