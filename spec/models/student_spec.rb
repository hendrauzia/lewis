require 'rails_helper'

describe Student, type: :model do
  it_behaves_like User
  it { should have_many(:parents).through(:families) }
end
