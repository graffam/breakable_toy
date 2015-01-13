class CostObject < ActiveRecord::Base
  belongs_to :order

  validates :name,
            presence: true
end
