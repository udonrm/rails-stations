class Admin::TheatersController < ApplicationController
  def new
    @theater = Theater.new
  end

  def create
    @theater = Theater.new(theater_params)
    @theater.save
    redirect_to admin_movies_path
  end

  def screens
    theater = Theater.find(params[:id])
    screens = theater.screens

    respond_to do |format|
      format.json { render json: screens }
    end
  end

  private

  def theater_params
    params.require(:theater).permit(:name)
  end
end
