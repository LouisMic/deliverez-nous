class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def dashboard
    @shows = Booking.where(user: current_user)
    @is_seller = current_user.seller

    if @is_seller
      @user_shows = Show.where(user_id: current_user)
      # @bookings = current_user.shows.map {|show| show.bookings }.flatten
      # Scope your query to the dates being shown:
      start_date = params.fetch(:start_date, Date.today).to_date
      @bookings = Booking.where(date: start_date.beginning_of_month.beginning_of_week..start_date.end_of_month.end_of_week)

      user_shows_ids = current_user.shows.map { |show| show.id }

      user_bookings = @bookings.select { |booking| user_shows_ids.include?(booking.show_id) }
    end
  end

  def booking
  end
end
