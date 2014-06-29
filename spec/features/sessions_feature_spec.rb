require 'rails_helper'

feature "Login" do
  context "email doesn't exists" do
    it "display flash notification" do
      visit new_session_path
      fill_in "email", with: "not-exists@email.com"
      fill_in "password", with: "password"
      click_button "Login"

      expect(page).to have_content "Email belum terdaftar"
    end
  end

  context "email exists" do
    before { @user = create(:user) }

    context "password invalid" do
      it "display flash notification" do
        visit new_session_path
        fill_in "email", with: @user.email
        fill_in "password", with: "invalid password"
        click_button "Login"

        expect(page).to have_content "Password salah"
      end
    end

  end
end
