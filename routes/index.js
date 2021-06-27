var express = require('express');
var router = express.Router();

let indexController = require('../controllers/indexController');

const multer = require('multer');
const path = require('path')



router.get('/', indexController.index);

router.get('/product/:id', indexController.product);
router.post('/product/:id', indexController.crearComentario);

router.get('/search-results', indexController.search);

// router.get('/buscar',indexController.listar);

const multerUser = multer.diskStorage({
  destination: (req, file, cb) => {
    let direccion = 'public/images/users';
    cb(null, direccion);
  },
  filename: (req, file, cb) => {
    let nombreArchivo = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
    cb(null, nombreArchivo);
  }
});

const uploadUser = multer({
  storage: multerUser
});

router.get('/profile/:id', indexController.profile);

router.get('/profile-edit', indexController.profiledit);

router.post('/profile-edit', uploadUser.single('edit-image'), indexController.modificarUsuario);

router.get('/allProducts', indexController.allProducts);

const multerProduct = multer.diskStorage({
  destination: (req, file, cb) => {
    let direccion = 'public/images/products';
    cb(null, direccion);
  },
  filename: (req, file, cb) => {
    let nombreArchivo = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
    cb(null, nombreArchivo);
  }
});

const uploadProduct = multer({
  storage: multerProduct
});

router.get('/modificar/:id', indexController.modificarForm);

router.post('/modificar', uploadProduct.single('productModif'), indexController.modificarProducto);
//falta agregar multer

router.post('/borrar', indexController.borrarProducto);

router.post('/borrarComentario', indexController.borrarComentario);


router.get('/add', indexController.productadd);
router.post('/add', uploadProduct.single('productImage'), indexController.crear);


router.get('/login', indexController.login);
router.post('/login', indexController.loginUsuario);


router.get('/register', indexController.register);
router.post('/register', uploadUser.single('image'), indexController.crearUsuario);

router.get('/logout', indexController.logout);






/* GET home page. */


module.exports = router;