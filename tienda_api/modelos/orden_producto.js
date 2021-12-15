const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('orden_producto', {
    orden_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'orden',
        key: 'id'
      }
    },
    producto_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true,
      references: {
        model: 'producto',
        key: 'id'
      }
    },
    cantidad: {
      type: DataTypes.SMALLINT,
      allowNull: false
    }
  }, {
    sequelize,
    tableName: 'orden_producto',
    timestamps: false,
    indexes: [
      {
        name: "PRIMARY",
        unique: true,
        using: "BTREE",
        fields: [
          { name: "orden_id" },
          { name: "producto_id" },
        ]
      },
      {
        name: "fk_orden_has_producto_producto1_idx",
        using: "BTREE",
        fields: [
          { name: "producto_id" },
        ]
      },
      {
        name: "fk_orden_has_producto_orden1_idx",
        using: "BTREE",
        fields: [
          { name: "orden_id" },
        ]
      },
    ]
  });
};
