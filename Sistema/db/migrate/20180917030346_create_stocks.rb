class CreateStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :stocks do |t|
      t.references :producto, foreign_key: true
      t.references :sucursale, foreign_key: true
      t.float :precio_venta
      t.integer :stock

      t.timestamps
    end
  end
end
