class AddLotNumbersToKitOrders < ActiveRecord::Migration
  def change
    add_column :kit_orders, :lot_numbers, :text
  end
end
