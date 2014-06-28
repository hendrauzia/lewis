class Quiz < ActiveRecord::Base
  has_many :tryouts

  validates :name, presence: true

  scope :published, -> { where published: true }
end
