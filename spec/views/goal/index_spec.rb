require 'rails_helper'

RSpec.describe "index view", type: :view do
    context "should display" do
        it "the logged in users goals only." do
            test_user_1 = FactoryBot.create(:user)
            test_user_2 = FactoryBot.create(:user, name: "Jane Doe", email: "jane@example.com")

            goal_1 = FactoryBot.create(:goal, user: test_user_1)
            goal_2 = FactoryBot.create(:goal, name: "Test goal 2", user: test_user_2)

            expect(test_user_1.goals.length).to be 1
            expect(test_user_2.goals.length).to be 1

            assign(:goals, test_user_1.goals)

            render template: "goals/index.html.erb"

            expect(rendered).to include("Test goal")
            expect(rendered).not_to include("Test goal 2")
        end
    end
end