FactoryGirl.define do
  factory :user do
    email      { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    password   { Faker::Internet.password }
  end
end
