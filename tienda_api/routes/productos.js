const express = require('express');
const router = express.Router();

const Controller = require('../controllers/producto-controller');

router.get('/', Controller.getProductos);

module.exports = router;
