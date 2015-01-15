require "rails_helper"

feature "admin updates a user", %{
  As an admin
  I want to be able to update user's information
  so that I may better manage my application
  } do
  # Acceptance Criteria:
  # [X] Updateable user information
  # [X] notification when users information is updated
  # [X] I must have admin to update users information

  let(:admin) { FactoryGirl.create(:user, role: "admin") }
  let!(:user) { FactoryGirl.create(:user) }

  context "admin is signed in" do
    before(:each) do
      login_as(admin)
    end

    scenario "Admin updates a users status" do

      visit admin_user_path(user)

      click_on "Update User Information"

      fill_in "Email", with: "new@email.com"
      fill_in "First name", with: "New"
      fill_in "Last name", with: "Name"

      click_on "Update"

      expect(page).to have_content("User Successfully Updated")
      expect(page).to have_content("new@email.com")
    end
  end

  scenario "unathorized users are redirected" do
    login_as(user)

    visit admin_users_path

    expect(page).to have_content("not authorized")
    expect(current_path).to eq(root_path)
  end
end
