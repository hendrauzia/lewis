require 'rails_helper'

describe "tryouts/new.html.slim" do
  let(:quiz)   { create :quiz, :with_description }
  let(:tryout) { build :tryout, quiz: quiz }

  before(:each) { assign :tryout, tryout }

  context 'all states' do
    before(:each) { render }

    it { expect(rendered).to have_content quiz.name }
    it { expect(rendered).to have_content quiz.description }
  end

  context "not signed in" do
    before(:each) { render }

    it { expect(rendered).to have_content "Email" }
    it { expect(rendered).not_to have_content "Profile" }
  end

  context "signed in" do
    before do
      session[:user_id] = 999
      render
    end

    it { expect(rendered).not_to have_content "Email" }
    it { expect(rendered).to have_content "Profile" }
  end
end
