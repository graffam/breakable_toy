class AddMachineIdToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :machine_id, :integer, null: false
  end
end
