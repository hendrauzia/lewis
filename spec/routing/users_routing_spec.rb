require 'rails_helper'

describe "Users", type: :routing do

  it "routes to GET invite_user_path" do
    expect(get: invite_user_path).to be_routable
  end

  it "routes to PATCH update_user_path" do
    expect(patch: update_user_path).to be_routable
  end

end
