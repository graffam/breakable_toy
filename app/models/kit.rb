class Kit < ActiveRecord::Base
  has_many :kit_orders
  has_many :orders, through: :kit_orders
end
