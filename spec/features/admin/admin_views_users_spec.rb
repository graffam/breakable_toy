require "rails_helper"

feature 'admin views users', %{
  As an admin
  I want to be able to see the users
  so that I may better manage my application
  } do
    # Acceptance Criteria:
    # [X] I must see a list of all the users
    # [X] be able to click on the user to view their details
    # [X] I must have admin rights to view users
    # [X] I should be able to sort users by name, date joined, and email

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }

  context "admin is signed in" do
    before(:each) do
      login_as(admin)
    end

    scenario "admin visits index page of users" do
      visit admin_users_path

      expect(page).to have_content(user.email)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.created_at)
    end

    scenario "admin visits details page of user" do
      visit admin_users_path

      click_on ("#{user.id}")

      expect(page).to have_content(user.email)
      expect(page).to have_content(user.first_name)
      expect(page).to have_content(user.last_name)
      expect(page).to have_content(user.created_at)
      expect(page).to have_content(user.role)
      expect(page).to have_link("Back")
    end
  end

  scenario "unathorized users are redirected" do
    login_as(user)

    visit admin_users_path

    expect(page).to have_content("not authorized")
    expect(current_path).to eq(root_path)
  end
end
