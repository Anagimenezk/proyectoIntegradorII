
module.exports = (sequelize, dataTypes) => {

        const Product = sequelize.define('Producto', {

            id: {
                autoIncrement: true,
                primaryKey: true,
                type: dataTypes.INTEGER
            },

            nombre: {
                type: dataTypes.STRING
            },
            image: {
                type: dataTypes.STRING(500)
            },
            descripcion: {
                type: dataTypes.STRING(1000)
            },
            fecha: {
                type: dataTypes.DATE
            },
            user_id: {
                type: dataTypes.INTEGER
            }


        }, {
            tableName: "productos",
            timestamps: false
        });
       // Product.associate = (db)=>{
          //  Product.hasMany (db.Comentario, {
              //  as: 'comentarios',
                //foreignKey: 'product_id'
            //})
            //Product.belongsTo(db.Usuario, {
          //  as: 'usuarios',
           // foreignKey: 'user_id'
        //});
       // }
    
        return Product;
    }
    
    //nombre de la constante 'Product' es intenro: coincide el const y el return proque sino va a devolver vacio el return
    // nombre 'PElicula' es importante proque con este vamos a requerir desde el controlador
    // nombre tablename "movies", es el mismo nombre que esta en SQl, con este se va a ahcer el SELECT 
    