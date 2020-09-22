require 'rails_helper'

RSpec.describe Goal, type: :model do
  context "should be valid" do
    it "when associated with a user, name, description and due date is present." do
      test_user = FactoryBot.create(:user)
      test_goal = FactoryBot.create(:goal, user: test_user)

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
end
