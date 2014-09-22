require 'rails_helper'

describe "Tryouts" do
  it 'routes to GET new_tryout_path' do
    expect(get: new_tryout_path).to be_routable
  end

  it 'routes to POST create_tryout_path' do
    expect(post: tryouts_path).to be_routable
  end
end
