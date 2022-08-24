class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def dashboard
    if params[:seller]
      @tabs = params[:seller]
      @my_shows = Show.where(user_id: current_user)
    elsif params[:bookings]
      @bookings = current_user.shows.map {|show| show.bookings }.flatten
    else
      @tabs = 'buyer'
      @shows = Booking.where(user_id: current_user)
    end
  end

  def booking
  end
end
