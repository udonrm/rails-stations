class Movie < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: %i[screen_id theater_id] }
  validates :screen_id, presence: true
  validates :theater_id, presence: true
  validates :year, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :is_showing, presence: true

  has_many :schedules
  has_many :reservations

  def self.looks(search)
    if search
      where('name LIKE ?', "%#{search}%").or(where('description LIKE ?', "%#{search}%"))
    else
      []
    end
  end
end
