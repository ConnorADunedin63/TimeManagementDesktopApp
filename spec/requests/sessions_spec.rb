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
end