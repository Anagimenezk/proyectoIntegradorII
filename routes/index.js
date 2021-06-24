var express = require('express');
var router = express.Router();

let indexController = require ('../controllers/indexController');

const multer = require ('multer');
const path = require ('path')



router.get ('/', indexController.index);

router.get ('/product/:id', indexController.product);
router.post ('/comentario',indexController.crearComentario);

router.get ('/search-results', indexController.search);

   // router.get('/buscar',indexController.listar);

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

router.get ('/profile/:id', indexController.profile);

router.get ('/profile-edit', indexController.profiledit);
  router.post('/profile-edit',uploadEdit.single('edit_image'), indexController.modificarUsuario);

router.get ('/allProducts', indexController.allProducts);

router.get('/modificar', indexController.modificarForm);

router.post('/modificar', indexController.modificarProducto);
//falta agregar multer

router.post('/borrar', indexController.borrarProducto);


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

router.get ('/add', indexController.productadd);
    router.post('/add',uploadAdd.single('productImage'), indexController.crear);
    

router.get ('/login', indexController.login);
router.post('/login', indexController.loginUsuario);

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

router.get ('/register', indexController.register);
router.post('/register', upload.single('image') , indexController.crearUsuario);

router.get('/logout', indexController.logout);





/* GET home page. */


module.exports = router;
