var keystone = require('keystone'),
    User = keystone.list('User');
 
exports = module.exports = function(done) {
    
    new User.model({
        name: { first: 'Harry', last: 'Saal' },
        email: 'harry@saal.org',
        password: 'Sniffer',
        canAccessKeystone: true
    }).save(done);
    
};
