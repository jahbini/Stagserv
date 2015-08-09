keystone = require('keystone')
Trajectory = keystone.list('Trajectory')
winston = require('winston');
require('winston-loggly');
 
winston.add winston.transports.Loggly, 
    token: "9f7aaef2-588b-46e9-ab0e-7b1dabc9da01"
    subdomain: "bamboocando"
    tags: ["Winston-NodeJS"]
    json:true

winston.log('info',"Retrotope Server Started");

if window? then base= window
if module?.exports? then base = module

base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  t = new (Trajectory.model)(req.body)
  loggingData = new (Trajectory.model)(req.body)
  loggingData.readings
  t.readings = JSON.stringify(req.body.readings)
  t.save (err) ->
    if err
      console.error err
      res.status 500
        .send error: err
    else
      console.log 'Data Trajectory added ' + ' to the database.'
      t.readings = "http://sensor.retrotope.com/trajectory/"+t.id
      winston.log('info',t)
      res.status 200
        .send message: "OK"
    return
  return
