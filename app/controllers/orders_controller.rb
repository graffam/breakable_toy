class OrdersController < ApplicationController
  def new
    @machines = Machine.all
  end

  def create

  end

end
