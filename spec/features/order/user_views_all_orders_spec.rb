require 'rails_helper'

feature 'viewing an order', %Q{
  As a user
  I want to view an order for reagent kits
  So I know what orders I need to work on
  } do
    # Acceptance Criteria:
    # [] I must be able to see a list of the all orders
    # [] clicking on a specific order shows me their details
    # [] I must be logged in to order
    # [] I should be able to sort orders by status
    # [] I should be able to sort orders by machine type
    # [] I must be logged in to see all of the orders
  context "User is signed in and there are existing orders" do
    before :each do
      user = FactoryGirl.create(:user)
      order = FactoryGirl.create(:order)
      FactoryGirl.create(:kit_order, order_id: order.id)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end

    scenario "user views the orders page" do

      visit orders_path

      expect(page).to have_content(order.comment)
      expect(page).to have_content(order.needed_by)

    end
  end
end
