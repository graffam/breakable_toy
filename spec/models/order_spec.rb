require 'spec_helper'

describe Order do
  let(:blank_values) { [nil, ""] }
  it { should have_valid(:user_id).when(1, 22) }
  it { should_not have_valid(:user_id).when(*blank_values, "asdf") }
  it { should have_valid(:machine_id).when(1, 22) }
  it { should_not have_valid(:machine_id).when(*blank_values,"sdf") }
  it { should have_valid(:needed_by).when("2015-01-02") }
  it { should_not have_valid(:needed_by).when(*blank_values) }
  it { should have_valid(:cost_object_id).when(1, 22) }
  it { should_not have_valid(:cost_object_id).when(*blank_values, "sdfa") }

  #### Test Associations ####
  it { should belong_to :user }
  it { should have_many :kit_orders }
  it { should have_many(:kits).through(:kit_orders) }
  it { should belong_to :cost_object }
  it { should have_many(:kit_orders).dependent(:destroy) }
end
