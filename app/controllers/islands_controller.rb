class IslandsController < ApplicationController
  def index
    @islands = Island.where.not(user_id: current_user.id)
  end

  def show
    @island = Island.find(params[:id])
  end

  def my_islands
    @islands = Island.where(user_id: current_user.id)
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
    @island = Island.find_by_id(params[:id])
  end

  def update
    @island = Island.find_by_id(params[:id])
    @island = Island.update(island_params)
    redirect_to island_path(@island)
  end

  def destroy
    @island = Island.find(params[:id])
    @island.destroy
    redirect_to my_islands_path
  end

  private

  def island_params
    params.require(:island).permit(:name, :price, :location, :squarekm, :number_of_villas, :guests, :wifi, :helicopter, :golf_course, :private_chef, :butlers, :yachts, photos: []);
  end
end
