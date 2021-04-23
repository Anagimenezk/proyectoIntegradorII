const controlador = {
    index: (req,res) => {
        res.render ('index');
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