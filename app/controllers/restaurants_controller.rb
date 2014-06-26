class RestaurantsController < ApplicationController

  # def show
  #   # @restaurant = Restaurant.find(params[:id])
  #   # @reviews = @restaurant.reviews

  #   # @reservation = current_user.reservations.new
  #   # @reservation.restaurant_id = @restaurant.id
  # end

  def index
    @restaurants = Restaurant.all.first(5)
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = @restaurant.reservations.build
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update_attributes(restaurant_params)
      redirect_to restaurant_path(@restaurant), :notice => "Your update was saved"
    else
      render 'edit'
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to restaurants_path, :notice => "ThanK you for adding a new restaurant"
    else
      render 'new'
    end
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:name, :cuisine, :address, :capacity)
  end
end
