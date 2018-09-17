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

class Sucursale < ApplicationRecord
	has_many :stock
end
