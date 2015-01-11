class AddNameToKitOrders < ActiveRecord::Migration
  def change
    add_column :kit_orders, :name, :string, null: false
  end
end
