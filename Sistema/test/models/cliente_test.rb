# == Schema Information
#
# Table name: clientes
#
#  id             :bigint(8)        not null, primary key
#  apellido       :string
#  cli_activo     :boolean
#  cli_telefono   :string
#  limite_credito :integer
#  n_cedula       :string
#  nombre         :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  barrio_id      :bigint(8)
#  ciudades_id    :bigint(8)
#
# Indexes
#
#  index_clientes_on_barrio_id    (barrio_id)
#  index_clientes_on_ciudades_id  (ciudades_id)
#
# Foreign Keys
#
#  fk_rails_...  (barrio_id => barrios.id)
#  fk_rails_...  (ciudades_id => ciudades.id)
#

require 'test_helper'

class ClienteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
