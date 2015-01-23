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

  def self.order_errors(order_params)
    if order_params["comment"] = "" || order_params["needed_by"] = ""
      order = Order.create(order_params)
    end
    errors = order.errors.full_messages
    errors << "Fill in atleast one kit to be ordered"
  end
end
