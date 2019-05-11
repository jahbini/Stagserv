# vim: et:ts=2:sw=2:sts=2:nowrap
keystone = require('keystone')
Handheld = keystone.list('Handheld')
_ = require('underscore')

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  platformUUID = req.params.id || req.body.platformUUID
  view = new (keystone.View)(req, res)
  console.log "accessing getHandheld info for #{platformUUID}"
  console.log req.params
  t = new (Handheld.model)(req.body)
  console.log "T=",t
  req.body.platformUUID = platformUUID
  req.body.nickname = glib platformUUID
  Handheld.model.find().where('platformUUID', platformUUID).exec (err, tagInfo) ->
    if !tagInfo[0]
      err = "Handheld info not found"
      tagInfo = null
    else
      tagInfo = tagInfo[0]
    console.log "Handheld search results"
    console.log err
    console.log tagInfo
    console.log "------Handheld--------"
    if err
      console.log "Handheld no old, inserting " + platformUUID
      console.log err
      t.save (error)->
        if error
          console.log "error saving accessing Handheld info"
          console.error error
          console.log "Handheld sending error --------------"
          res.status 500
          .send error: error
        else
          console.log 'new Handheld added ' + ' to the database.'
          console.log t
          res.status 200
          .send t
          #console.log 'Handheld info'
        return
    else
      #console.log 'Handheld reply'
      #console.log tagInfo
      #console.log 'Handheld info'
      res.status 200
      .send(tagInfo)
      return
  return

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

