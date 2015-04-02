var keystone = require('keystone'),
    Types = keystone.Field.Types;
/*
var Sample = new keystone.List('Sample');

Sample.add ({
    source:{type:Types.Text},
    x:{type:Types.Number},
    y:{type:Types.Number},
    z:{type:Types.Number},
    collected:{type:Types.Datetime,default:Date.now}
});
Sample.register();
*/
var Trajectory = new keystone.List('Trajectory');
    Trajectory.add({
        captureDate: {type: Types.Datetime,default:Date.now,index:true},
        readings:{type:Types.Text},
        user:{type:Types.Text},
        hostUrl:{type:Types.Text},
        password:{type:Types.Text},
        patientID:{type:Types.Text},
        testID:{type:Types.Text},
        deviceUUID:{type:Types.Text},
        platformUUID:{type:Types.Text}
        /*
        readings:{type:Types.Code,lang:"js"}
        readings:{type:Types.Relationship, ref:'Sample',many:true}
        */
    });
        
Trajectory.register();
