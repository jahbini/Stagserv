var keystone = require('keystone'), 
    Trajectory = keystone.list('Trajectory');
 
exports = module.exports = function(req, res) {
    
    var view = new keystone.View(req, res);
    var t = new Trajectory.model( req.body);
   /* 
    t.readings = JSON.stringify(req.body.readings);
    */
    t.save(function(err){
          if (err) {
          console.error(err);
          view.render('index');
        } else {
          console.log("Data Trajectory added " + " to the database.");
            view.render('index');
        }
    });
    
}
