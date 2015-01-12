require 'rails_helper'

feature 'viewing an order', %Q{
  As a user
  I want to view an order for reagent kits
  So I know what orders I need to work on
  } do
    # Acceptance Criteria:
    # [X] I must be able to see a list of the all orders
    # [X] clicking on a specific order shows me their details
    # [] I should be able to sort orders by status
    # [] I should be able to sort orders by machine type
    # [X] I must be logged in to see all of the orders
  context "User is signed in and there are existing orders" do
    before :each do
      user = FactoryGirl.create(:user)
      @order = FactoryGirl.create(:order)
      FactoryGirl.create(:kit_order, order_id: @order.id)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password

      click_button 'Log in'
    end

    scenario "user views the orders page" do

      visit orders_path

      expect(page).to have_content(@order.machine.name)
      expect(page).to have_content(@order.needed_by)
      expect(page).to have_content(@order.user.first_name)
      expect(page).to have_link(@order.id)

    end

    scenario "user views details of an order" do
      visit orders_path

      click_on(@order.id)

      expect(page).to have_content(@order.machine.name)
      expect(page).to have_content(@order.needed_by)
      expect(page).to have_content(@order.user.first_name)
      expect(page).to have_content(@order.comment)

      @order.kit_orders.each do |kit_order|
        expect(page).to have_content(kit_order.name)
        expect(page).to have_content(kit_order.amount)
      end
    end
  end

  scenario "visitor attempts to see all of the orders" do
    visit orders_path

    expect(page).to have_content("You need to sign in")
  end
end
