class ShowsController < ApplicationController
  def new
    @show = Show.new()
  end

  def create
    @show = Show.new(show_params)
    if @show.save?
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
  end

  def update
  end

  def destroy
  end
end
