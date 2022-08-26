class BookingsController < ApplicationController
  before_action :set_booking, only: %i[update destroy]
  def new
  end

  def create
    @address = params[:address]
    @category = params[:category]
    @date = params[:start_time]
    raise
    @booking = Booking.new(address: @address, category: @category, start_time: @date)
    @show = Show.find(params[:id])
    @booking.show = @show
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
  end

  def show
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
