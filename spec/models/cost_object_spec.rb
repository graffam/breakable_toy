require "rails_helper"

describe CostObject do
  let(:blank_values) { [nil, ''] }
  it { should have_valid(:name).when("Name") }
  it { should_not have_valid(:name).when(*blank_values) }

#### Test Associations ####
  it { should have_many :orders }
end
