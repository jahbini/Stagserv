# vim: et:ts=2:sw=2:sts=2:nowrap
keystone = require('keystone')
UnitConfigs = keystone.list('UnitConfig')
_ = require('underscore')

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  UnitConfigs.model.find().exec (err, configs) ->
    if err
      console.log err
      return
    else
      res.send(configs)
      return
  return
