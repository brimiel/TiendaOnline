const express = require('express');
const router = express.Router();

const CategoriaController = require('../controllers/categorias-controller');

router.get('/', CategoriaController.getCategorias);

module.exports = router;
