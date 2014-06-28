FactoryGirl.define do
  factory :quiz do
    name 'Some Quiz Name'
    answers Hash[ "1" => "a", "2" => "c", "3" => "b" ]
    published true
  end
end
