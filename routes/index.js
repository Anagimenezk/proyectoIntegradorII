var express = require('express');
var router = express.Router();
let indexController = require ('../controllers/indexController');

router.get ('/', indexController.index);

router.get ('/product/:id', indexController.product);

router.get ('/search-results', indexController.search);

router.get ('/profile', indexController.profile);

router.get ('/profile-edit', indexController.profiledit);

router.get ('/add', indexController.productadd);

router.get ('/allProducts/:id', indexController.allProducts);

router.get ('/login', indexController.login);
//router.post('/login', controller.loginValidate);

router.get ('/register', indexController.register);
//router.post('/register', controller.registerCreateUser);

//router.get('/logout', controller.logout);





/* GET home page. */


module.exports = router;
