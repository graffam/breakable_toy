class Kit < ActiveRecord::Base
  has_many :machine_kit_compatibilities
  has_many :machines, through: :machine_kit_compatibilities
  has_many :kit_orders
  has_many :orders, through: :kit_orders

  validates :name, presence: true
end
