class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true, confirmation: true
  validates :password, confirmation: true
  validates :first_name, presence: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 8 }

  has_secure_password
end
