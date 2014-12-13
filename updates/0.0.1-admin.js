var keystone = require('keystone'),
    User = keystone.list('User');
 
exports = module.exports = function(done) {
    
    new User.model({
        name: { first: 'Admin', last: 'User' },
        email: 'jim@bamboocando.com',
        password: 'Tqbfj0tlD',
        canAccessKeystone: true
    }).save(done);
    
};