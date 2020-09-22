FactoryBot.define do
  factory :goal do
    name { "Test goal" }
    description { "Test description" }
    due_date { "2020-09-17 15:39:51" }
    tasks { ["Task 1", "Task 2"] }
  end
end
