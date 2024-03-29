# vim: et:ts=2:sw=2:sts=2:nowrap
keystone = require('keystone')
Session = keystone.list('Session')
_ = require('underscore')

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  Session.model.findById(req.params.id).exec (err, session) ->
    if err
      console.log 'Session fail on model queried'
      console.log req.params
      console.log err
      res.status 404
      res.send 'not found'
      return
    else
      console.log "session Found as",session
      n= Object.assign {},session._doc
      console.log "session as n",n
      delete n._id
      n.readings = ""
      n.events = []
      delete n.captureDate
      newSession = new Session.model n
      newSession.save (err,newlyFormed)->
        if err
          res.status 400
        console.log  "newsession",newlyFormed
        res.send newlyFormed
      return
  return
