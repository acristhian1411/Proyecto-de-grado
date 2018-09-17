# == Schema Information
#
# Table name: proveedores
#
#  id           :bigint(8)        not null, primary key
#  direccion    :string
#  email        :string
#  prov_activo  :boolean
#  razon_social :string
#  ruc          :string
#  telefono     :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class ProveedoreTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
