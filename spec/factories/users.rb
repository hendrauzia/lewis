# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "user@lol.lol"
    first_name "Someone"
    password "password"
  end
end
