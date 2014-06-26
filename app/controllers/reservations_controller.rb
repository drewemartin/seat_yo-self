class ReservationsController < ApplicationController
  before_filter :load_restaurant

  # def new
  # end

  def create
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to restaurants_path, notice: 'Reservation created successfully!'
    else
      render 'restaurants/show'
    end
  end

  def show
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :party_size)

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
