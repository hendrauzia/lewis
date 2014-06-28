# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :student do
    email "student@lol.lol"
    first_name "Student"
    password "password"
  end
end
