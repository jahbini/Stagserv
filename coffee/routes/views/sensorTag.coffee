# vim: et:ts=2:sw=2:sts=2:tw=0
keystone = require('keystone')
SensorTag = keystone.list('SensorTag')

if window? then base= window
if module?.exports? then base = module

first = [
      "Red", "Green", "Blue", "Grey"
      "Happy", "Hungry", "Sleepy", "Healthy"
      "Easy", "Hard", "Quiet", "Loud"
      "Round", "Pointed", "Wavy", "Furry"
      ]
second = [
      "Justice", "Wisdom", "Equality", "Harmony"
      "Lamp", "Table", "Desk", "Couch"
      "Palace", "Shack", "House", "Cave"
      "Bamboo", "Lettuce", "Broccoli", "Raisin"
    ]

verbose = (s) ->
  hash = 0
  if s.length == 0 then return hash
  `for (i = 0, l = s.length; i < l; i++) {
        char = s.charCodeAt(i)
        hash = ((hash << 5) - hash) + char
        hash |= 0 // Convert to 32bit integer
      }`
  return hash&255

hasher= (s) ->
    s.split("").reduce(
      (a,b)->
        a=((a<<5)-a)+b.charCodeAt(0)
        return a&255
      ,0)

namer= (hash) ->
    a=hash>>4&0xf
    b=hash & 0xf
    return first[a] + ' ' +second[b]
glib= (any)->
    namer hasher(any)

base.exports = (req, res) ->
  uuid = req.params.id
  view = new (keystone.View)(req, res)
  req.body.uuid = uuid
  req.body.nickname = glib uuid
  t = new (SensorTag.model)(req.body)
  console.log "accessing SensorTag info"
  console.log req.params
  console.log t
  SensorTag.model.find().where('uuid', uuid).exec (err, tagInfo) ->
    if !tagInfo[0]
      err = "not found"
      tagInfo = null
    else
      tagInfo = tagInfo[0]
    console.log "search results"
    console.log err
    console.log tagInfo
    console.log "--------------"
    if err
      console.log "no old, inserting " + uuid
      console.log err
      t.save (error)->
        if error
          console.log "error saving accessing SensorTag info"
          console.error error
          console.log "sending error --------------"
          res.status 500
          .send error: error
        else
          console.log 'sensorTag added ' + ' to the database.'
          t._id = t.uuid
          console.log t
          res.status 200
          .send t
          console.log 'SensorTag info'
        return
    else
      console.log 'SensorTag reply'
      try
        tagInfo._id = tagInfo.uuid
      catch huh
        console.log "Bad uuid??"
      console.log tagInfo
      console.log 'SensorTag info'
      res.status 200
      .send(tagInfo)
      return
  return
