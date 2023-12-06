require 'rails_helper'

RSpec.describe Reservation, type: :model do
    describe '最新の映画ランキングの集計' do
        before do
            movie1 = create(:movie)
            movie2 = create(:movie)

            #過去30日間の予約
            (Date.today - 30).upto(Date.today) do |date|
                create(:reservation, date: date, movie: movie1)
            end

            #31日前の予約
            create(:reservation, date: Date.today - 31, movie: movie2)
        end

        it 'ランキングが正しく集計されていること' do
            expect { Reservation.calculate_ranking }.to change { Rank.count }.by(1)

            rank = Rank.last
            expect(rank.movie_id).to eq(Movie.find_by(name: movie1.name).id)
            expect(rank.rank_date).to eq(Date.today)
            expect(rank.reservation_count).to eq(31)
        end
    end
end