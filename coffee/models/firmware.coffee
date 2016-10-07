###
# vim: et:ts=2:sw=2:sts=2
###

keystone = require('keystone')
Types = keystone.Field.Types
FirmwareVersion = new (keystone.List) 'FirmwareVersion',
FirmwareVersion.add
  revision:
    type: Types.Text
    required: true
    index: true
    initial: true
  url: type: Types.Text
FirmwareVersion.register()
