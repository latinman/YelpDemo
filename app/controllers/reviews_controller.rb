class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_restaurant
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.restaurant_id = @restaurant.id

    if @review.save
      flash[:success] = "Successfully created review!"
      redirect_to root_path
    else
      flash[:danger] = "Could not create this review..."
      render "new"
    end
  end

  def edit
  end

  def update

    if @review.update(review_params)
      flash[:success] = "Successfully updated your review!"
      redirect_to @review
    else
      flash[:danger] = "Could not edit this review. Please re-edit."
      render "edit"
    end
  end

  def destroy
    @review.destroy
    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end
end