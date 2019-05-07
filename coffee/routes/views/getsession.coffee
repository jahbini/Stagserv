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
      return
    else
      res.send session
      return
  return
