class ChangeColumnTypeToDate < ActiveRecord::Migration
  def change
    def up
      change_column :orders, :needed_by, :date, null: false
    end

    def down
      change_column :orders, :needed_by, :datetime, null: false
    end
  end
end
