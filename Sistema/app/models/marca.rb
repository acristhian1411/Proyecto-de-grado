# == Schema Information
#
# Table name: marcas
#
#  id            :bigint(8)        not null, primary key
#  marca_active  :boolean
#  marca_descrip :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Marca < ApplicationRecord
end
