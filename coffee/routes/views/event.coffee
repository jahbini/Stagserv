###
# vim: et:ts=2:sw=2:sts=2
###
keystone = require('keystone')
Event = keystone.list('Event')
Session = keystone.list 'Session'
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
  # force event data into string form for download parser assist
  req.body.readings = '"' + req.body.readings + '"'
  Event.model.findByIdAndUpdate(
    whichId,
    {$set: req.body}
    {new: true, upsert: true,setDefaultsOnInsert:true},
    (err, t) ->
      if err
        console.log err
        return
      else
        session = Session.model.findByIdAndUpdate(
          t.session,
          {$push: {events:t._id}},
          (err,session)->
            console.log "Session update (#{err}) -"
          )

        console.log 'Event added ' + t._id + ' to the database.'
        res.status 200
          .send message: "OK", _id:t._id
        return
    )
  return
