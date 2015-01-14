class AddCostObjectIdsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cost_object_id, :integer, null: false
  end
end
