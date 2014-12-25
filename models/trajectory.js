var keystone = require('keystone'),
    Types = keystone.Field.Types;
var Vector = new keystone.Field('Vector');

Vector.add ({
    x:{type:Types.Number},
    y:{type:Types.Number},
    z:{type:Types.Number},
    collected:{type:Types.Datetime,default:Date.now}
});
var Gyro = new keystone.List('Gyro');
    Gyro.add({type:Vector});
    Gyro.register();
    
var Accel = new keystone.List('Accel');
    Accel.add({type:Vector});
    Accel.register();
    
var Compass = new keystone.List('Compass');
    Compass.add({type:Vector});
    Compass.register();

var Trajectory new keystone.List('Trajectory');
 
Trajectory.add({
    RunId: {type: Types.String, required:true,index:true},
    Wobbles: { type: Types.Relationship, ref: Gyro, many:true  },
    Directions: { type: Types.Relationship, ref: Compass, many:true  },
    Jerks: { type: Types.Relationship, ref: Accel, many:true  },
});

Trajectory.register();