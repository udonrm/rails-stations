class Movie < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :year, presence: true
    validates :description, presence: true
    validates :image_url, presence: true
    validates :is_showing, presence: true

    def self.looks(search)
        if search
          self.where("name  = ?", search)
        else
          []
        end
    end
end
