require 'rails_helper'

describe "profile/index.html.erb", type: :view do
  before { @user = create(:user) }

  context "student" do
    it "renders user name" do
      assign(:user, @user)
      render
      expect(rendered).to have_content(@user.first_name)
    end
  end
end
