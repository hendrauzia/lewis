require 'rails_helper'

describe "Quizzes", type: :routing do
  it 'routes to GET /quizzes/:id(.:format)' do
    expect(get: '/quizzes/123').to be_routable
  end
end
