class PagesController < ApplicationController
  def home
    @booking = Booking.new
  end

  def dashboard
  end
end
