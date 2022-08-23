class ShowsController < ApplicationController
  def new
  end

  def create
  end

  def index
  end

  def show
  end

  def edit
    @show = Show.find(params[:id])
  end

  def update
    @show = Show.find(params[:id])
    @show.update(task_params)
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
