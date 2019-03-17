###
# vim: et:ts=2:sw=2:sts=2
###

keystone = require('keystone')
User = keystone.list('User')
exports =
module.exports = (done) ->
  new (User.model)(
    name:
      first: 'Jim'
      last: 'Programmer'
    email: 'jim@bamboocando.com'
    password: 'Tqbfj0tlD'
    canAccessKeystone: true).save done
  return
