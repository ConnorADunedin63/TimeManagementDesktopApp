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
      get "/goals/new"
      expect(response.code).to eq "302"

      testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
      expect(User.count).to eq 1
      post login_path, params: {email: "john@testUser.com", password: "test123"}

      get "/goals/new"
      expect(response.code).to eq "200"
    end
  end
end
