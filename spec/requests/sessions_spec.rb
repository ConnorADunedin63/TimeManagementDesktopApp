require 'rails_helper'

RSpec.describe "Session requests", type: :request do
    it "should display the welcome page." do
        get welcome_path
        expect(response.code).to eq "200"
    end

    it "should display the login page." do
        get login_path
        expect(response.code).to eq "200"
    end

    it "should not display authorized pages when not logged in, redirect instead." do
        get authorized_path
        expect(response.code).to eq "302"
    end

    it "should render the dashboard after successful login." do
        testUser = User.create(name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123")
        expect(User.count).to eq 1
        post login_path, params: {email: "john@testUser.com", password: "test123"}
        expect(response).to redirect_to(action: "page_requires_login")
    end
end