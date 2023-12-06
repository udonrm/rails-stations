class Reservation < ApplicationRecord
  belongs_to :movie
  belongs_to :schedule
  belongs_to :sheet
  belongs_to :user
  belongs_to :theater
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :date, uniqueness: { scope: %i[schedule_id sheet_id date screen_id theater_id] }

  def self.reminder_email
    Reservation.where(date: Time.zone.tomorrow).each do |reservation|
      UserMailer.reservation_reminder_email(reservation).deliver_now
    end
  end

  def self.calculate_ranking
    results = Reservation.joins(:movie)
                         .where(date: Date.today - 30..Date.today)
                         .group('movies.name')
                         .select('movies.name, COUNT(*) as reservation_count')
                         .order('reservation_count DESC')

    results.each do |result|
      Rank.create!(
        movie_id: Movie.find_by(name: result.name).id,
        rank_date: Date.today,
        reservation_count: result.reservation_count
      )
    end
  end
end
