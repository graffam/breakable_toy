require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:blank_values) { [nil, ''] }
  it { should have_valid(:email).when("test@gmail.com") }
  it { should_not have_valid(:email).when(*blank_values) }
  it { should_not have_valid(:email).when("fail.com")}
  it { should_not have_valid(:email).when("fail@") }

#### Test Associations ####
  it { should have_many :orders }
end
