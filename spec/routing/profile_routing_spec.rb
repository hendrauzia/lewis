require 'rails_helper'

describe "Profile" do
  it 'routes to GET profile_path' do
    expect(get: profile_path).to be_routable
  end

  it 'routes to GET share_profile_path' do
    expect(get: share_profile_path).to be_routable
  end

  it 'routes to POST notify_profile_path' do
    expect(post: notify_profile_path).to be_routable
  end
end
