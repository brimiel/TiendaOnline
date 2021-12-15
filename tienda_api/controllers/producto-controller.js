const DataTypes = require("sequelize").DataTypes;
const sequelize = require('../dbConnection');
const Producto = require('../modelos/producto')(sequelize, DataTypes);

module.exports.getProductos = async(request, response) => {
    try {
        let productos = await Producto.findAll();

        response.json(productos);
    } catch (e) {
        const code = response.statusCode ? response.statusCode : 422;
        return response.status(code).json({
            errors: {
                body: ['No se pudieron encontrar categorías.', e.message]
            }
        });
    }
}
