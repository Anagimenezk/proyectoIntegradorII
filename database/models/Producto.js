
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
            fecha: {
                type: dataTypes.DATE
            },
            descripcion: {
                type: dataTypes.STRING(1000)
            },
            user_id: {
                type: dataTypes.INTEGER
            }


        }, {
            tableName: "productos",
            timestamps: false
        });
    
        return Product;
    }
    
    //nombre de la constante 'Peli' es intenro: coincide el const y el return proque sino va a devolver vacio el return
    // nombre 'PElicula' es importante proque con este vamos a requerir desde el controlador
    // nombre tablename "movies", es el mismo nombre que esta en SQl, con este se va a ahcer el SELECT 
    