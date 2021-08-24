class IslandsController < ApplicationController
  def index
    @islands = Islands.all
  end

  def show

  end

  def new

  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end

  private

  def island_params
    params.require(:island).permit();
  end
end
