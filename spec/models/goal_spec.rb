require 'rails_helper'

RSpec.describe Goal, type: :model do
  context "should be valid" do
    it "when associated with a user, name, description and due date is present." do
      test_user = FactoryBot.create(:user)
      test_goal = FactoryBot.create(:goal, user: test_user)

      expect(test_goal.save).to eq true
    end

    it "when due_date is blank." do
      test_user = FactoryBot.create(:user)
      test_goal = FactoryBot.create(:goal, due_date: nil, user: test_user)

      expect(test_goal.save).to eq true
    end

    it "when description is blank" do
      test_user = FactoryBot.create(:user)
      test_goal = FactoryBot.create(:goal, description: "", user: test_user)

      expect(test_goal.save).to eq true
    end
  end 

  context "should be invalid" do
    it "when not associated with a user." do
      test_goal = FactoryBot.build(:goal)

      expect(test_goal.save).to eq false 
    end
  end

  context "short term scope" do
    it "should only return goals who's due date is less than 3 months away" do
      test_user = FactoryBot.create(:user)
      short_term_goal = FactoryBot.create(:goal, :short_term, user: test_user)
      long_term_goal = FactoryBot.create(:goal, :long_term, user: test_user)
      ongoing_goal = FactoryBot.create(:goal, :ongoing, user: test_user)
      due_goal = FactoryBot.create(:goal, :due, user: test_user)

      expect(Goal.short_term.count).to eq 1
      expect(Goal.short_term.first.name).to eq "Short term goal"
    end
  end

  context "long term scope" do
    it "should only return goals who's due date is 3 or more months away" do
      test_user = FactoryBot.create(:user)
      short_term_goal = FactoryBot.create(:goal, :short_term, user: test_user)
      long_term_goal = FactoryBot.create(:goal, :long_term, user: test_user)
      ongoing_goal = FactoryBot.create(:goal, :ongoing, user: test_user)
      due_goal = FactoryBot.create(:goal, :due, user: test_user)

      expect(Goal.all.long_term.count).to eq 1
      expect(Goal.all.long_term.first.name).to eq "Long term goal"
    end
  end

  context "ongoing scope" do
    it "should only return goals who's due date is nil" do
      test_user = FactoryBot.create(:user)
      short_term_goal = FactoryBot.create(:goal, :short_term, user: test_user)
      long_term_goal = FactoryBot.create(:goal, :long_term, user: test_user)
      ongoing_goal = FactoryBot.create(:goal, :ongoing, user: test_user)
      due_goal = FactoryBot.create(:goal, :due, user: test_user)

      expect(Goal.all.ongoing.count).to eq 1
      expect(Goal.all.ongoing.first.name).to eq "Ongoing goal"
    end
  end

  context "due scope" do
    it "should only return goals who's due date has past" do
      test_user = FactoryBot.create(:user)
      short_term_goal = FactoryBot.create(:goal, :short_term, user: test_user)
      long_term_goal = FactoryBot.create(:goal, :long_term, user: test_user)
      ongoing_goal = FactoryBot.create(:goal, :ongoing, user: test_user)
      due_goal = FactoryBot.create(:goal, :due, user: test_user)

      expect(Goal.due.count).to eq 1
      expect(Goal.due.first.name).to eq "Due goal"
    end
  end
end


