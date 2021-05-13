
module.exports = (sequelize, dataTypes) => {

    const Comentario = sequelize.define('Comentario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },

        texto: {
            type: dataTypes.STRING(500)
        },
        
        creacion: {
            type: dataTypes.DATE
        },

        user_id: {
            type: dataTypes.INTEGER
        },
        
        product_id: {
            type: dataTypes.INTEGER
        }


    }, {
        tableName: "productos",
        timestamps: false
    });

    return Producto;
}