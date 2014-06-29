class Student < User
  has_many :tryouts
  has_many :families
  has_many :parents, through: :families

  def discount
    return 0 if tryouts.count.zero?

    tryouts.order(discount: :desc).first.discount
  end
end
