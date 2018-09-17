# == Schema Information
#
# Table name: sucursales
#
#  id          :bigint(8)        not null, primary key
#  suc_activo  :boolean
#  suc_descrip :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class SucursaleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
