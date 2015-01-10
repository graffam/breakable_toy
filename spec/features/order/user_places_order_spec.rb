require 'rails_helper'

feature 'placing order', %Q{
  As a user
  I want to place an order for reagent kits
  So that I can receive reagent kits
  } do
# Acceptance Criteria:
# [] Be able to place an order for reagents
# [] I Cannot order reagents for the wrong machine
# [] I must be logged in to order
# [] I should see a message saying my order has been placed
# [] After placing the order, i'm brought to the order details

  context "User is signed in" do
    before(:all) do
      @user = FactoryGirl.create(:user)

      visit new_user_session_path

      fill_in 'Email', with: @user.email
      fill_in 'Password', with: @user.password

      click_button 'Log in'
    end

    scenario "User places an order" do
      visit new_order_path

      select("HSX", from: "machine")
      fill_in "Comment", with: "Need this asap"
      fill_in "58c", with: "1"
      click_button "Submit"

      expect(page).to have_content("Order Placed")
      expect(page).to have_content("58c 1")
      expect(page).to have_content("Need this asap")
    end
  end
end
