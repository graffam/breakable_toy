require "rails_helper"

describe Machine do
  let(:blank_values) { [nil, ""] }
  it { should have_valid(:name).when("Name") }
  it { should_not have_valid(:name).when(*blank_values) }

  #### Test Associations ####
  it { should have_many :machine_kit_compatibilities }
  it { should have_many(:kits).through :machine_kit_compatibilities }
  it { should have_many :orders }
end
