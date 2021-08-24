class BookingsController < ApplicationController

  def index
    @bookings = Booking.all
    # where current user = user
  end

  def show
    @booking = Booking.find(params[:id])
    # where current user = user
  end

  def new
    @booking = Booking.new
    @island = Island.find(params[:island_id])
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.island = Island.find(params[:island_id])
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :confirmed, :user_id, :island_id, :created_at, :updated_at);
  end
   # t.datetime "created_at", precision: 6, null: false ???
   # t.datetime "updated_at", precision: 6, null: false ???
   # t.index ["island_id"], name: "index_bookings_on_island_id" ???
   # t.index ["user_id"], name: "index_bookings_on_user_id" ???
end
