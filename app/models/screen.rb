class Screen < ApplicationRecord
  validates :screen_number, presence: true, uniqueness: true
end
