# == Schema Information
#
# Table name: stocks
#
#  id           :bigint(8)        not null, primary key
#  precio_venta :float
#  stock        :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  producto_id  :bigint(8)
#  sucursale_id :bigint(8)
#
# Indexes
#
#  index_stocks_on_producto_id   (producto_id)
#  index_stocks_on_sucursale_id  (sucursale_id)
#
# Foreign Keys
#
#  fk_rails_...  (producto_id => productos.id)
#  fk_rails_...  (sucursale_id => sucursales.id)
#

require 'test_helper'

class StockTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
