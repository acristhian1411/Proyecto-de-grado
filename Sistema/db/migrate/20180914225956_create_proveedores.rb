class CreateProveedores < ActiveRecord::Migration[5.2]
  def change
    create_table :proveedores do |t|
      t.string :razon_social
      t.string :ruc
      t.string :direccion
      t.string :telefono
      t.string :email
      t.boolean :prov_activo

      t.timestamps
    end
  end
end
