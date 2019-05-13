###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
Handheld = keystone.list('Handheld')

env =  keystone.get 'env'

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  platformUUID = req.params.id || req.body.platformUUID

  view = new (keystone.View)(req, res)
  query = platformUUID: platformUUID
  #whichId = req.body._id 
  console.log "Put HANDHELD Which id= ",query
  console.log req.body
  delete req.body._id
  Handheld.model.findOneAndUpdate query,
    req.body,
    {new: true, upsert: true,setDefaultsOnInsert:true},
    (err,t)->
      if err
        console.error err
        res.status 500
          .send error: err
      else
        console.log 'Data Handheld updated ' + t._id + ' to the database.'
        console.log 'body',req.body
        console.log 'result',t
        delete t._id
        res.status 200
          .send t
      return
  return
