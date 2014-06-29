require 'rails_helper'

describe "users/invite.html.slim", type: :view do
  it "display email" do
    parent = create(:parent)
    assign(:parent, parent)
    render

    expect(Capybara.string(rendered)).to have_field(:email, with: parent.email, disabled: true)
  end
end
