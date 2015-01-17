require "rails_helper"

feature "placing order", %{
  As a user
  I want to place an order for reagent kits
  So that I can receive reagent kits
  } do
  # Acceptance Criteria:
  # [X] Be able to place an order for reagents
  # [X] I Cannot order reagents for the wrong machine
  # [X] I must be logged in to order
  # [X] I must specify a cost object
  # [X] I should see a message saying my order has been placed
  # [X] After placing the order, i'm brought to the order details

  context "User is signed in" do
    before :each do
      user = FactoryGirl.create(:user)
      @order = FactoryGirl.build(:order)
      visit root_path

      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password

      click_button "Log in"
    end

    scenario "User places an order" do
      visit new_order_path

      select("HSX", from: "machine_id")

      click_on "Submit"

      select("Custom Sequencing", from: "order_cost_object_id")

      fill_in "Comment", with: "Need this asap"
      fill_in "order_kit_orders_attributes_0_amount", with: "1"

      fill_in "order_needed_by", with: @order.needed_by


      find('.button').click

      ### capybara puts this in as day month year...why god why? ###
      expect(page).to have_content(@order.needed_by.strftime("%m/%d/%Y"))
      expect(page).to have_content("Order Created Successfully")
      expect(page).to have_content("168c")
      expect(page).to have_content("HSX")
      expect(page).to have_content("Need this asap")
    end

    scenario "User doesn't fill out req'd fields" do
      visit new_order_path

      select("HSX", from: "machine_id")

      click_button "Submit"

      click_button "Submit"

      expect(page).to have_content("Needed by can't be blank")
      expect(page).to have_content("Fill in atleast one kit to be ordered")
    end
  end

  scenario "visitor attempts to make an order" do
    visit new_order_path

    expect(page).to have_content("You need to sign in")
  end
end
