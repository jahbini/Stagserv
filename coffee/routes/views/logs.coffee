###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
HandheldLogs = keystone.list('HandheldLogs')

env =  keystone.get 'env'

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  name = req.params.id || req.body.name

  view = new (keystone.View)(req, res)
  query = name: name
  #whichId = req.body._id 
  delete req.body._id
  HandheldLogs.model.findOneAndUpdate query,
    req.body,
    {new: true, upsert: true,setDefaultsOnInsert:true},
    (err,t)->
      if err
        console.error err
        res.status 500
          .send error: err
      else
        console.log 'Logfile  updated ' + t.name + ' to the database.'
        res.status 200
          .send t
      return
  return
