require 'rails_helper'

RSpec.describe "Goals", type: :request do

  describe "GET /index" do
    it "redirects user unless logged in." do
      get "/goals"
      expect(response.code).to eq "302"

      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      get "/goals"
      expect(response.code).to eq "200"
    end
  end

  describe "GET /new" do
    it "redirects user unless logged in." do
      get new_goal_path
      expect(response.code).to eq "302"

      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      get new_goal_path
      expect(response.code).to eq "200"
    end
  end

  describe "GET /show" do
    it "redirects user unless logged in." do
      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      testGoal = FactoryBot.create(:goal, user: testUser)

      get view_goal_path(testGoal)
      expect(response.code).to eq "302"
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      get view_goal_path(testGoal)
      expect(response.code).to eq "200"
    end
  end

  describe "GET /edit" do
    it "redirects user unless logged in." do
      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      testGoal = FactoryBot.create(:goal, user: testUser)

      get edit_goal_path(testGoal)
      expect(response.code).to eq "302"
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      get edit_goal_path(testGoal)
      expect(response.code).to eq "200"
    end
  end

  describe "POST /update" do
    it "redirects user unless logged in and user should be able to update a goal." do
      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      testGoal = FactoryBot.create(:goal, user: testUser)

      post update_goal_path(testGoal, {goal: {name: "Updated goal name"}})
      expect(response.code).to eq "302"
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      post update_goal_path(testGoal, {goal: {name: "Updated goal name"}})
      expect(response.code).to eq "302"
      testGoal.reload

      expect(testGoal.name).to eq "Updated goal name"
      expect(testGoal.description).to eq "Test description"
      expect(testGoal.due_date).to eq Time.zone.parse("2020-09-17 15:39:51")
      expect(testGoal.tasks).to eq "Task 1, Task 2"

    end
  end

  describe "POST /destroy" do
    it "redirects user unless logged in and user should be able to delete a goal." do
      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      testGoal = FactoryBot.create(:goal, user: testUser)

      post destroy_goal_path(testGoal)
      expect(response.code).to eq "302"
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      post destroy_goal_path(testGoal)
      expect(response.code).to eq "302"
      expect(testUser.goals.any?).to be false

    end
  end
end
