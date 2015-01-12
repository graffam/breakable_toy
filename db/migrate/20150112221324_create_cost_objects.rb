class CreateCostObjects < ActiveRecord::Migration
  def change
    create_table :cost_objects do |t|
      t.string :name, null: false
      t.integer :order_id, null: false
    end
  end
end
