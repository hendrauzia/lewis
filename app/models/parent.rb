class Parent < User
  has_many :families
  has_many :children, through: :families, foreign_key: :student_id, class_name: 'Student'
end
