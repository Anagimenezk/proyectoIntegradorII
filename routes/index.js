var express = require('express');
var router = express.Router();

let indexController = require ('../controllers/indexController');

const multer = require ('multer');
const path = require ('path')

const multerRegister = multer.diskStorage({
    destination: (req, file, cb) => {
      let direccion = 'public/images/users';
      cb(null, direccion);
    },
    filename: (req, file, cb) => {
      let nombreArchivo = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, nombreArchivo);
    }
  });
  
  const upload = multer({  storage: multerRegister});

  const multerEdit = multer.diskStorage({
    destination: (req, file, cb) => {
      let direccion = 'public/images/users';
      cb(null, direccion);
    },
    filename: (req, file, cb) => {
      let nombreArchivo = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, nombreArchivo);
    }
  });

  const uploadEdit = multer({  storage: multerEdit});

  const multerAdd = multer.diskStorage({
    destination: (req, file, cb) => {
      let direccion = 'public/images/products';
      cb(null, direccion);
    },
    filename: (req, file, cb) => {
      let nombreArchivo = file.fieldname + '-' + Date.now() + path.extname(file.originalname);
      cb(null, nombreArchivo);
    }
  });

  const uploadAdd = multer({  storage: multerAdd});

router.get ('/', indexController.index);

router.get ('/product/:id', indexController.product);

router.get ('/search-results', indexController.search);

   // router.get('/buscar',indexController.listar);

router.get ('/profile/:id', indexController.profile);

router.get ('/profile-edit',upload.single('edit_image'), indexController.profiledit);

router.get ('/allProducts', indexController.allProducts);

//router.get('/modificar', indexController.modificarForm);

//router.get('/modificar', indexController.modificarProducto);

//router.get('/borrar', indexController.borrarProducto);


router.get ('/add', indexController.productadd);
    router.post('/add',uploadAdd.single('image'), indexController.crear);
    

router.get ('/login', indexController.login);
router.post('/login', indexController.loginUsuario);

router.get ('/register', indexController.register);
router.post('/register', uploadEdit.single('productImage') , indexController.crearUsuario);

router.get('/logout', indexController.logout);





/* GET home page. */


module.exports = router;
