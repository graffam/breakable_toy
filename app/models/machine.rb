class Machine < ActiveRecord::Base
  has_many :machine_kit_compatibilities
  has_many :kits, through: :machine_kit_compatibilities
end
