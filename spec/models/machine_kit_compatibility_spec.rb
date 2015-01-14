require "rails_helper"

describe MachineKitCompatibility do
  let(:blank_values) { [nil, ''] }
  it { should have_valid(:kit_id).when(1,22) }
  it { should_not have_valid(:kit_id).when(*blank_values, "sdf") }
  it { should have_valid(:machine_id).when(1,100) }
  it { should_not have_valid(:machine_id).when(*blank_values, "sdf") }

#### Test Associations ####
  it { should belong_to :kit }
  it { should belong_to :machine }
end
