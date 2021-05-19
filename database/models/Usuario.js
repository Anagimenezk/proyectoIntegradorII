
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
        }


    }, {
        tableName: "usuarios",
        timestamps: false
    });

    return Usuario;
}