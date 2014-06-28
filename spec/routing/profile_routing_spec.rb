require 'rails_helper'

describe "Profile", type: :routing do
  it 'routes to GET profile_path' do
    expect(get: profile_path).to be_routable
  end
end
