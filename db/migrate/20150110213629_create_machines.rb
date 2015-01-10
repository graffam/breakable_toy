class CreateMachines < ActiveRecord::Migration
  def change
    create_table :machines do |t|
      t.string :name, null: false
    end
  end
end
