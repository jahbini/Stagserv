keystone = require('keystone')
Trajectory = keystone.list('Trajectory')

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  t = new (Trajectory.model)(req.body)
  t.readings = JSON.stringify(req.body.readings)
  t.save (err) ->
    if err
      console.error err
      res.status 500
        .send error: err
    else
      console.log 'Data Trajectory added ' + ' to the database.'
      res.status 200
        .send message: "OK"
    return
  return
