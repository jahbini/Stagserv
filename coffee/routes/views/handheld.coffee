###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
Handheld = keystone.list('Handheld')

env =  keystone.get 'env'

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->

  view = new (keystone.View)(req, res)
  whichId = req.body._id 
  console.log "Put/Post HANDHELD Which id= ",whichId
  console.log req.body
  debugger
  Handheld.model.findByIdAndUpdate whichId,
    {$set: req.body},
    {new: true, upsert: true,setDefaultsOnInsert:true},
    (err,t)->
      if err
        console.error err
        res.status 500
          .send error: err
      else
        console.log 'Data Handheld updated ' + t._id + ' to the database.'
        res.status 200
          .send t
      return
  return
