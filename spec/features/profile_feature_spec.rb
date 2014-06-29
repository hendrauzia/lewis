require 'rails_helper'

feature "Profile", type: :feature do
  before do
    @student = create(:student)
    @parent  = create(:parent)
    @quiz    = create(:quiz)

    visit new_session_path
    fill_in "email", with: @student.email
    fill_in "password", with: "password"
    click_button "Login"
  end

  feature "Share", type: :feature do
    context "email has been registered" do
      it "display flash notification" do
        visit share_profile_path
        fill_in "email", with: @parent.email
        click_button "Share"

        expect(page).to have_content "Email sudah terdaftar"
      end
    end

    context "email hasn't been registered" do
      before do
        visit share_profile_path
        fill_in "email", with: 'not-exist@lol.lol'
        click_button "Share"
      end

      it "display flash notification" do
        expect(page).to have_content "Hasil kamu sudah di share"
      end

      it "save the record" do
        expect(Parent.exists?(email: 'not-exist@lol.lol')).to be(true)
      end
    end
  end
end
