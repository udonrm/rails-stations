class MoviesController < ApplicationController
    def index
        @movies = Movie.all
        
        # キーワードでの絞り込み
        if params[:keyword].present?
            @movies = @movies.looks(params[:keyword])
        end

        # 公開中または公開予定の絞り込み
        if params[:is_showing] == '1'
            @movies = @movies.where(is_showing: true)
        elsif params[:is_showing] == '0'
            @movies = @movies.where(is_showing: false)
        end
        
    end

    def show
        @movie = Movie.find(params[:id])
        @schedules = @movie.schedules
    end

    def reservation
        @movie = Movie.find(params[:movie_id])

        if !params[:date] || !params[:schedule_id]
            redirect_to movie_path(@movie) and return
        end

        @sheets = Sheet.order(:row, :column)
        @schedule = Schedule.find(params[:schedule_id]) 
        @date = params[:date]
    end
end
