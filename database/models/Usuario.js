
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
            type: dataTypes.INTEGER(10)
        },
        fecha: {
            type: dataTypes.DATE
        },
        image: {
            type: dataTypes.STRING(500)
        }


    }, {
        tableName: "usuarios",
        timestamps: false
    });
    
    //Usuario.associate = (db)=> {
       // Usuario.hasMany (db.Comentario, {
           // as: 'comentarios',
            //ForeignKey: user_id
       // })
   // }

    return Usuario;
}