class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user.id)
  end

  def requests
    @bookings = Booking.all.select do |booking|
      booking.island.user == current_user
    end
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
    @booking.confirmed = false
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  def edit
    # @booking = params[:booking_id]
    # redirect_to show if @@booking.confirmed #visitor cannot edit if confirmed
    # render: "host" if @booking.island.user = current_user #host can confirm or not confirm
    #                                         #user can change booking details
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date);
  end
   # t.datetime "created_at", precision: 6, null: false ???
   # t.datetime "updated_at", precision: 6, null: false ???
   # t.index ["island_id"], name: "index_bookings_on_island_id" ???
   # t.index ["user_id"], name: "index_bookings_on_user_id" ???
end
