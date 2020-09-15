require 'factory_bot'

FactoryBot.define do
    factory :user do
        name {"John Doe"}
        email {"john@example.com"}
        password {"test123"}
        password_confirmation {"test123"}
    end
end