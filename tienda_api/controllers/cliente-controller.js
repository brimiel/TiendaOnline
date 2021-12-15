const DataTypes = require("sequelize").DataTypes;
const sequelize = require('../dbConnection');
const Cliente = require('../modelos/cliente')(sequelize, DataTypes);

const {hashPassword, matchPassword} = require('../utils/password')

module.exports.createCliente = async (request, response) => {
    try {
        let nombreCompleto = request.body['nombreCompleto'];
        let email = request.body.email;
        let password = await hashPassword(request.body.password);
        let telefono = request.body.telefono;

        const cliente = await Cliente.create({
            nombre_completo: nombreCompleto,
            password: password,
            email: email,
            telefono: telefono
        });

        response.status(201).json({cliente});
    } catch (e) {
        const code = response.statusCode ? response.statusCode : 422;
        return response.status(code).json({
            errors: {
                body: ['No se pudo crear el cliente.', e.message]
            }
        });
    }
}

module.exports.loginCliente = async (request, response) => {
    try {
        console.log(request.body);
        let email = request.body.email;
        let password = request.body.password;

        let cliente = await Cliente.findOne({where: {email: email}})

        if (!cliente) {
            response.status(200).json({
                id: 0,
                nombre_completo: '',
                password: '',
                email: '',
                telefono: ''
            });
        }


        const passwordMath = await matchPassword(cliente.password, password);
        console.log(passwordMath);

        if (!passwordMath) {
            response.status(200).json({
                id: -1,
                nombre_completo: '',
                password: '',
                email: '',
                telefono: ''
            });
        }

        console.log(cliente);

        response.status(200).json({cliente});
    } catch (e) {
        const code = response.statusCode ? response.statusCode : 422;
        return response.status(code).json({
            errors: {
                body: ['Hay problemas con el login.', e.message]
            }
        });
    }
}
