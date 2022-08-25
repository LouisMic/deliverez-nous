class PagesController < ApplicationController
  def home
    @booking = Booking.new()
  end

  def dashboard
    @shows = Booking.where(user: current_user)
    @is_seller = current_user.seller

    if @is_seller
      @user_shows = Show.where(user_id: current_user)
      start_date = params.fetch(:start_date, Date.today).to_date
      @my_shows_bookings = Booking.where(show_id: current_user.shows.pluck(:id))
      @bookings = @my_shows_bookings.where(start_time: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)
    end
  end
end
