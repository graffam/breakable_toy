class MachineKitCompatibility < ActiveRecord::Base
  belongs_to :machine
  belongs_to :kit
end
