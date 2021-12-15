const DataTypes = require("sequelize").DataTypes;
const sequelize = require('../dbConnection');
const Factura = require('../modelos/factura')(sequelize, DataTypes);
const Orden = require('../modelos/orden')(sequelize, DataTypes);
const OrdenProducto = require('../modelos/orden_producto')(sequelize, DataTypes);

module.exports.createCompra = async (request, response) => {
    try {
        console.log(request.body);



        const factura = await Factura({

        });

        response.status(201).json({a: 1});
    } catch (e) {
        const code = response.statusCode ? response.statusCode : 422;
        return response.status(code).json({
            errors: {
                body: ['No se pudo crear el cliente.', e.message]
            }
        });
    }
}
