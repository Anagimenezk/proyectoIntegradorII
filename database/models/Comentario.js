

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
    })
   // Comentario.associate = (db)=> {
       // Comentario.belongsTo(db.Product, {
           // as: 'productos',
            //foreignKey: 'product_id'
        //})
        //Comentario.belongsTo(db.Usuario, {
          //  as: 'usuarios',
           // foreignKey: 'user_id'
        //});
   // }

    return Comentario;
}