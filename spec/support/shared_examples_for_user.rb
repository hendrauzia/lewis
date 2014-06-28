shared_examples User do
  it { is_expected.to have_db_column(:email).of_type(:string) }
  it { is_expected.to have_db_column(:first_name).of_type(:string) }
  it { is_expected.to have_db_column(:last_name).of_type(:string) }
  it { is_expected.to have_db_column(:phone).of_type(:string) }
  it { is_expected.to have_db_column(:city).of_type(:string) }
  it { is_expected.to have_db_column(:address).of_type(:string) }
  it { is_expected.to have_db_column(:password_digest).of_type(:string) }
  it { is_expected.to have_db_column(:type).of_type(:string) }

  it { is_expected.to respond_to(:password) }
  it { is_expected.to respond_to(:password_confirmation) }

  it { is_expected.to validate_presence_of(:email) }
  it { is_expected.to validate_uniqueness_of(:email) }
  it { is_expected.to validate_confirmation_of(:email) }
  it { is_expected.to validate_presence_of(:first_name) }
  it { is_expected.to validate_presence_of(:password_digest) }
  it { is_expected.to ensure_length_of(:password).is_at_least(8) }

  context "email and password without confirmation" do
    subject { build(:user) }
    it { is_expected.to be_valid }
  end
  context "password is blank" do
    subject { build(:user, password: "", password_confirmation: "") }
    it { is_expected.not_to be_valid }
  end
  context "password doesn't match confirmation" do
    subject { build(:user, password_confirmation: "mismatch") }
    it { is_expected.not_to be_valid }
  end

  pending "validates email format"
  pending "validates password format"
end
