class User < ActiveRecord::Base
  validates :email, presence: true, uniqueness: true
  validates :password, confirmation: true
  validates :first_name, presence: true

  has_secure_password
end
