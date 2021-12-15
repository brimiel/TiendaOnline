const dotenv = require('dotenv').config()
const express = require('express')
const morgan = require('morgan')
const cors = require('cors')

const {notFound, errorHandler} = require('./middleware/errorHandler')
const sequelize = require('./dbConnection')

const categoriaRoute = require('./routes/categorias');
const facturaEstadoRoute = require('./routes/factura-estados');
const clienteRoute = require('./routes/clientes');
const productoRoute = require('./routes/productos');
const carritoRoute = require('./routes/carritos');

const app = express()

// CORS
app.use(cors({credentials: true, origin: true}));

const sync = async () => await sequelize.sync({alter: false});
sync();

app.use(express.json());
app.use(morgan('tiny'));

app.get('/', (req, res) => {
    res.json({status: "API is running"});
});

app.use('/api/categorias', categoriaRoute);
app.use('/api/factura-estado', facturaEstadoRoute);
app.use('/api/cliente', clienteRoute);
app.use('/api/producto', productoRoute);
app.use('/api/carrito', carritoRoute);

app.use(notFound);
app.use(errorHandler);

const PORT = process.env.PORT || 8080;

app.listen(PORT, () => {
    console.log(`Server running on http://localhost:8080`);
});
