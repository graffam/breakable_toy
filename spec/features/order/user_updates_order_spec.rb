require "rails_helper"

feature "Updating an Order", %{
  As a user
  I want to be able to update an order status and reagent lots
  So that I can inform the rest of the team of the status of their order
  } do
    # Acceptance Criteria:
    # [] I must see the details of the order
    # [] I must be able to change the status of the order
    # [] I must be able to add the lot numbers
    # [] I must be logged in to update an order

    context "User is signed in and there are existing orders" do
      before :each do
        user = FactoryGirl.create(:user)
        @order = FactoryGirl.create(:order, needed_by: "01/01/2001")
        FactoryGirl.create(:kit_order, order_id: @order.id)
        visit new_user_session_path

        fill_in "Email", with: user.email
        fill_in "Password", with: user.password

        click_button "Log in"
      end

      scenario "user views the update page" do

        visit order_path(@order)

        click_on("Update Status")

        expect(page).to have_content("Lot #'s")
        expect(page).to have_content(@order.machine.name)
        expect(page).to have_content(@order.needed_by)
        expect(page).to have_content(@order.user.first_name)
        expect(page).to have_content(@order.comment)
      end

      scenario "user updates an order" do
        visit edit_order_path(@order)

        fill_in "order_kit_orders_attributes_0_lot_numbers", with: "Test Text"

        select("In Progress", from: "order_status")

        click_on "Update"

        expect(page).to have_content("Test Text")
        expect(page).to have_content("Status: In Progress")
      end
    end

    scenario "visitor attempts update an order" do
      order = FactoryGirl.create(:order)

      visit order_path(order)

      expect(page).to have_content("You need to sign in")
    end
  end
