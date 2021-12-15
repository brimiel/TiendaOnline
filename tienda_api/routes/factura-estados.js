const express = require('express');
const router = express.Router();

const FacturaEstadoController = require('../controllers/factura-estado-controller');

router.get('/', FacturaEstadoController.getFacturaEstados);

module.exports = router;
