require 'rails_helper'

describe Family do
  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:parent) }
end
