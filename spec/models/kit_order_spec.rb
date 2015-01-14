require "rails_helper"

describe KitOrder do
  let(:blank_values) { [nil, ""] }
  it { should have_valid(:order_id).when(1, 22) }
  it { should_not have_valid(:order_id).when(*blank_values, "asdf") }
  it { should have_valid(:kit_id).when(1, 22) }
  it { should_not have_valid(:kit_id).when(*blank_values, "sdf") }
  it { should have_valid(:amount).when(1, 22) }
  it { should_not have_valid(:amount).when(*blank_values, "sdf") }
  it { should have_valid(:lot_numbers).when(1, 22) }

  #### Test Associations ####
  it { should belong_to :order }
  it { should belong_to :kit }
end
