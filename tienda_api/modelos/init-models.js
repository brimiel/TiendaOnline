var DataTypes = require("sequelize").DataTypes;
var _categoria = require("./categoria");
var _cliente = require("./cliente");
var _factura = require("./factura");
var _factura_estado = require("./factura_estado");
var _orden = require("./orden");
var _orden_producto = require("./orden_producto");
var _producto = require("./producto");

function initModels(sequelize) {
  var categoria = _categoria(sequelize, DataTypes);
  var cliente = _cliente(sequelize, DataTypes);
  var factura = _factura(sequelize, DataTypes);
  var factura_estado = _factura_estado(sequelize, DataTypes);
  var orden = _orden(sequelize, DataTypes);
  var orden_producto = _orden_producto(sequelize, DataTypes);
  var producto = _producto(sequelize, DataTypes);

  orden.belongsToMany(producto, { as: 'producto_id_productos', through: orden_producto, foreignKey: "orden_id", otherKey: "producto_id" });
  producto.belongsToMany(orden, { as: 'orden_id_ordens', through: orden_producto, foreignKey: "producto_id", otherKey: "orden_id" });
  producto.belongsTo(categoria, { as: "categorium", foreignKey: "categoria_id"});
  categoria.hasMany(producto, { as: "productos", foreignKey: "categoria_id"});
  orden.belongsTo(cliente, { as: "cliente", foreignKey: "cliente_id"});
  cliente.hasMany(orden, { as: "ordens", foreignKey: "cliente_id"});
  factura.belongsTo(factura_estado, { as: "factura_estado", foreignKey: "factura_estado_id"});
  factura_estado.hasMany(factura, { as: "facturas", foreignKey: "factura_estado_id"});
  factura.belongsTo(orden, { as: "orden", foreignKey: "orden_id"});
  orden.hasMany(factura, { as: "facturas", foreignKey: "orden_id"});
  orden_producto.belongsTo(orden, { as: "orden", foreignKey: "orden_id"});
  orden.hasMany(orden_producto, { as: "orden_productos", foreignKey: "orden_id"});
  orden_producto.belongsTo(producto, { as: "producto", foreignKey: "producto_id"});
  producto.hasMany(orden_producto, { as: "orden_productos", foreignKey: "producto_id"});

  return {
    categoria,
    cliente,
    factura,
    factura_estado,
    orden,
    orden_producto,
    producto,
  };
}
module.exports = initModels;
module.exports.initModels = initModels;
module.exports.default = initModels;
