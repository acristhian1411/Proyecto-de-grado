class CreateSubCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :sub_categories do |t|
      t.string :sub_categ_descrip
      t.boolean :sub_categ_active
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
