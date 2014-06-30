class Parent < User
  has_many :families
  has_many :children, through: :families, class_name: 'Student', source: :student
end
