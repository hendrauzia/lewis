require 'rails_helper'

describe "Tryouts", type: :routing do
  it 'routes to GET new_tryout_path' do
    expect(get: new_tryout_path).to be_routable
  end
end