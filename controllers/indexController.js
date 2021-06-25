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
        let filtro2 = {
            order:[
                ['createdAt','ASC' ]
            ],
            limit: 4
        }
       db.Producto.findAll(filtro).then(resultado=>{
           db.Producto.findAll(filtro2).then(resultado2=>{
            if (req.session.usuario){
                res.render('index', {usuario: req.session.mail,productos:resultado, productos2:resultado2})
            }
            else{
                res.render ('index', {usuario:'anonimo',productos:resultado, productos2:resultado2})
            }
        
           })
      
       })
     // let id = req.params.id
       //return res.render ('index',{productos: productos.lista,idSearch:id }); 
    },


    register: (req,res) => {
        res.render ('register');
    },

    crearUsuario: (req,res)=> {
        const contraseñaEncriptada = bcrypt.hashSync (req.body.contraseña, 10);
       // console.log(req.body) 
       // console.log(req.file)
       //console.log (req.body.telefono.length)

        db.Usuario.create({
            nombre: req.body.nombre,
            apellido: req.body.apellido,
            mail: req.body.mail,
            telefono: req.body.telefono,
            fecha: req.body.fecha,
            image: req.file.filename,
            contraseña: contraseñaEncriptada

            

        }).then (usuarioCreado => {
            req.session.usuario = usuarioCreado
            res.redirect('/profile/'+ usuarioCreado.id)
        }).catch(error => console.log(error))

        console.log(contraseñaEncriptada.length)
        console.log (req.file.filename)
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
                    id: usuario.id, 
                    nombre: usuario.nombre, 
                    apellido: usuario.apellido
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
       console.log(req.params)
        const filtro = {
            include: [
                {association:'usuarios'},
                {association:'comentarios', include: 'usuarios'}
            ]
        }
        db.Producto.findByPk(req.params.id,filtro).then(producto =>{
         console.log(producto) 
        res.render('product', {producto:producto})
        //{productos:resultado}
        
      })
        
        
    },
   
    profiledit: (req, res) => {
        db.Usuario.findByPk (req.query.id).then (
            usuarioModificado => res.render ('profile-edit', {usuario: usuarioModificado})
        )
    },

    modificarUsuario: (req,res)=> {
        let errors = {}

        if (res.locals.userId!= req.body.id){
            errors.message = "Lo siento, usted no tiene acceso a la edicion de este perfil"
            res.locals.errors = errors 
            db.Usuario.findbyPk(req.body.id).then(usuario =>{
                res.render('profile/'+ req.body.id)
            })
        }
        if(req.body.contraseña){

        let contraEncriptada = bcrypt.hashSync (req.body.contraseña);
            db.Usuario.update ({
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                mail: req.body.mail,
                telefono: req.body.telefono,
                fecha: req.body.fecha,
                image: req.file.filename,
                contraseña: contraEncriptada
    
            },{
                where: {
                    id: req.body.id
                }
            } ).then(usuarioModificado => {
                req.session.usuario= usuarioModificado
                res.redirect ('/profile/'+ usuarioModificado.id)
            })
        }
       
    },

    crearComentario: (req,res) => {
        db.Comentario.create( {
            texto: req.body.texto,
            user_id: req.session.usuario.id,
            product_id: req.body.id
    
        }).then(comentarioCreado =>{
                res.redirect('/product/'+ req.body.id );
            
            });
    
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
        console.log(req.params)
        const filtro = {
            include: [
                {association:'productos', include: 'comentarios'},
                {association: 'comentarios'},
        
            ],

        }
        db.Usuario.findByPk(req.params.id,filtro).then(usuario =>{
         //return res.send(usuario)
let respuesta= []
usuario.comentarios.forEach(element =>{
    respuesta.push (element.id) })
usuario.productos.forEach(element =>{
    respuesta.push (element.id) 
});




        res.render('profile', {usuario:usuario})
    
    })},


    productadd: (req,res) => {
        res.render ('product-add')
    },

    crear: (req,res) => {
        db.Producto.create( {
            nombre: req.body.nombre,
            image:req.file.filename,
            fecha: req.body.fecha,
            descripcion: req.body.descripcion,
            user_id: req.session.usuario.id
    
        }).then(productoCreado =>{
                res.redirect('/product/'+ productoCreado.id);

            });
    
    },

    modificarForm: (req,res) => { 
        db.Producto.findByPk (req.query.id).then (
           productoModificado =>  res.render ('modificar', {producto: productoModificado})
        )
    },

    modificarProducto: (req,res)=> {
        db.Producto.update ({
            nombre: req.body.nombre,
            image:req.file.filename,
            fecha: req.body.fecha,
            descripcion: req.body.descripcion

        },{
            where: {
                id: req.body.id
            }
        } ).then(() => {
            res.redirect ('/product/'+ productoModificado.id)
        }
        )
    },

    borrarProducto: (req,res) => {
        db.Producto.destroy({
            where: {
                id: req.body.id
            }
        }).then(() => {
            res.redirect('/allProducts')
        })
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