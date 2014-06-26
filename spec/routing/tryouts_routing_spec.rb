require 'rails_helper'

describe "Tryouts", type: :routing do
  it 'routes to GET /tryouts/:id(.:format)' do
    expect(get: '/tryouts/123').to be_routable
  end
end
