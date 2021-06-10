let productos = require ('../data/productos');
const {json} = require ('express')

const db = require('../database/models')
const Op = db.Sequelize.Op;
const bcrypt = require ('bcryptjs');

const controlador = {
    index: (req,res) => {
        let filtro = {
            order:[
                ['createdAt','DESC' ]
            ],
            limit: 4
        }
       db.Producto.findAll(filtro).then(resultado =>{
        if (req.session.usuario){
            res.render('index', {usuario: req.session.mail,productos:resultado})
        }
        else{
            res.render ('index', {usuario:'anonimo',productos:resultado})
        }
       })
     // let id = req.params.id
       //return res.render ('index',{productos: productos.lista,idSearch:id });
      
       
       
    },


    register: (req,res) => {
        res.render ('register');
    },

    crearUsuario: (req,res)=> {
        const contraseñaEncriptada = bycrypt.hashSync (req.body.contraseña, 10);
   
        db.Usuario.create({
            nombre: req.body.nombre,
            apellido: req.body.apellido,
            mail: req.body.mail,
            telefono: req.body.telefono,
            fecha: req.body.fecha,
            image: req.body.image,
            contraseña: contraseñaEncriptada

        }).then (usuarioCreado => {
            res.redirect('/profile/' + usuarioCreado.id)
        }).catch(error => console.log(error))

        console.log(contraseñaEncriptada.lenght)
    },

    
    login: (req,res) => {
        res.render ('login');
    },

    loginUsuario: (req,res)=> {
        const filtro = {
            where: {
                mail:req.body.mail
            }
        }
        db.Usuario.findOne(filtro).then(usuario =>{
            console.log(req.body.contrasenia)
            console.log(usuario.contraseña)
            console.log(bcrypt.compareSync(req.body.contrasenia, usuario.contraseña));
            
            if(bcrypt.compareSync(req.body.contrasenia, usuario.contraseña)){
                req.session.usuario = {
                    mail: usuario.mail,
                    id: usuario.id
                }
                

                if (req.body.recordarme){
                    res.cookie('user_id',usuario.id,{maxAge: 1000 * 60 * 5})
                }
                res.redirect('/')
            }
            else{
                console.log('contraseñaIncorrecta')
            }
            
        }).catch(error => console.log(error))
    },

    logout: (req,res,next)=> {
        req.session.destroy()
        res.clearCookie('user_id')
        res.redirect('/')
        .catch(error => console.log(error))
    },


    product: (req,res) => {
        const filtro = {
            include: [
                {association:'comentarios', include: 'usuario'}
            ]
        }
        db.Producto.findByPk(req.query.id, filtro).then(resultado =>{
          
        res.render('product', {productos:resultado})
        //{productos:resultado}
        
      })
        
        
    },


    search: (req,res)=> {
        const filtro = {
            where:{
                nombre: {[Op.like]: '%'+ req.query.search+ '%'}
            }
        }
        db.Producto.findAll(filtro).then(resultado =>{
            res.render('search-results', {results: resultado});
        });
    },
 
    profile: (req,res) => {
        let id = req.params.id
        res.render ('profile', {productos: productos.lista,idSearch:id });
    },

    profiledit: (req, res) => {
        res.render ('profile-edit')
    },

    productadd: (req,res) => {
        res.render ('product-add')
    },

    crear: (req,res) => {
        db.Producto.create( {
            nombre: req.body.nombre,
            image:req.body.image,
            fecha: req.body.fecha,
            descripcion: req.body.descripcion,
    
        }).then(productoCreado =>{
                res.redirect('/product/'+ productoCreado.id);
            
            });
    
    },
    
    allProducts: (req,res) => {
        db.Producto.findAll({
            
        }).then(resultado =>{ 
            res.render('allProducts',{productos:resultado})
        })

        
        //return res.render ('allProducts', {productos: productos.lista})
    },

 
    
   
//FALTAN LOS CONTORLADOR  QUE CREAMOS LAS RUTAS DE POST POR ESO CRASHEA 
// NOS CRASHEA PORQUE MNO ESTA DEFINIDO EL PORDUCTO EN MODELOS REVISAR LO DE SEARCH Y CREATE 


}
     

module.exports = controlador;