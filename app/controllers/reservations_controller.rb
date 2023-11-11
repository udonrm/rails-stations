class ReservationsController < ApplicationController
    def new
        @reservation = Reservation.new
        @movie = Movie.find(params[:movie_id])
        @date = params[:date]
        @sheet = params[:sheet_id]
        @schedule = params[:schedule_id]
        
        if !@date || !@sheet
            flash.now[:alert] = '必要なパラメータがありません。'
            render :new, status: :bad_request
        end
    end

    def create
        @reservation = Reservation.new(reservation_params)
        @movie = Movie.find(params[:reservation][:movie_id])
        @reserved_sheet =  Reservation.find_by(date: params[:reservation][:date], schedule_id: params[:reservation][:schedule_id], sheet_id: params[:reservation][:sheet_id])

        if @reserved_sheet
            flash[:notice] = 'その座席はすでに予約済みです'
            redirect_to movie_reservation_path(@movie, schedule_id: params[:reservation][:schedule_id], date: params[:reservation][:date])
            return
        end

        if @reservation.save
            flash[:success] = '予約が完了しました'
            redirect_to movie_path(@movie)
        else
            render :new
        end
    end

    private
    def reservation_params
        params.require(:reservation).permit(:date, :sheet_id, :schedule_id, :email, :name, :movie_id)
    end
end
