class ChangeDatetimeToDate < ActiveRecord::Migration
  def change
    def up
      change_table :orders do |t|
        t.change :needed_by, :date
      end
    end

    def down
      change_table :orders do |t|
        t.change :needed_by, :datetime
      end
    end 
  end
end
