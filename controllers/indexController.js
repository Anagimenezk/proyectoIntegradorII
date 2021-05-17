let productos = require ('../data/productos');
const {json} = require ('express')

const controlador = {
    index: (req,res) => {
      let id = req.params.id
       return res.render ('index',{productos: productos.lista,idSearch:id });

    },
    
    login: (req,res) => {
        res.render ('login');
    },

    register: (req,res) => {
        res.render ('register');
    },

    product: (req,res) => {
        let id = req.params.id
        return res.render ('product',{productos: productos.lista, idSearch:id});
    },

    search: (req,res) => {
        res.render ('search-results', {results: productos.byName(req.query.search), 
            search: req.query.search.toUpperCase()});

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
    allProducts: (req,res) => {
       return res.render ('allProducts', {productos: productos.lista})
    },

//FALTAN LOS CONTORLADOR  QUE CREAMOS LAS RUTAS DE POST POR ESO CRASHEA 
// NOS CRASHEA PORQUE MNO ESTA DEFINIDO EL PORDUCTO EN MODELOS REVISAR LO DE SEARCH Y CREATE 


}
     

module.exports = controlador;