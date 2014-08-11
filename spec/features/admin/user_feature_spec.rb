require 'rails_helper'

feature "Admin/User", type: :feature do
  let(:admin) { create(:admin, password: "password") }
  let!(:user) { create(:user) }
  before do
    visit new_admin_user_session_path
    fill_in "admin_user_email", with: admin.email
    fill_in "admin_user_password", with: "password"
    click_button "Login"
  end

  feature "Index", type: :feature do
    it "have proper content" do
      visit admin_users_path

      expect(page).to have_content("Id")
      expect(page).to have_content("Email")
      expect(page).to have_content("Name")
      expect(page).to have_content("Phone")
      expect(page).to have_content("City")
      expect(page).to have_content("Address")

      expect(page).to_not have_content("New")
      expect(page).to_not have_content("Edit")
      expect(page).to_not have_content("Delete")
    end
  end
end
