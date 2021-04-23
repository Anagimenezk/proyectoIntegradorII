let productos = require ('../data/productos');
const {json} = require ('express')

const controlador = {
    index: (req,res) => {
      /*let id = req.params.id*/  
        res.render ('index',{ productos: productos.lista /* ,idSearch: id*/ });
    },
    
    login: (req,res) => {
        res.render ('login');
    },

    register: (req,res) => {
        res.render ('register');
    },

    product: (req,res) => {
        res.render ('product');
    },

    search: (req,res) => {
        res.render ('search-results');
    },
 
    profile: (req,res) => {
        res.render ('profile');
    },
    profiledit: (req, res) => {
        res.render ('profile-edit')
    },
    productadd: (req,res) => {
        res.render ('product-add')
    },

    

}
     




module.exports = controlador;