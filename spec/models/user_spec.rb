require 'rails_helper'

RSpec.describe "User model", type: :model do
    context "should not be valid" do
        it "if the name is not present." do
            test_user = FactoryBot.build(:user, name: "")
            expect(test_user.save).to eq false
        end

        it "if the email is not present." do
            test_user = FactoryBot.build(:user, email: "")
            expect(test_user.save).to eq false
        end

        it "if the password is not present." do
            test_user = FactoryBot.build(:user, password: "")
            expect(test_user.save).to eq false
        end

        it "if the password and confirmation do not match." do
            test_user = FactoryBot.build(:user, password_confirmation: "Incorrect password")
            expect(test_user.save).to eq false
        end
    end

    context "should be valid" do
        it "if the name, email are present and password match." do
            test_user = FactoryBot.build(:user)
            expect(test_user.save).to eq true
        end
    end
end