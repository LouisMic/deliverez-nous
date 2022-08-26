class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show update destroy]
  def new
  end

  def create
    # raise
    @address = params[:address]
    # @booking = Booking.create(@address,...)
  end

  def index
  end

  def show
    @show = Show.find(@booking.show.id)
    @bookings = Booking.where(id: params[:id])
    @markers = @bookings.geocoded.map do |booking|
      {
        lat: booking.latitude,
        lng: booking.longitude,
        info_window: render_to_string(partial: "info_window", locals: { booking: booking }),
        image_url: helpers.asset_url("logo4b.png")
      }
    end
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
