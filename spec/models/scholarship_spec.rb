require 'rails_helper'

describe Scholarship, type: :model do
  it { is_expected.to have_db_column(:score).of_type(:integer) }
  it { is_expected.to have_db_column(:discount).of_type(:float) }

  it { is_expected.to validate_numericality_of(:score).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(100).only_integer }
  it { is_expected.to validate_numericality_of(:discount).is_greater_than_or_equal_to(0).is_less_than_or_equal_to(1) }
end
