

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
        

        user_id: {
            type: dataTypes.INTEGER
        },
        
        product_id: {
            type: dataTypes.INTEGER
        },
        createdAt: {
            type: dataTypes.DATE
        },
        updatedAt: {
            type: dataTypes.DATE
        }

    }, {
        tableName: "comentarios",
        
    })
   Comentario.associate = (db)=> {
       Comentario.belongsTo(db.Producto, {
           as: 'productos',
            foreignKey: 'product_id'
        })
        Comentario.belongsTo(db.Usuario, {
          as: 'usuarios',
        foreignKey: 'user_id'
        });
   }

    return Comentario;
}