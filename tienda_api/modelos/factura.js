const Sequelize = require('sequelize');
module.exports = function(sequelize, DataTypes) {
  return sequelize.define('factura', {
    id: {
      autoIncrement: true,
      type: DataTypes.INTEGER,
      allowNull: false,
      primaryKey: true
    },
    fecha: {
      type: DataTypes.DATE,
      allowNull: false,
      defaultValue: Sequelize.Sequelize.literal('CURRENT_TIMESTAMP')
    },
    impuesto: {
      type: DataTypes.DOUBLE,
      allowNull: false,
      defaultValue: 0.19
    },
    total: {
      type: DataTypes.DOUBLE,
      allowNull: false
    },
    factura_estado_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'factura_estado',
        key: 'id'
      }
    },
    orden_id: {
      type: DataTypes.INTEGER,
      allowNull: false,
      references: {
        model: 'orden',
        key: 'id'
      }
    }
  }, {
    sequelize,
    tableName: 'factura',
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
        name: "fk_factura_factura_estado1_idx",
        using: "BTREE",
        fields: [
          { name: "factura_estado_id" },
        ]
      },
      {
        name: "fk_factura_orden1_idx",
        using: "BTREE",
        fields: [
          { name: "orden_id" },
        ]
      },
    ]
  });
};
