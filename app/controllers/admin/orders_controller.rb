module Admin
  class OrdersController < ApplicationController
    before_filter :authorize!

    def index
      @orders = Order.all.page(params[:page]).per(10)
    end

    def destroy
      @order = Order.find(params[:id])
      @order.destroy
      flash[:notice] = "Order Successfully Deleted"
      redirect_to admin_orders_path
    end
  end
end
