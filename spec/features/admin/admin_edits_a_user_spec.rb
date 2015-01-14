require "rails_helper"

feature 'admin views users', %{
  As an admin
  I want to be able to see the users
  so that I may better manage my application
  } do
  # Acceptance Criteria:
  # [X] I must be able to visit the edit page from the show page
  # [] I must be able to change their email and password
  # [] I must be the admin to do so

  let(:admin) { FactoryGirl.create(:user, role: 'admin') }
  let!(:user) { FactoryGirl.create(:user) }

  context "admin is signed in" do
    before(:each) do
      login_as(admin)
    end

  scenario "admin visits the edit page" do
    visit admin_user_path(user)

    click_on "Edit User"

    expect(page).to have_content(user.email)
    expect(page).to have_content(user.first_name)
    expect(page).to have_content(user.last_name)
    expect(page).to have_content(user.created_at)

  end
  end
end
