class BookingsController < ApplicationController
  def new
  end

  def create
    raise
    @address = params[:address]
    @booking = Booking.create(@address,...)
  end

  def index
  end

  def update
  end

  def destroy
  end
end
