const express = require('express')
const router = express.Router()
const UserController = require('../controllers/cliente-controller')
const {authByToken} = require('../middleware/auth')

router.post('/', UserController.createCliente);
router.post('/login', UserController.loginCliente);

module.exports = router
