class Machine < ActiveRecord::Base
  has_many :orders
  has_many :machine_kit_compatibilities
  has_many :kits, through: :machine_kit_compatibilities

  validates :name, presence: true
end
