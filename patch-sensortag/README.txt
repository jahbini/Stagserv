#
Patch Retrotope v92R flash images to update serialnumber and L/R function of the sensorTags for
Retrotope clinical protocol.

Start the server with 
$coffee ./patch.coffee

It will listen on localost-- the nginx router is set to relay URL '/patch/xxxxx-D' to the patcher
and it will place the xxxxx in the serial number field, and the D in the Left/Right attribute.

Note the patcher will accept any values for these serial number and D fields.  However note that the D needs to be [LlRr] for the iPad application to recognize it for the protoocol.


