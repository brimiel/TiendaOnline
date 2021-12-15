const DataTypes = require("sequelize").DataTypes;
const sequelize = require('../dbConnection');
const FacturaEstado = require('../modelos/factura_estado')(sequelize, DataTypes);

module.exports.getFacturaEstados = async(request, response) => {
    try {
        let facturaEstados = await FacturaEstado.findAll();

        response.json({categorias: facturaEstados});
    } catch (e) {
        const code = response.statusCode ? response.statusCode : 422;
        return response.status(code).json({
            errors: {
                body: ['No se pudieron encontrar estados de factura.', e.message]
            }
        });
    }
}
