class BookingsController < ApplicationController
  before_action :set_booking, only: %i[update destroy]
  def new
  end

  def create
    # raise
    @address = params[:address]
    # @booking = Booking.create(@address,...)
  end

  def index
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
