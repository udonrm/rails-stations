class Admin::MoviesController < ApplicationController
  def index
    @movies = Movie.all
    @theaters = Theater.all
  end

  def show
    @movie = Movie.find(params[:id])
    @schedules = @movie.schedules
  end

  def new
    @movie = Movie.new
    if params[:theater_id].present?
      @theater = Theater.find(params[:theater_id])
      @screens = @theater.screens
    else
      redirect_to admin_movies_path
    end
  end

  def create
    @movie = Movie.new(movie_params)
    @theater = Theater.find(params[:movie][:theater_id])
    @screens = @theater.screens
    if @movie.save
      redirect_to admin_movies_path
    else
      render :new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      redirect_to admin_movies_path
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to admin_movies_path
  end

  private

  def movie_params
    params.require(:movie).permit(:screen_id, :name, :year, :description, :image_url, :is_showing, :theater_id)
  end
end
