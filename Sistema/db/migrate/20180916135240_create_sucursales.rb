class CreateSucursales < ActiveRecord::Migration[5.2]
  def change
    create_table :sucursales do |t|
      t.string :suc_descrip
      t.boolean :suc_activo

      t.timestamps
    end
  end
end
