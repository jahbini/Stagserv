_ = require('underscore')
keystone = require('keystone')
path=require 'path'
fs = require('fs')

###
    Initialises the standard view locals.
    Include anything that should be initialised before route controllers are executed.

        if window? then exports= window.exports
        if module?.exports? then exports = module.exports
###

if window? then exports= window.exports
if module?.exports? then exports = module.exports

exports.initLocals = (req, res, next) ->
  locals = res.locals
  locals.user = req.user
  # Add your own local variables here
  if req.body?.path
    try
      fullpath= process.cwd()+'/sessions/'+req.body.path
      dir = path.dirname fullpath
      fs.mkdirSync dir,recursive:true, ()->
      fs.writeFile fullpath, JSON.stringify(req.body),()->
    catch e
      console.log e
  next()
  return

###
Inits the error handler functions into `req`
###

exports.initErrorHandlers = (req, res, next) ->

  res.err = (err, title, message) ->
    res.status(500).render 'errors/500',
      err: err
      errorTitle: title
      errorMsg: message
    return

  res.notfound = (title, message) ->
    res.status(404).render 'errors/404',
      errorTitle: title
      errorMsg: message
    return

  next()
  return

###
Fetches and clears the flashMessages before a view is rendered
###

exports.flashMessages = (req, res, next) ->
  flashMessages = 
    info: req.flash('info')
    success: req.flash('success')
    warning: req.flash('warning')
    error: req.flash('error')
  res.locals.messages = if _.any(flashMessages, ((msgs) ->
    msgs.length
  )) then flashMessages else false
  next()
  return
