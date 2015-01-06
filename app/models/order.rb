class Order < ActiveRecord::Base
  validates :user_id,
            :needed_by,
            presence: true
end
