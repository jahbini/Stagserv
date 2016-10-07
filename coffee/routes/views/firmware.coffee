keystone = require('keystone')

if window? then base= window
if module?.exports? then base = module


base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  sensorTagId = req.id
  sensorTagVersion = req.version
  ###
  if the existing input version is less thatn the current version number, we
  return a struct that describes the url of a needed firmware update
  If the existing version is not to be updated (maybe harry wants an old one
  for testing purposes)
  then we just reply with an OK response instead of an Url
  ###

  view.return message: "OK"
  return
