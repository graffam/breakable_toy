class Order < ActiveRecord::Base
  validates :user_id,
            :needed_by,
            :machine_id,
            :cost_object_id,
            presence: true
            
  validates_numericality_of :user_id,
                            :machine_id,
                            :cost_object_id

  belongs_to :user
  belongs_to :machine
  belongs_to :cost_object
  has_many :kit_orders
  has_many :kits, through: :kit_orders
  accepts_nested_attributes_for :kit_orders
end
