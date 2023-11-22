class MoviesController < ApplicationController
  def index
    @movies = Movie.all

    # キーワードでの絞り込み
    @movies = @movies.looks(params[:keyword]) if params[:keyword].present?

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

    redirect_to movie_path(@movie) and return if !params[:date] || !params[:schedule_id]

    @schedule = Schedule.find(params[:schedule_id])
    @sheets = Sheet.order(:row, :column)
    @date = params[:date]
  end
end
