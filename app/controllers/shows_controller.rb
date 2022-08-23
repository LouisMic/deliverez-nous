class ShowsController < ApplicationController
  def new
    @show = Show.new()
  end

  def create
    @show = Show.new(show_params)
    @show.user = current_user
    if @show.save
      redirect_to shows_path()
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @shows = Show.all()
  end

  def show
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    @show.update(show_params)
    if @show.save
      redirect_to show_path(@show)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
  end

  private

  def show_params
    params.require(:show).permit(:name, :category_id, :description, :company, :location_center, :location_radius, :price)
  end

end