class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def seller
    @tab = 'seller'
    @my_shows = Show.where(user_id: current_user)
    # raise
  end
end
