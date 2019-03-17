###
# vim: et:ts=2:sw=2:sts=2
###

listNeeded = 'UnitConfig'
rawData =  """
[{"id":"5c5e10001138467f688e6e0e","name":"5c5e10001138467f688e6e0e","fields":{"id":"5c5e10001138467f688e6e0e","loginPassword":"retro2019","unlock":"6180339"}}]
"""
keystone = require('keystone')
console.log allData = JSON.parse rawData
KeystoneList = keystone.list(listNeeded)

exports =
module.exports = (done) ->
  for dataObject in allData
    f=dataObject.fields
    f.id=dataObject.id
    (new KeystoneList.model f).save()
  done()
  return
