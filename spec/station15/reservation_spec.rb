require 'rails_helper'

RSpec.describe Reservation, type: :model do
    describe 'Station15 operate multiple theaters' do
        # テストデータの用意
        let(:theater) { create(:theater) }
        let(:screen) { create(:screen, theater_id: theater.id) }
        let(:movie) { create(:movie, screen_id: screen.id, theater_id: theater.id) }
        let(:sheet) { create(:sheet) }
        let(:schedule) { create(:schedule, movie_id: movie.id) }
        let(:user) { create(:user) }

        # 用意したテストデータをもとに予約を作成
        let(:reservation) { create(:reservation, { movie_id: movie.id, sheet_id: sheet.id, schedule_id: schedule.id, theater_id: theater.id, screen_id: screen.id, user_id: user.id }) }

        # 映画館、スクリーン、座席、時間帯が重複する予約を作成
        let(:duplicated_reservation) do
            build(:reservation, { date: reservation.date, movie_id: movie.id, sheet_id: sheet.id, schedule_id: schedule.id, theater_id: theater.id, screen_id: screen.id, user_id: user.id })
        end

        it '映画館・スクリーン・座席・時間帯すべてが同一の予約は複数存在しないこと' do
            expect(duplicated_reservation).not_to be_valid
        end
    end
end
