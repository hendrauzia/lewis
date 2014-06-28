require 'rails_helper'

describe Family, type: :model do
  it { should belong_to(:student) }
  it { should belong_to(:parent) }
end
