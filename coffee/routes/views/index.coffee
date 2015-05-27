keystone = require('keystone')

if window? then base= window
if module?.exports? then base = module


base.exports = (req, res) ->
  view = new (keystone.View)(req, res)
  view.render 'index'
  return
