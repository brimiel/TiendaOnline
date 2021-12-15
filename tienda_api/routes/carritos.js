const express = require('express');
const router = express.Router();

const Controller = require('../controllers/carrito-controller');

router.post('/comprar', Controller.createCompra);

module.exports = router;
