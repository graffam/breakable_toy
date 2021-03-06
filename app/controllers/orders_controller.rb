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
    if KitOrder.not_empty?(params[:order][:kit_orders_attributes])
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
      @errors = Order.order_errors(order_params)
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
    @orders = Order.all.page(params[:page]).per(10).reverse_order
  end

  def edit
    @order = Order.find(params[:id])
    @kit_orders = @order.kit_orders
  end

  def update
    @order = Order.find(params[:id])
    params["order"]["kit_orders_attributes"].each_value do |values|
      kit_order = KitOrder.find_by(id: values["id"])
      kit_order.lot_numbers = values["lot_numbers"]
      kit_order.save
    end
    @order.update!(order_params)
    redirect_to order_path(@order)
  end

  private

  def order_params
    params.require(:order).permit(
      :status,
      :machine_id,
      :comment,
      :needed_by,
      :cost_object_id)
  end
end
