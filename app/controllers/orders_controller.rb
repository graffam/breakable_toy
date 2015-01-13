class OrdersController < ApplicationController
  def new
    authenticate_user!
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
    authenticate_user!
    @order = Order.new(order_params)
    @order.user_id = current_user.id
    if @order.save
      KitOrder.make_items(params[:order][:kit_orders_attributes], @order)
      flash[:notice] = "Order Created Successfully"
      redirect_to order_path(@order)
    end
  end

  def show
    authenticate_user!
    @order = Order.find(params["id"])
    @kit_orders = @order.kit_orders
  end

  def index
    authenticate_user!
    @orders = Order.all
  end

  private

  def order_params
    params.require(:order).permit(
      :machine_id,
      :comment,
      :needed_by,
      :cost_object_id)
  end
end
