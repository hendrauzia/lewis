require 'rails_helper'

describe "Sessions", type: :routing do
  it 'routes to GET new_session_path' do
    expect(get: new_session_path).to be_routable
  end

  it 'routes to POST sessions_path' do
    expect(post: sessions_path).to be_routable
  end
end
