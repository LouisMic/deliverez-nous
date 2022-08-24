class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def dashboard
    if params[:seller]
      @tabs = params[:seller]
      @my_shows = Show.where(user_id: current_user)
    else
      @tabs = 'buyer'
      @shows = Booking.where(user_id: current_user)
    end
  end

  def booking
    @bookings = Booking.show.where(user_id: current_user)
    raise
  end
end
