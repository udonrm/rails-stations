class HomesController < ApplicationController
    def top
        @latest_ranking = Rank.where(rank_date: Date.today)
    end
end
