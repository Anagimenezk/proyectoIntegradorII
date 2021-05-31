let productos = require ('../data/productos');
const {json} = require ('express')

const db = require('../database/models')
const Op = db.Sequelize.Op;
const bycrypt = require ('bcryptjs');

const controlador = {
    index: (req,res) => {
     // let id = req.params.id
       //return res.render ('index',{productos: productos.lista,idSearch:id });
       const filtro = {
        where:{
            nombre: {[Op.like]: '%'+ req.query.search+ '%'}
        }
    }
    db.Producto.findAll(filtro).then(resultado =>{
        res.render('search-results', {results: resultado});
    });
 
    },
    
    login: (req,res) => {
        res.render ('login');
    },

    register: (req,res) => {
        res.render ('register');
    },

    product: (req,res) => {
        const filtro = {
            include: [
                {association:'comentarios', include: 'usuario'}
            ]
        }
        db.Producto.findByPk(req.query.id, filtro).then(resultado =>{
          
        res.render('product',{productos:resultado})
        
      })
        //let id = req.params.id
        //return res.render ('product',{productos: productos.lista, idSearch:id});
        
    },
    // tiene que ser un select de todos los datos de la base de datos 

    //search: (req,res) => {
        //res.render ('search-results', {results: productos.byName(req.query.search), 
           // search: req.query.search.toUpperCase()});
   // },

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