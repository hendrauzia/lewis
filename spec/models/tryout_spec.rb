require 'rails_helper'

describe Tryout, type: :model do
  it { is_expected.to have_db_column(:answers) }
  it { is_expected.to have_db_column(:score) }

  it { is_expected.to belong_to(:student) }
  it { is_expected.to belong_to(:quiz) }

  it { is_expected.to validate_numericality_of(:score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100).only_integer }
end
