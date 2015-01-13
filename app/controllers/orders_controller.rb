class OrdersController < ApplicationController
  def new
    authenticate_user!
    @errors = []
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
    kit_orders = params[:order][:kit_orders_attributes]
    count = 0
    kit_orders.each_value do |kit_order|
      count += kit_order["amount"].to_i
    end
    if count > 0
      @order = Order.new(order_params)
      @order.user_id = current_user.id
      if @order.save
        KitOrder.make_items(params[:order][:kit_orders_attributes], @order)
        flash[:notice] = "Order Created Successfully"
        redirect_to order_path(@order)
      else
        @errors = @order.errors.full_messages
        render "new"
      end
    else
      if order_params["comment"] = "" || order_params["needed_by"] = ""
        @order = Order.create(order_params)
      end
      @errors = @order.errors.full_messages
      @errors << "Fill in atleast one kit to be ordered"
      render "new"
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

  def edit

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
