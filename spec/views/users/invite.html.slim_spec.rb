require 'rails_helper'

describe "users/invite.html.slim", type: :view do
  it "display email" do
    parent = create(:parent)
    assign(:user, parent)
    render

    expect(Capybara.string(rendered)).to have_field(:email, with: parent.email)
  end
end
