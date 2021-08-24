class IslandsController < ApplicationController
  def index
    @islands = Island.all
  end

  def show
    @island = Island.find(params[:id])
  end

  def new
    @island = Island.new
  end

  def create
    @island = Island.new(island_params)
    @island.user = current_user
    if @island.save
      redirect_to island_path(@island)
    else
      render :new
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def island_params
    params.require(:island).permit(:name, :price, :location, :squarekm, :number_of_villas, :guests, :wifi, :helicopter, :golf_course, :private_chef, :butlers, :yachts);
  end
end
