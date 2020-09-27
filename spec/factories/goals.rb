FactoryBot.define do
  factory :goal do
    name { "Test goal" }
    description { "Test description" }
    due_date { Time.zone.parse("2020-09-17 15:39:51") }
    tasks { "Task 1, Task 2" }

    trait :short_term do
      name { "Short term goal" }
      due_date { Time.zone.now + 5.days }
    end

    trait :long_term do
      name { "Long term goal" }
      due_date { Time.zone.now + 6.months }
    end

    trait :ongoing do
      name { "Ongoing goal" }
      due_date { nil }
    end

    trait :due do
      name { "Due goal" }
      due_date { Time.zone.now - 5.days }
    end
  end
end
