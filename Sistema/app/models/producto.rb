# == Schema Information
#
# Table name: productos
#
#  id              :bigint(8)        not null, primary key
#  iva             :integer
#  prod_active     :boolean
#  prod_descrip    :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  marca_id        :bigint(8)
#  proveedore_id   :bigint(8)
#  sub_category_id :bigint(8)
#
# Indexes
#
#  index_productos_on_marca_id         (marca_id)
#  index_productos_on_proveedore_id    (proveedore_id)
#  index_productos_on_sub_category_id  (sub_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (marca_id => marcas.id)
#  fk_rails_...  (proveedore_id => proveedores.id)
#  fk_rails_...  (sub_category_id => sub_categories.id)
#

class Producto < ApplicationRecord
  belongs_to :proveedore
  belongs_to :marca
  belongs_to :sub_category
  has_many :stock
end
