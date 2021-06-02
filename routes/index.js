var express = require('express');
var router = express.Router();
let indexController = require ('../controllers/indexController');

router.get ('/', indexController.index);

router.get ('/product/:id', indexController.product);

router.get ('/search-results', indexController.search);

   // router.get('/buscar',indexController.listar);

router.get ('/profile/:id', indexController.profile);

router.get ('/profile-edit', indexController.profiledit);

router.get ('/allProducts', indexController.allProducts);

//router.get('/modificar', indexController.modificarForm);

//router.get('/modificar', indexController.modificarProducto);

//router.get('/borrar', indexController.borrarProducto);


router.get ('/add', indexController.productadd);
    router.post('/add',indexController.crear);
    

router.get ('/login', indexController.login);
router.post('/login', indexController.loginUsuario);

router.get ('/register', indexController.register);
router.post('/register', indexController.crearUsuario);

router.get('/logout', indexController.logout);





/* GET home page. */


module.exports = router;
