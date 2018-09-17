class CreateProductos < ActiveRecord::Migration[5.2]
  def change
    create_table :productos do |t|
      t.string :prod_descrip
      t.integer :iva
      t.boolean :prod_active
      t.references :proveedore, foreign_key: true
      t.references :marca, foreign_key: true
      t.references :sub_category, foreign_key: true

      t.timestamps
    end
  end
end
