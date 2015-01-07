class Order < ActiveRecord::Base
  validates :user_id,
            :needed_by,
            presence: true

  belongs_to :user
  has_many :kit_orders
  has_many :kits, through: :kit_orders
end
