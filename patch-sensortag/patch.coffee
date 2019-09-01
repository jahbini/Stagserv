#
#
#
fs = require 'fs'
match =  'Retrotope,HARRY (L),PCB 1.2/1.3,'
substitute = 'Retrotope,jimbo (l),PCB 1.2/1.3,'

startByte=32272
LeftRightByte=startByte+98
gather = (data)->
  strings=[]
  capture=''
  for i in [startByte...startByte+32]
    capture += if data[i] 
        String.fromCharCode data[i]
      else
        ','
  return capture

modify = (data)->
  for i in [startByte...startByte+32]
    if data[i]
      data[i] = substitute[i-startByte].charCodeAt()

muckFile = (req,res)->
  substitute = req.url
  patch = substitute.match /\/(\w{5})-(\w)(.bin)?$/
  console.log substitute, patch
  unless patch
    res.writeHead 500, 'Content-Type': "text/plain"
    res.write "Forbidden - /12345/L"
    res.end()
    return
  substitute = "Retrotope,#{patch[1]} (#{patch[2]}),PCB 1.2/1.3,"
  
  fs.readFile 'sensorTag-gold.bin', (err, data)->
    exports.data=data
    if err
      console.log 'No bin file found'
      exports.data = 'None'
      return

    strings = gather data
    console.log strings

    if strings == match
      console.log "Write Phase"

    modify data
    console.log "BEFORE",String.fromCharCode data[LeftRightByte]
    data[LeftRightByte] = patch[2].charCodeAt()
    console.log "AFTER",String.fromCharCode data[LeftRightByte]
    
    result = gather data
    console.log result
    fs.writeFile 'sensorTag-mod.bin',data,(err)->
      console.log "error?",err
    res.writeHead 200, 'Content-Type': 'application/binary', 'Content-Disposition':"filename=RetrotopeTag-#{patch[1]}-#{patch[2]}.bin"
    res.write data
    res.end()
    return
http = require 'http'
http.createServer(muckFile).listen 3035



