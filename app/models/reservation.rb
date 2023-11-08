class Reservation < ApplicationRecord
    belongs_to :schedule
    belongs_to :sheet
    validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
