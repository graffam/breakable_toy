class MachineKitCompatibility < ActiveRecord::Base
  belongs_to :machine
  belongs_to :kit

  validates :kit_id,
            :machine_id,
            presence: true
  validates_numericality_of :kit_id,
                            :machine_id
end
