class Goal < ApplicationRecord
    scope :short_term, -> { where("due_date < ?", (Time.zone.now + 90.days)).where("due_date > ?", Time.zone.now) }
    scope :long_term, -> { where("due_date >= ?", (Time.zone.now + 90.days)).where("due_date > ?", Time.zone.now) }
    scope :ongoing, -> { where("due_date IS NULL") }
    scope :due, -> { where("due_date < ?", Time.zone.now)}

    belongs_to :user
    validates :name, presence: true
end
