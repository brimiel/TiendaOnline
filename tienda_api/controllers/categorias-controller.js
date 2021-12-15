const DataTypes = require("sequelize").DataTypes;
const sequelize = require('../dbConnection');
const Categoria = require('../modelos/categoria')(sequelize, DataTypes);

module.exports.getCategorias = async(request, response) => {
    try {
        let categorias = await Categoria.findAll();

        response.json({categorias});
    } catch (e) {
        const code = response.statusCode ? response.statusCode : 422;
        return response.status(code).json({
            errors: {
                body: ['No se pudieron encontrar categorías.', e.message]
            }
        });
    }
}
