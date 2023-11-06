class Reservation < ApplicationRecord
    belongs_to :schedule
    validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
end
