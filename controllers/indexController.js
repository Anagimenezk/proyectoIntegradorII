let productos = require('../data/productos');
const {
    json
} = require('express')

const db = require('../database/models')
const Op = db.Sequelize.Op;
const bcrypt = require('bcryptjs');

const controlador = {
   
    index: (req, res) => {
        let filtro = {
            order: [
                ['createdAt', 'DESC']
            ],
            limit: 4
        }
        let filtro2 = {
            order: [
                ['createdAt', 'ASC']
            ],
            limit: 4
        }
        db.Producto.findAll(filtro).then(resultado => {
            db.Producto.findAll(filtro2).then(resultado2 => {
                if (req.session.usuario) {
                    res.render('index', {
                        usuario: req.session.mail,
                        productos: resultado,
                        productos2: resultado2
                    })
                } else {
                    res.render('index', {
                        usuario: 'anonimo',
                        productos: resultado,
                        productos2: resultado2
                    })
                }

            })

        })
        // let id = req.params.id
        //return res.render ('index',{productos: productos.lista,idSearch:id }); 
    },


    register: (req, res) => {
        res.render('register');
    },

    crearUsuario: (req, res) => {
        let contraseña = req.body.contraseña
        const contraseñaEncriptada = bcrypt.hashSync(req.body.contraseña, 10);


        // console.log(req.body) 
        // console.log(req.file)
        //console.log (req.body.telefono.length)

        let errors = {};
        if (req.body.mail == "") {
            errors.register = "Por favor completar con su direccion de email"
            res.locals.errors = errors
            return res.render('register')
        } else if (req.body.contraseña == "") {
            errors.register = "Debe agregar una contraseña para poder registrarse"
            res.locals.errors = errors
            return res.render('register')

        } else if (req.body.contraseña == "") {
            errors.register = "Por favor reescribir la contraseña"
            res.locals.errors = errors
            return res.render('register')
        } else {
            db.Usuario.findOne({
                where: [{
                    mail: req.body.mail
                }]
            }).then(usuario => {
                if (usuario != null) {
                    errors.register = "Este email ya existe"
                    res.locals.errors = errors
                    return res.render('register')
                } else if (contraseña.lenght < 4) {
                    errors.register = "La contraseña no puede tener menos de 4 caracteres"
                    res.locals.errors = errors
                    return res.render('register')
                } else {
                    db.Usuario.create({
                            nombre: req.body.nombre,
                            apellido: req.body.apellido,
                            mail: req.body.mail,
                            telefono: req.body.telefono,
                            fecha: req.body.fecha,
                            image: '/images/users/' + req.file.filename,
                            contraseña: contraseñaEncriptada

                        })

                        .then(usuarioCreado => {
                            req.session.usuario = usuarioCreado
                            res.redirect('/profile/' + usuarioCreado.id)
                        }).catch(error => console.log(error))

                    console.log(contraseñaEncriptada.length)
                    console.log(req.file.filename)
                }
            })
        }

    },


    login: (req, res) => {
        res.render('login');
    },

    loginUsuario: (req, res) => {
        let contraseña = req.body.contraseña
        const filtro = {
            where: {
                mail: req.body.mail
            }
        }
        db.Usuario.findOne({
            where: [{
                mail: req.body.mail
            }]
        }).then(usuario => {
            if (usuario == null) {
                errors.register = "El mail ingresado no existe"
                res.locals.errors = errors
                return res.render('login')
            }
        })
        let errors = {};
        db.Usuario.findOne(filtro).then(usuario => {
            console.log(req.body.contrasenia)
            console.log(usuario.contraseña)
            console.log(bcrypt.compareSync(req.body.contrasenia, usuario.contraseña))





            if (bcrypt.compareSync(req.body.contrasenia, usuario.contraseña)) {
                req.session.usuario = usuario


                if (req.body.recordarme) {
                    res.cookie('userId', usuario.id, {
                        maxAge: 1000 * 60 * 5
                    })
                }
                res.redirect('/')
            } else {
                errors.register = "Contraseña incorreta"
                res.locals.errors = errors
                return res.render('login')
            }

        }).catch(error => console.log(error))
    },

    logout: (req, res, next) => {
        req.session.destroy()
        res.clearCookie('user_id')
        res.redirect('/')
            .catch(error => console.log(error))
    },


    product: (req, res) => {
        console.log(req.params)
        const filtro = {
            include: [{
                    association: 'usuarios'
                },
                {
                    association: 'comentarios',
                    include: 'usuarios'
                }
            ],
            order: [
                ['comentarios', 'createdAt', 'DESC']
            ]
        }
        db.Producto.findByPk(req.params.id, filtro).then(producto => {
            console.log(producto)
            res.render('product', {
                producto: producto
            })
            //{productos:resultado}

        })


    },

    profiledit: (req, res) => {
        db.Usuario.findByPk(req.query.id).then(
            usuarioModificado => res.render('profile-edit', {
                usuario: usuarioModificado
            })
        )
    },

    modificarUsuario: (req, res) => {
        let errors = {}

        if (req.body.contraseña) {


            let contraEncriptada = bcrypt.hashSync(req.body.contraseña);
            db.Usuario.update({
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                mail: req.body.mail,
                telefono: req.body.telefono,
                fecha: req.body.fecha,
                image: '/images/users/' + req.file.filename,
                contraseña: contraEncriptada

            }, {
                where: {
                    id: req.body.id
                }
            }).then(usuarioModificado => {
                res.redirect('/profile/' + req.body.id)
            }).catch(error => console.log(error))
        } else {
            db.Usuario.update({
                nombre: req.body.nombre,
                apellido: req.body.apellido,
                mail: req.body.mail,
                telefono: req.body.telefono,
                fecha: req.body.fecha,
                image: '/images/users/' + req.file.filename,

            }, {
                where: {
                    id: req.body.id
                }
            }).then(usuarioModificado => {
                res.redirect('/profile/' + req.body.id)
            }).catch(error => console.log(error))
        }



    },

    crearComentario: (req, res) => {
        db.Comentario.create({
            texto: req.body.texto,
            user_id: req.session.usuario.id,
            product_id: req.body.id

        }).then(comentarioCreado => {
            res.redirect('/product/' + req.body.id);

        });

    },
    borrarComentario: (req, res) => {
        db.Comentario.destroy({
            where: {
                id: req.body.id,
            }
        }).then(() => {
            res.redirect('/')
        })
    },

    search: (req, res) => {
        //cambiar algo
        const filtro = {
            where: {
                nombre: {
                    [Op.like]: '%' + req.query.search + '%'
                },
                descripcion: {
                    [Op.like]: '%' + req.query.search + '%'
                }
            }
        }
        db.Producto.findAll(filtro).then(resultado => {
            res.render('search-results', {
                results: resultado
            });
        });
    },

    profile: (req, res) => {
        console.log(req.params)
        const filtro = {
            include: [{
                    association: 'productos',
                    include: 'comentarios'
                },
                {
                    association: 'comentarios'
                },

            ],

        }
        db.Usuario.findByPk(req.params.id, filtro).then(usuario => {
            //return res.send(usuario)
            let respuesta = []
            usuario.comentarios.forEach(element => {
                respuesta.push(element.id)
            })
            usuario.productos.forEach(element => {
                respuesta.push(element.id)

            });

            if (req.session.usuario && usuario.id == req.session.usuario.id) {
                req.session.usuario = usuario
            }


            res.render('profile', {
                usuario: usuario
            })

        })
    },


    productadd: (req, res) => {
        res.render('product-add')
    },

    crear: (req, res) => {
        let errors = {};

        db.Producto.findOne({
            where: [{
                nombre: req.body.nombre
            }]
        }).then(producto => {
            if (producto) {
                errors.register = "El producto ingresado ya existe"
                res.locals.errors = errors
                return res.render('product-add')
            }
        })
        db.Producto.create({
            nombre: req.body.nombre,
            image: '/images/products/' + req.file.filename,
            fecha: req.body.fecha,
            descripcion: req.body.descripcion,
            user_id: req.session.usuario.id

        }).then(productoCreado => {
            res.redirect('/product/' + productoCreado.id);
        })


    },

    modificarForm: (req, res) => {
        db.Producto.findByPk(req.params.id).then(productoModificado => {
            res.render('modificar', {
                producto: productoModificado
            })
            })

    },

    modificarProducto: (req, res) => {
        db.Producto.update({
            nombre: req.body.nombre,
            image: '/images/products/' + req.file.filename,
            fecha: req.body.fecha,
            descripcion: req.body.descripcion

        }, {
            where: {
                id: req.body.id
            }
        }).then(() => {
            res.redirect('/product/' + req.body.id)
        })
    },

    borrarProducto: (req, res) => {
        db.Producto.destroy({
            where: {
                id: req.body.id
            }
        }).then(() => {
            res.redirect('/allProducts')
        })
    },



    allProducts: (req, res) => {

        console.log(req.params)
        const filtro = {
            include: [{
                    association: 'usuarios'
                },
                {
                    association: 'comentarios',
                    include: 'usuarios'
                }
            ],
        }
        db.Producto.findAll(filtro).then(resultado => {

            console.log(resultado)


            //let respuesta= []
            //resultado.comentarios.forEach(element =>{
            // respuesta.push (element.id) })

            res.render('allProducts', {
                productos: resultado
            })


        })
        //db.Producto.findAll({

        // }).then(resultado =>{ 
        //  res.render('allProducts',{productos:resultado})
        // }) 

    },





    //FALTAN LOS CONTORLADOR  QUE CREAMOS LAS RUTAS DE POST POR ESO CRASHEA 
    // NOS CRASHEA PORQUE MNO ESTA DEFINIDO EL PORDUCTO EN MODELOS REVISAR LO DE SEARCH Y CREATE 


}


module.exports = controlador;