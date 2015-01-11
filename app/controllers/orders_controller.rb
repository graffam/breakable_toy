class OrdersController < ApplicationController
  def new
    @order = Order.new
    if params["machine"]
      @machine = Machine.find_by(id: params["machine"]["id"])
      @kits = @machine.kits
      @kits.each do |kit|
        @order.kit_orders.build(kit_id: kit.id, name: kit.name)
      end
    end
  end

  def create
    binding.pry

  end

end
