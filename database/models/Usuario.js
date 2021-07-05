
module.exports = (sequelize, dataTypes) => {

    const Usuario = sequelize.define('Usuario', {

        id: {
            autoIncrement: true,
            primaryKey: true,
            type: dataTypes.INTEGER
        },

        nombre: {
            type: dataTypes.STRING
        },
        apellido: {
            type: dataTypes.STRING(50)
        },
        mail: {
            type: dataTypes.STRING(200)
        },
        contraseña: {
            type: dataTypes.STRING(50)
        },
        telefono: {
            type: dataTypes.INTEGER
        },
        fecha: {
            type: dataTypes.DATE
        },
        image: {
            type: dataTypes.STRING(500)
        },
        createdAt: {
            type: dataTypes.DATE
        },
        updatedAt: {
            type: dataTypes.DATE
        }


    }, {
        tableName: "usuarios",
   
    });
    
    Usuario.associate = (db)=> {
       Usuario.hasMany (db.Comentario, {
           as: 'comentarios',
        foreignKey: "user_id"
       })
       Usuario.hasMany (db.Producto, {
        as: 'productos',
        foreignKey: "user_id"
    })
    }

    return Usuario;
}