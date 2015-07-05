# vim: et:ts=2:sw=2:sts=2:nowrap
keystone = require('keystone')
Protocols = keystone.list('Protocol')
_ = require('underscore')

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  Protocols.model.find().exec (err, protocols) ->
    if err
      console.log err
      return
    else
      res.send(protocols)
      return
  console.log 'Protocol model queried'
  return
