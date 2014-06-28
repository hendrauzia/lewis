require 'rails_helper'

describe Parent, type: :model do
  it_behaves_like User
  it { should have_many(:children).through(:families).with_foreign_key(:student_id).class_name('Student') }
end
