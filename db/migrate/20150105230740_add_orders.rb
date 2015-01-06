class AddOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :comment
      t.datetime :needed_by, null: false
      t.string :status, null: false, default: "To Do"
      t.timestamps
    end
  end
end
