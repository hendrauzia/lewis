require 'rails_helper'

describe Parent do
  it_behaves_like User
  it { is_expected.to have_many(:children).through(:families).class_name('Student').source(:student) }
end
