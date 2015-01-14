require "rails_helper"

describe Kit do
  let(:blank_values) { [nil, ''] }
  it { should have_valid(:name).when("Name") }
  it { should_not have_valid(:name).when(*blank_values) }

#### Test Associations ####
  it { should have_many :kit_orders }
  it { should have_many :machine_kit_compatibilities }
  it { should have_many(:machines).through :machine_kit_compatibilities }
  it { should have_many(:orders).through :kit_orders }
end
