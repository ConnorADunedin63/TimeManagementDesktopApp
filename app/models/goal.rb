class Goal < ApplicationRecord
    scope :short_term, -> { where("? - due_date < ?", Time.zone.now,  7862400.0) }
    scope :long_term, -> { where("? - due_date >= ?", Time.zone.now,  7862400.0) }
    scope :ongoing, -> { where("due_date IS NIL")}
    scope :due, -> { where("due_date > ?"), Time.zone.now}
    
    belongs_to :user
    validates :name, presence: true
end
