class Order < ActiveRecord::Base
  validates :user_id,
            :needed_by,
            :machine_id,
            :cost_object_id,
            presence: true

  belongs_to :user
  belongs_to :machine
  has_many :cost_object
  has_many :kit_orders
  has_many :kits, through: :kit_orders
  accepts_nested_attributes_for :kit_orders
end
