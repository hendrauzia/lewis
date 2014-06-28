FactoryGirl.define do
  factory :scholarship do
    score 0
    discount 0

    trait :stupid do
      score 25
      discount 0
    end

    trait :average do
      score 50
      discount 0.3
    end

    trait :smart do
      score 75
      discount 0.5
    end

    trait :genius do
      score 100
      discount 1
    end
  end
end
