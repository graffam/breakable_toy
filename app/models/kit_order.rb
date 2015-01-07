class KitOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :kit
end
