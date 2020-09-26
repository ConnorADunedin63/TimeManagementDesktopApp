class User < ApplicationRecord
    has_many :goals
    validates :name, presence: true
    validates :email, presence: true

    has_secure_password
end