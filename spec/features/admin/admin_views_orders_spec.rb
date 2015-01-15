require "rails_helper"

feature "admin views orders", %{
  As an admin
  I want to be able to see the orders
  so that I may manage the orders
  } do
  # Acceptance Criteria:
  # [X] I must see a list of all the orders
  # [X] be able to click on the order to view their details
  # [X] I must have admin rights to view the orders admin page
  # [X] I should be able to sort orders by machine, date created, dated needed
  # [X] I should be able to delete an order from the index page
  let(:admin) { FactoryGirl.create(:user, role: "admin") }

  context "There are orders in the database" do
    before(:each) do
      login_as(admin)

      @order = FactoryGirl.create(:order)
    end

    scenario "Admin views the admin orders page" do

      visit admin_orders_path

      expect(page).to have_content(@order.user.first_name)
      expect(page).to have_content(@order.created_at)
      expect(page).to have_content(@order.needed_by)
      expect(page).to have_content(@order.machine.name)
    end

    scenario "Admin views the details of an order" do
      visit admin_orders_path

      click_on(@order.id)

      expect(page).to have_content (@order.comment)
      expect(current_path).to eq(order_path(@order))
    end

    scenario "Admin deletes an order" do

      visit admin_orders_path

      click_link ("delete#{@order.id}")

      expect(page).to_not have_content(@order.created_at)
      expect(page).to have_content("Order Successfully Deleted")
    end
  end
end
