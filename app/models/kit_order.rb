class KitOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :kit

  validates :amount, presence: true
  validates_numericality_of :amount,
                            :kit_id,
                            :order_id

  ## Prevents empty kit_orders from being created ##
  def self.make_items(kit_orders, order)
    kit_orders.each_value do |values|
      if (values[:amount] != "")
        KitOrder.create(
        amount: values["amount"],
        kit_id: values["kit_id"],
        name: values["name"],
        order_id: order.id)
      end
    end
  end

  def self.not_empty?(kit_order_attributes)
    kit_orders = kit_order_attributes
    count = 0
    kit_orders.each_value do |kit_order|
      count += kit_order["amount"].to_i
    end
    if count > 0
      return true
    else
      return false
    end
  end
end
