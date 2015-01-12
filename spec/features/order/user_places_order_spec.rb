require 'rails_helper'

feature 'placing order', %Q{
  As a user
  I want to place an order for reagent kits
  So that I can receive reagent kits
  } do
# Acceptance Criteria:
# [X] Be able to place an order for reagents
# [X] I Cannot order reagents for the wrong machine
# [X] I must be logged in to order
# [X] I should see a message saying my order has been placed
# [X] After placing the order, i'm brought to the order details

  context "User is signed in" do
    before :each do
      user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end

    scenario "User places an order" do
      visit new_order_path
      save_and_open_page
      select("HSX", from: "machine_id")

      click_button "Submit"

      fill_in "Comment", with: "Need this asap"
      fill_in "order[kit_orders_attributes][0][amount]", with: "1"
      fill_in "order_needed_by", with:"07/10/2015"
      click_button "Submit"

      expect(page).to have_content("Order Created Successfully")
      expect(page).to have_content("168c: 1")
      expect(page).to have_content("Need this asap")
    end
  end

  scenario "visitor attempts to make an order" do
    visit new_order_path

    expect(page).to have_content("You need to sign in")
  end
end
