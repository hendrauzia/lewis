FactoryGirl.define do
  factory :quiz do
    name 'Some Quiz Name'
    questions Hash[
      "1" => {
        "description" => "Some description of the question",
        "options" => {
          "a" => "Some answer",
          "b" => "Another answer",
          "c" => "Yet another answer"
        }
      },
      "2" => {
        "description" => "Another description of the question",
        "options" => {
          "a" => "Yo, some answer",
          "b" => "Yo, another answer",
          "c" => "Yo, yet another answer",
          "d" => "Yo, here's another answer",
          "e" => "Yo, here's yet another answer"
        }
      },
      "3" => {
        "description" => "Yet, another description of the question",
        "options" => {
          "a" => "Whoa, some answer",
          "b" => "Whoa, another answer",
          "c" => "Whoa, yet another answer",
          "d" => "Whoa, here's another answer"
        }
      }
    ]
    answers Hash[ "1" => "a", "2" => "c", "3" => "b" ]
    published true

    trait :with_description do
      description "Some quiz description"
    end
  end
end
