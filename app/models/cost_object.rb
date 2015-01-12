class CostObject < ActiveRecord::Base
  belongs_to :order

  validates :name,
            :order_id,
            presence: true
end
