require 'rails_helper'

describe "routes for Tryouts" do
  it { expect(get: root_path).to route_to 'tryouts#new' }

  it { expect(get: new_tryout_path).to be_routable }
  it { expect(post: tryouts_path).to be_routable }
end
