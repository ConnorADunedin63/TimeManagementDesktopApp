require 'rails_helper'

RSpec.describe "User requests", type: :request do
    context "for the sign up page" do
        it "should render the sign up page." do
            get signup_path
            expect(response.code).to eq "200"
        end

        it "should create a user and redirect to the dashboard." do
            post signup_path, params: {user: {name: "John Doe", email: "john@testUser.com", password: "test123", password_confirmation: "test123"}}
            expect(response).to redirect_to(action: "page_requires_login", controller: "sessions")
        end
    end
end