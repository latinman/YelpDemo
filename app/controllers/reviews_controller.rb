class ReviewsController < ApplicationController

  def index
    @reviews = Review.all
  end

  def new
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      flash[:success] = "Successfully created review!"
      redirect_to @review
    else
      flash[:danger] = "Could not create this review..."
      render "new"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :comment)
  end
end