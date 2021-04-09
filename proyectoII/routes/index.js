var express = require('express');
var router = express.Router();
let indexController = require ('../controllers/indexController');

router.get ('/', indexController.index);
router.get ('/login', indexController.login);
router.get ('/register', indexController.register);
router.get ('/product', indexController.product);
router.get ('/search', indexController.search);
router.get ('/profile', indexController.profile);


/* GET home page. */


module.exports = router;
