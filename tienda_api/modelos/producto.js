const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('producto', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    nombre: {
      type: DataTypes.STRING(32),
      allowNull: false
    },
    descripcion: {
      type: DataTypes.STRING(128),
      allowNull: false
    },
    precio_compra: {
      type: DataTypes.DOUBLE,
      allowNull: false
    },
    precio_venta: {
      type: DataTypes.DOUBLE,
      allowNull: false
    },
    minimo_stock: {
      type: DataTypes.SMALLINT,
      allowNull: false
    },
    cantidad: {
      type: DataTypes.SMALLINT,
      allowNull: false
    },
    categoria_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'categoria',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'producto',
    hasTrigger: true,
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "id" },
        ]
      },
      {
        name: "fk_producto_categoria1_idx",
        using: "BTREE",
        fields: [
          { name: "categoria_id" },
        ]
      },
    ]
  });
};
