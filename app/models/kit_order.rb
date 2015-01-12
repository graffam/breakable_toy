class KitOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :kit



  def self.make_items(kit_orders, order)
    kit_orders.each_value do |values|
      if (values[:amount] != "")
        kit_order = KitOrder.create(
        amount: values["amount"],
        kit_id: values["kit_id"],
        name: values["name"],
        order_id: order.id)
      end
    end
  end

  def not_empty(amount)
    if amount != nil || amount != ""
      true
    else
      false
    end
  end
end