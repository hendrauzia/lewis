# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    email "lol@lol.lol"
    first_name "Someone"
    password "password"
  end
end
