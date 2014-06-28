require 'rails_helper'

describe Student, type: :model do
  it_behaves_like User

  it { is_expected.to have_many(:tryouts) }
  it { is_expected.to have_many(:parents).through(:families) }
end
