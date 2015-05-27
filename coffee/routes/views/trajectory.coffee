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
      view.render 'index'
    else
      console.log 'Data Trajectory added ' + ' to the database.'
      view.render 'index'
    return
  return
