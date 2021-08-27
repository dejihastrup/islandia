class BookingsController < ApplicationController

  def index
    @bookings = Booking.all.select do |booking|
    (booking.user == current_user) && (booking.confirmed == true)
    end
    @requests = Booking.all.select do |request|
    (request.user == current_user) && (request.confirmed == false)
    end
  end

  # def requests
  #   @bookings = Booking.all.select do |booking|
  #     booking.island.user == current_user
  #   end
  # end

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
    @booking = Booking.find_by_id(params[:id])
    # @booking = params[:booking_id]
    # redirect_to show if @@booking.confirmed #visitor cannot edit if confirmed
    # render: "host" if @booking.island.user = current_user #host can confirm or not confirm
    #                                         #user can change booking details
  end

  def update
    @booking = Booking.find_by_id(params[:id])
    @booking.update(confirmed: true)
    redirect_to my_islands_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to my_islands_path
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
