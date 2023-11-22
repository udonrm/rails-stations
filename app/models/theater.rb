class Theater < ApplicationRecord
  validates :theater_number, presence: true, uniqueness: true
end
