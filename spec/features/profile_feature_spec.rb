require 'rails_helper'

feature "Profile", type: :feature do
  context "as a student" do
    given!(:student) { create :student, password: "password" }
    given!(:parent)  { create :parent }

    background(:each) do
      visit new_session_path
      fill_in "email", with: student.email
      fill_in "password", with: "password"
      click_button "Login"
    end

    context "I want to share" do
      given(:email)     { Faker::Internet.email }
      background(:each) { visit share_profile_path }

      scenario "with email that has been registered" do
        fill_in "email", with: parent.email
        click_button "Share"

        expect(page).to have_content "Kamu sudah pernah share ke email tersebut"
      end

      scenario "with email that hasn't been registered" do
        fill_in "email", with: email
        click_button "Share"

        expect(page).to have_content "Hasil kamu sudah di share"
        expect(Parent.exists? email: email).to be
      end
    end
  end
end
