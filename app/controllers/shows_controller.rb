class ShowsController < ApplicationController
  before_action :set_show, only: [:show, :edit, :update, :destroy]
  def new
    @show = Show.new
  end

  def create
    @show = Show.new(show_params)
    @show.geocode
    @show.user = current_user
    if @show.save
      @show.save
      @show.user.update(seller: true)
      redirect_to shows_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @address = params[:booking][:address]
    location = Geocoder.search(@address)
    @latitude = location[0].latitude
    @longitude = location[0].longitude
    @category = params[:booking][:category]
    @date = Date.new(params[:booking]['date(1i)'].to_i, params[:booking]['date(2i)'].to_i, params[:booking]['date(3i)'].to_i)
    @all_shows = Show.where(category_id: @category)
    @selected_shows = @all_shows.select do |show|
      show.distance_to([@latitude, @longitude]) < show.location_radius
    end
    @shows = @selected_shows.reject do |show|
      show.bookings.where(date: @date).present?
    end
  end

  def show
  end

  def edit
  end

  def update
    @show.update(show_params)
    if @show.save
      redirect_to show_path(@show)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @show.destroy
    redirect_to dashboard_user_shows_path, notice: 'Spectacle supprimé.'
  end

  private

  def show_params
    params.require(:show).permit(:name, :category_id, :description, :company, :location_center, :location_radius, :price, photos: [])
  end

  def set_show
    @show = Show.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:address, :category, :date)
  end
end
