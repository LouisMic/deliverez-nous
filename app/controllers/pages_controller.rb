class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def dashboard
    @shows = Booking.where(user: current_user)
    @is_seller = current_user.seller

    if @is_seller
      @user_shows = Show.where(user_id: current_user)
      @bookings = current_user.shows.map {|show| show.bookings }.flatten
    end
  end

  def booking
  end
end
