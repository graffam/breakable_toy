require 'factory_girl'

FactoryGirl.define do

  factory :order do
    needed_by "07/10/2015"
    machine_id 1
    comment "Need this asap"
    cost_object_id 1

    user
  end

  factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    first_name "John"
    last_name "Doe"
    password 'password'
    password_confirmation 'password'
  end

  factory :kit_order do
    name "test"
    amount 10
    kit_id 1
    order_id 1
  end
end
