class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    if @restaurant.save
      flash[:success] = "Successfully created restaurant!"
      redirect_to @restaurant
    else
      flash[:danger] = "Could not create restaurant."
      render "new"
    end
  end

  def show
    @reviews = Review.where(restaurant_id: @restaurant.id).order("created_at DESC")
  end

  def edit
  end

  def update

    if @restaurant.update(restaurant_params)
      flash[:success] = "Updated restaurant"
      redirect_to restaurants_path
    else
      flash[:danger] = "Error updating this restaurant"
      render "edit"
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to root_path
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone, :website, :image)
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end
end