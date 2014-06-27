class ReservationsController < ApplicationController
  before_filter :load_restaurant

  def new
    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user_id = current_user.id

    if @reservation.save
      redirect_to restaurants_path, notice: 'Reservation created successfully!'
    else
      render 'restaurants/show'
    end
  end

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
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(product_params)
      redirect_to reservation_path(@reservation)
    else
      render :edit
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
  end

  private
  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :party_size, :reservation_date)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end
