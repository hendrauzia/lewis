FactoryGirl.define do
  factory :tryout do
    answers Hash[]

    trait :no_score do
      answers Hash[ "1" => "x", "2" => "y", "3" => "z" ]
    end

    trait :average_score do
      answers Hash[ "1" => "a", "2" => "c", "3" => "x" ]
    end

    trait :perfect_score do
      answers Hash[ "1" => "a", "2" => "c", "3" => "b" ]
    end
  end
end
