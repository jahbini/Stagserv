###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
Event = keystone.list('Event')
env =  keystone.get 'env'

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->

  view = new (keystone.View)(req, res)
  console.log req.body
  whichId = req.body._id || new Event.model()._id.toString()
  delete req.body._id
  console.log "Which id= ",whichId
  console.log "NEW EVENT ",req.params
  Event.model.findByIdAndUpdate(
    whichId,
    {$set: req.body}
    {new: true, upsert: true,setDefaultsOnInsert:true},
    (err, t) ->
      if err
        console.log err
        return
      else
        console.log 'Event added ' + t._id + ' to the database.'
        res.status 200
          .send message: "OK", _id:t._id
        return
    ).populate('trajectory').exec()
  return
