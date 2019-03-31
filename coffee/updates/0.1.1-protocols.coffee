###
# vim: et:ts=2:sw=2:sts=2
###

listNeeded = 'Protocol'
rawData =  """
[{"id":"5c2d9426feb11b0729649081","name":"Complete Suite","fields":{"name":"Complete Suite","comments":"","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":15,"testDuration":30,"mileStonesAreProtocols":true,"cloneable":false,"suppressInDropDown":false,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"Left Tap,Right Tap,Stroop,SDMT","mileStones":"Finger Tapping Left,Finger Tapping Right,Stroop (matching),Stroop (mis-matching),Symbol Digit Modalities Test"}},{"id":"5c2f5f10feb11b07296490a6","name":"Default","fields":{"name":"Default","comments":"This protocol is selected by the app from a typo in the test suite milestones","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":10,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"The test does not exist -- bad suite specification for mile stones","mileStones":"😳,🤯"}},{"id":"5c2f6e54feb11b07296490b2","name":"Fail","fields":{"name":"Fail","comments":"This is a QA protocol suite that has a bad name in the milestones to check app error handling","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":1,"mileStonesAreProtocols":true,"cloneable":false,"suppressInDropDown":false,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"The test","mileStones":"the test"}},{"id":"5c447758d6911d44e083e368","name":"Fast Stroop","fields":{"name":"Fast Stroop","comments":"","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":3,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":true,"engine":"stroop","entropy":"low","demoOnly":false,"mileStoneText":"blue,red,yellow,tan,salmon","mileStones":"1,1"}},{"id":"5c447843d6911d44e083e36a","name":"Fast Suite","fields":{"name":"Fast Suite","comments":"both fast one and fast two","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":1,"mileStonesAreProtocols":true,"cloneable":true,"suppressInDropDown":false,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":true,"mileStoneText":"The Suite for sequencing","mileStones":"Fast One, Low Stroop ,   Fast Two"}},{"id":"5c4477d2d6911d44e083e369","name":"Fast Two","fields":{"name":"Fast Two","comments":"","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":3,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"Fast Two","mileStones":"2,2"}},{"id":"5be8ce43cf1d3500fd45e56c","name":"Finger Tapping Left","fields":{"name":"Finger Tapping Left","comments":"none","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":true,"practiceDuration":5,"testDuration":15,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"Tap each circle alternately as rapidly as possible. Use only the pointer finger of your left hand.","mileStones":"A,B"}},{"id":"5c1bd64665d31f4cde18cc5b","name":"Finger Tapping Right","fields":{"name":"Finger Tapping Right","comments":"none","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":true,"practiceDuration":5,"testDuration":15,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"Tap each circle alternately as rapidly as possible. Use only the pointer finger of your right hand.","mileStones":"A,B"}},{"id":"5a6f7d6449300000fdcc662e","name":"NoSensors","fields":{"name":"NoSensors","comments":"","sensorsNeeded":0,"showLeadIn":true,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":0,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":false,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"The test","mileStones":"action,complete"}},{"id":"5a6f7d4e49300000fdcc662d","name":"SingleSide","fields":{"name":"SingleSide","comments":"","sensorsNeeded":1,"showLeadIn":true,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":0,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":false,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"The test","mileStones":"action,complete"}},{"id":"5c62178b3f403c5af36e8ae7","name":"Stroop (matching)","fields":{"name":"Stroop (matching)","comments":"for QA, text word and color should match","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":true,"practiceDuration":10,"testDuration":30,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":false,"showMileStones":true,"engine":"stroop","entropy":"low","demoOnly":false,"mileStoneText":"Click the text that names the color being shown","mileStones":"red,blue:deepskyblue,green:springgreen,orange:coral,purple:darkviolet"}},{"id":"5c012c8af160077798b22e8d","name":"Stroop (mis-matching)","fields":{"name":"Stroop (mis-matching)","comments":"none","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":true,"practiceDuration":10,"testDuration":30,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":false,"showMileStones":true,"engine":"stroop","entropy":"medium","demoOnly":false,"mileStoneText":"Click the text that names the color being shown","mileStones":"red,blue:deepskyblue,green:springgreen,orange:coral,purple:darkviolet"}},{"id":"5bfe7de8f160077798b22bab","name":"Symbol Digit Modalities Test","fields":{"name":"Symbol Digit Modalities Test","comments":"none","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":true,"practiceDuration":15,"testDuration":30,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":false,"showMileStones":true,"engine":"sdmt","entropy":"high","demoOnly":false,"mileStoneText":"Press the number corresponding to the icon on the right","mileStones":"👠,🐰,⛵,❤️,☂️,🍔,🍄,🍩,🐔,🎹,⏰,🍒,🌼"}},{"id":"5a6f7d3b49300000fdcc662c","name":"T25FW","fields":{"name":"T25FW","comments":"","sensorsNeeded":2,"showLeadIn":true,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":0,"mileStonesAreProtocols":false,"cloneable":false,"suppressInDropDown":true,"showMileStones":false,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"The test","mileStones":"action,complete"}},{"id":"5c1bd49365d31f4cde18cc53","name":"Tapping Suite","fields":{"name":"Tapping Suite","comments":"","sensorsNeeded":0,"showLeadIn":false,"leadInDuration":5,"showPractice":false,"practiceDuration":5,"testDuration":1,"mileStonesAreProtocols":true,"cloneable":false,"suppressInDropDown":false,"showMileStones":true,"engine":"tapping","entropy":"medium","demoOnly":false,"mileStoneText":"Tap With Your Left Finger, Tap With Your Right Finger","mileStones":"Finger Tapping Left,   Finger Tapping Right"}}]
"""
keystone = require('keystone')
console.log allData = JSON.parse rawData
KeystoneList = keystone.list(listNeeded)

exports =
module.exports = (done) ->
  for dataObject in allData
    f=dataObject.fields
    f.id=dataObject.id
    f._id=dataObject.id
    (new KeystoneList.model f).save()
  done()
  return
