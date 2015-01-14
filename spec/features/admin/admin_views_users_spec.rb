require "rails_helper"


require "rails_helper"

feature 'admin user functions', %{
  As an admin
  I want to be able to see the users
  so that I may better manage my application
  } do
    # Acceptance Criteria:
    # [] I must see a list of all the users
    # [] be able to click on the user to view their details
    # [] I must have admin rights to view users
    # [] I should be able to sort users by name, date joined, and email

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }

  scenario "admin visits index page of users" do
    login_as(admin)

    visit admin_users_path

    expect(page).to have_content(user.email)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.date_created)
  end
end
