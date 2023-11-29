class Reservation < ApplicationRecord
  belongs_to :movie
  belongs_to :schedule
  belongs_to :sheet
  belongs_to :user
  belongs_to :theater
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :date, uniqueness: { scope: %i[schedule_id sheet_id date screen_id theater_id] }
end
