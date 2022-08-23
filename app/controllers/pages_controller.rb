class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def dashboard
    if params[:seller]
      @tabs = params[:seller]
      @my_shows = Show.where(user_id: current_user)
    else
      @shows = Booking.where(user_id: current_user)
    end
  end
end
