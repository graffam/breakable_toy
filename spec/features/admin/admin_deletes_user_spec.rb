require "rails_helper"

feature 'admin deletes user', %{
  As an admin
  I want to be able to delete a user
  so that I may remove users who no longer need access
  } do

    # Acceptance Criteria:
    # [X] I must be able to delete a user
    # [X] I'm asked to confirm deleting a user
    # [X] I must be an admin to delete a user
    # [X] I'm notified on success

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }

  scenario "admin deletes a user" do
    user = FactoryGirl.create(:user, first_name: "Alex")

    login_as(admin)

    visit admin_users_path

    click_link ("delete#{user.id}")

    expect(page).to_not have_content(user.first_name)
    expect(page).to have_content("User #{user.email} deleted")
  end
end
