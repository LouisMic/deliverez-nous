class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update destroy]
  def new
  end

  def create
    @address = params[:address]
    @date = params[:date]
    @booking = Booking.new(address: @address, start_time: @date)
    @show = Show.find(params[:id])
    @booking.show = @show
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
    @show = Show.find(@booking.show.id)
  end

  def update
    @booking.update(validated: true)
    redirect_to dashboard_bookings_path, notice: 'Spectacle confirmé avec succès!'
  end

  def destroy
    @booking.destroy
    redirect_to dashboard_bookings_path, notice: 'Spectacle annulé.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
